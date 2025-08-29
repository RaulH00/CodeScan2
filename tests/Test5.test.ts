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
  
  console.log('Looking for Extensions icon in activity bar...');
  
  // Try multiple selectors for the CodeScan icon
  let codescanIcon = page.locator('.activitybar .codicon-extensions-view-icon').first();
  
  // If that doesn't work, try alternative selectors
  if (!(await codescanIcon.isVisible())) {
    console.log('Trying Extensions text selector...');
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

  console.log('Found Extensions icon, clicking...');
  await codescanIcon.click();

  console.log('Clicked Extensions icon, searching for the CodeScan Extension');

  await page.getByRole('textbox').fill('CodeScan');
  //let searchextensions = page.getByRole('textbox');

  //await searchextensions.click();

  //await searchextensions.fill('CodeScan');
  
  console.log('Found CodeScan extension, proceding to click and install');
  await page.waitForTimeout(600000);

});