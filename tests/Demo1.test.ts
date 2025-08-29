import { test, expect, _electron as electron, chromium } from '@playwright/test';

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
      '--user-data-dir=' + path.join(__dirname, '..', 'temp-vscode-data1'),
      '--disable-workspace-trust',
      '--verbose', // Add verbose logging
      '--disable-extension-update-check', // Prevent extension updates
      '--disable-crash-reporter', // Disable crash reporting
      '--open-url',
      '--trusted-domains=https://test.codescan.io'
    ],
    timeout: 60000
  });

  console.log('VS Code launched with args:', [
    workspaceDir,
    '--new-window',
    '--user-data-dir=' + path.join(__dirname, '..', 'temp-vscode-data1'),
    '--disable-workspace-trust'
  ]);

  console.log('VS Code launched, getting context...');

  const context = electronApp.context();
  const page = await context.waitForEvent('page', { timeout: 10000 });
  
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

  console.log('Clicked CodeScan icon, searching for the Add CodeScan Connection button');

  let codescanConnection = page.getByText('Add CodeScan Connection');

  console.log('Add CodeScan Connection button found, proceding to click');
  
  await codescanConnection.click();

  console.log('Taking screenshot...');
  await page.screenshot({ path: 'CodeScanConectionButton.png' });

  console.log('Clicked Add CodeScan Conection button, searching for Generate token Button');

  await page.waitForTimeout(17000);

  const outerFrame = page.frameLocator('iframe.webview.ready');
  const innerFrame = outerFrame.frameLocator('#active-frame');

  // Then use innerFrame to target any element inside the nested iframe
  await innerFrame.getByRole('textbox', { name: 'Server URL' }).fill('https://test.codescan.io');


  // 1. Intercept the shell.openExternal call to capture the URL
  let capturedUrl;
  await electronApp.evaluate(({ shell, dialog }) => {
    // Mock the dialog
    const originalShowMessageBox = dialog.showMessageBox;
    dialog.showMessageBox = async (...args) => {
    return { response: 0, checkboxChecked: false };
  };
  
  // Intercept the openExternal call to capture the URL
  const originalOpenExternal = shell.openExternal;
    shell.openExternal = async (url) => {
      // Store the URL in a global variable so we can retrieve it
      global.capturedUrl = url;
      console.log('Captured URL:', url);
      // Don't actually open the browser
      return Promise.resolve();
    };
  });

  // 2. Click the button that triggers the flow
  await innerFrame.getByRole('button', { name: 'Generate Token' }).click();

  // 3. Wait a bit and retrieve the captured URL
  await new Promise(resolve => setTimeout(resolve, 1000)); // Give it time to trigger
  capturedUrl = await electronApp.evaluate(() => global.capturedUrl);
  console.log('URL to open:', capturedUrl);

  // 4. Open your own Chrome instance with the captured URL
  const browser = await chromium.launch({ 
    headless: false,
    args: ['--start-maximized']
  });

  const wcontext = await  browser.newContext({ 
    viewport: { width: 1920, height: 1080 } 
  });
  const wpage = await wcontext.newPage();

  // 5. Navigate to the captured URL
  await wpage.goto(capturedUrl);
  await wpage.waitForLoadState('networkidle');

  // 6. Control the browser
  console.log('Opened URL in controlled browser:', wpage.url());


  // Click the "Log in with Auth0" button
  await wpage.click('text="Log in with Auth0"');

  // Now you should be on the Auth0 login page
  console.log('Current URL after clicking Auth0:', wpage.url());

  // Wait for login form
  await wpage.waitForSelector('[id="1-submit"]', { state: 'visible' });

  // Fill in the email field using attribute selector
  await wpage.fill('[id="1-email"]', 'raul.hernan@autorabit.com');

  // Fill in the password field  1-password
  await wpage.fill('[id="1-password"]', 'Weakbabytrex12@');

  // Click the LOG IN button 1-submit
  await wpage.click('[id="1-submit"]');

  // After successful login, wait for the authorization page
  console.log('Waiting for authorization page...');

  // Wait for the "Allow Codescan connection?" text to appear
  await wpage.waitForSelector('text="Allow Codescan connection?"', {
   state: 'visible',
   timeout: 30000
  });

  console.log('Authorization page loaded, clicking Allow connection...');

  // Click the "Allow connection" button
  await wpage.click('button:has-text("Allow connection")');

  // Wait for the "Allow Codescan connection?" text to appear
  await wpage.waitForSelector('text="Go back to your IDE to complete the setup."', {
    state: 'visible',
    timeout: 30000
  });

  //newtestorg

  await innerFrame.getByRole('textbox', { name: 'Organization Key' }).fill('newtestorg');

  await page.keyboard.press('Enter');

  await page.waitForTimeout(10000);

  await innerFrame.getByRole('button', { name: 'Save Connection' }).click();

  await page.waitForTimeout(5000);
  ////////////////////////////////////////////////////////////////////////////////

  
  // Click on the CodeScan dropdown in the sidebar (below CONNECTED MODE)
  console.log('Looking for CodeScan dropdown in sidebar...');
  
  // Try to find and click the CodeScan dropdown
  let codescanDropdown = page.locator('.sidebar .codicon-chevron-right').first();
  
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
    console.log('Waiting 30 seconds after CodeScan dropdown click...');
    await page.waitForTimeout(15000);
    
    // Wait for the dropdown to expand and show newtestorg
    await page.waitForTimeout(2000);
    
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
      
    } else {
      console.log('Could not find newtestorg dropdown');
    }
    
  } else {
    console.log('Could not find CodeScan dropdown');
  }

  ///////////////////////////////////////////////////////////////////////////////////
  await page.waitForTimeout(5000);
  await page.keyboard.press('Control+`'); // Ctrl+` opens terminal

  let codescanissuebar  = await page.locator('.action-label:has-text("CodeScan Issue Filter")');

  await codescanissuebar.click();

  console.log('Logged in successfully, redirected to:', wpage.url());
  
  await page.waitForTimeout(10000);
    
  await page.waitForTimeout(600000);
  // Close VS Code
  await electronApp.close();
});