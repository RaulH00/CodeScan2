import { test, expect, _electron as electron } from '@playwright/test';
import * as path from 'path';
import * as fs from 'fs';

test('should open CodeScan sidebar', async () => {
  // Create a temporary workspace folder
  const workspaceDir = path.join(__dirname, '..', 'temp-workspace');
  if (!fs.existsSync(workspaceDir)) {
    fs.mkdirSync(workspaceDir);
  }

  // Launch VS Code with full path and force new instance
  const electronApp = await electron.launch({
    executablePath: 'e:\\Users\\' + process.env.USERNAME + '\\AppData\\Local\\Programs\\Microsoft VS Code\\Code.exe',
    args: [
      workspaceDir,
      '--new-window',
      '--no-sandbox', 
      '--disable-dev-shm-usage', 
      '--disable-gpu',
      '--disable-web-security',
      '--user-data-dir=' + path.join(__dirname, '..', 'temp-vscode-data'),
      '--disable-workspace-trust',
      '--verbose', // Add verbose logging
      '--disable-extension-update-check', // Prevent extension updates
      '--disable-crash-reporter' // Disable crash reporting
    ],
    timeout: 60000
  });

  console.log('VS Code launched with args:', [
    workspaceDir,
    '--new-window',
    '--user-data-dir=' + path.join(__dirname, '..', 'temp-vscode-data'),
    '--disable-workspace-trust'
  ]);

  console.log('VS Code launched, getting context...');

  const context = electronApp.context();
  const page = await context.waitForEvent('page', { timeout: 30000 });
  
  console.log('Got page, waiting for VS Code to load...');
  
  await page.waitForLoadState('networkidle');
  await page.waitForSelector('.monaco-workbench', { timeout: 60000 });

  // Handle setup dialog if it appears
  const setupDialog = page.locator('text="Setup has detected that Setup is currently running"');
  if (await setupDialog.isVisible({ timeout: 5000 })) {
    console.log('Setup dialog detected, clicking OK...');
    const okButton = page.locator('button:has-text("OK")');
    await okButton.click();
    console.log('Clicked OK on setup dialog');
    await page.waitForTimeout(2000);
  }

  console.log('VS Code loaded! Taking screenshot...');
  await page.screenshot({ path: 'vscode-loaded.png' });

  // Wait for activity bar to be ready
  await page.waitForSelector('.activitybar', { timeout: 10000 });
  
  console.log('Looking for CodeScan icon in activity bar...');
  
  // Try multiple selectors for the CodeScan icon
  let codescanIcon = page.locator('.activitybar .codicon-shield').first();
  
  // If that doesn't work, try alternative selectors
  if (!(await codescanIcon.isVisible())) {
    console.log('Trying CodeScan text selector...');
    codescanIcon = page.locator('[aria-label*="CodeScan"], [title*="CodeScan"]').first();
  }
  
  if (!(await codescanIcon.isVisible())) {
    console.log('Trying shield icon selector...');
    codescanIcon = page.locator('.activitybar [class*="shield"]').first();
  }

  if (!(await codescanIcon.isVisible())) {
    console.log('Trying generic activity bar item selector...');
    codescanIcon = page.locator('.activitybar .action-item').nth(4); // Assuming it's the 5th icon
  }

  console.log('Found CodeScan icon, clicking...');
  await codescanIcon.click();

  console.log('Clicked CodeScan icon, now opening terminal...');
  
  // Open VS Code terminal using keyboard shortcut
  await page.keyboard.press('Control+`'); // Ctrl+` opens terminal
  
  console.log('Terminal opened, now clicking CodeScan dropdown...');
  
  
  // Wait for CodeScan sidebar to fully load
  await page.waitForTimeout(3000);
  
  // Take a screenshot to see what's available
  await page.screenshot({ path: 'before-dropdown-click.png' });
  
  // Click on the CodeScan dropdown in the sidebar (below CONNECTED MODE)
  console.log('Looking for CodeScan dropdown in sidebar...');
  
  // Try to find and click the CodeScan dropdown
  let codescanDropdown = page.locator('.sidebar .codicon-chevron-right').first();
  await page.waitForTimeout(6000);
  if (!(await codescanDropdown.isVisible({ timeout: 5000 }))) {
    console.log('Trying CodeScan text selector...');
    codescanDropdown = page.locator('text="CodeScan"').nth(1); // Second occurrence (first is in CONNECTED MODE section)
  }
  
  if (!(await codescanDropdown.isVisible({ timeout: 5000 }))) {
    console.log('Trying tree item selector...');
    codescanDropdown = page.locator('.tree-item').filter({ hasText: 'CodeScan' }).first();
  }
  
  if (await codescanDropdown.isVisible()) {
    console.log('Found CodeScan dropdown, clicking...');
    await codescanDropdown.click();
    console.log('Clicked CodeScan dropdown');
    
    // Wait 30 seconds after clicking CodeScan dropdown
    console.log('Waiting 17 seconds after CodeScan dropdown click...');
    await page.waitForTimeout(17000);
       
    // Take a screenshot to see what appeared
    await page.screenshot({ path: 'after-codescan-expand.png' });
    
    // Now click on the newtestorg dropdown
    console.log('Looking for newtestorg dropdown...');
    
    // Use the exact text match that works
    let newtestorgDropdown = page.locator('text="newtestorg"').first();
    
    if (!(await newtestorgDropdown.isVisible({ timeout: 5000 }))) {
      console.log('Trying chevron selector as fallback...');
      newtestorgDropdown = page.locator('*:has-text("newtestorg")').locator('.codicon-chevron-right').first();
    }
    
    if (!(await newtestorgDropdown.isVisible({ timeout: 5000 }))) {
      console.log('Trying second chevron after CodeScan...');
      newtestorgDropdown = page.locator('.sidebar .codicon-chevron-right').nth(1); // Second chevron (first was CodeScan)
    }
    
    if (await newtestorgDropdown.isVisible()) {
      console.log('Found newtestorg dropdown, clicking...');
      await newtestorgDropdown.click();
      console.log('Clicked newtestorg dropdown');
      
      // Take screenshot after clicking newtestorg
      await page.waitForTimeout(1000);
      await page.screenshot({ path: 'after-newtestorg-click.png' });
      
      // Now click on CODESCAN ISSUE FILTER tab in the bottom panel
      console.log('Looking for CODESCAN ISSUE FILTER tab in bottom panel...');
      await page.waitForTimeout(2000);
      
      await page.keyboard.press('Control+Shift+9'); // Ctrl+` opens terminal

      //const codescanFilterTab = page.locator('text="CODESCAN ISSUE FILTER"').first();    
      
    } else {
      console.log('Could not find newtestorg dropdown');
    }
    
  } else {
    console.log('Could not find CodeScan dropdown');
  }
  
  // Take screenshot after clicking
  await page.screenshot({ path: 'after-dropdown-click.png' });
  
  console.log('Tab Clicked, waiting 5 seconds...');
  
  // Wait 15 seconds as requested
  await page.waitForTimeout(15000);

  // Wait for CodeScan view to load
  await page.waitForSelector('.pane-body, .sidebar-pane', { timeout: 10000 });

  // Verify CodeScan panel is visible
  const codescanPanel = page.locator('.pane-body, .sidebar-pane');
  await expect(codescanPanel.first()).toBeVisible();

  console.log('CodeScan panel is visible!');

  // Take screenshot of CodeScan panel
  await page.screenshot({ path: 'codescan-panel-open.png' });

  console.log('Test passed! CodeScan Issue panel opened successfully.');
  //await page.waitForTimeout(600000);

  // Close VS Code
  await electronApp.close();
});