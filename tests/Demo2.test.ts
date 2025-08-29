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
      '--user-data-dir=' + path.join(__dirname, '..', 'temp-vscode-data1'),
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


  const iframes = await page.locator('iframe').all();
  
  //select the first iframe
  let parentframe = await page.locator('iframe').first();

  console.log("\n=== Iframes found on the page ===");
  for (const iframe of iframes) {
    console.log("iframe class:", await iframe.getAttribute('class'));
    console.log("iframe src:", await iframe.getAttribute('src'));
  }
  //read the class of parentframe to see if we can find it
  console.log("Parentframe class:", await parentframe.getAttribute('class'));
  
  //print the HTML elements on vs  
    if (parentframe) {
    const allTags = await parentframe.evaluate(() => {
    const allElements = document.querySelectorAll('*');

        return Array.from(allElements).slice(0, 900).map(element => {
       
         let tag = `<${element.tagName.toLowerCase()}`;
            // Add important attributes
            if (element.id) tag +=  `id="${element.id}"`;
            if (element.className) tag +=  `class="${element.className}"`;
            if (element.getAttribute('type')) tag += ` type="${element.getAttribute('type')}"`;
            if (element.getAttribute('role')) tag += ` role="${element.getAttribute('role')}"`;

            tag += '>';
            return tag;
        });
    });

    console.log('All HTML tags in document (first 20):');
    allTags.forEach((tag, index) => {
    console.log(`${index + 1}. ${tag}`);
  });
}

  
  
  const firstChild = parentframe.locator('#Document').first();
  const secondchild = firstChild.locator('html >*').first();
  const tirdchild = secondchild.locator('body >*').first();
  //console.log('html:', await tirdchild.getAttribute('role'));
  //const parentframe = page.frameLocator('iframe[src*="your-identifier"]');

// Get all header elements (h1, h2, h3, h4, h5, h6)
  /*const headers = await parentframe.locator('h1, h2, h3, h4, h5, h6').all();

  console.log('Found' + headers.length + 'headers:');

  for (let i = 0; i < headers.length; i++) {
    const header = headers[i];
    const tagName = await header.evaluate(el => el.tagName.toLowerCase());
    const className = await header.getAttribute('class') || 'no-class';
    const id = await header.getAttribute('id') || 'no-id';
    console.log(`${i+1}. <${tagName} class="${className}" id="${id}">`);
  }*/
    //aca me quede ya encontre el primer Iframe, falta llegar al segundo, pausa porque me duele la cabeza, hare algo mas por un rato. lo de abajo no sirve, peo va ahi la idea
   /* const childframe = await page.locator('html').all();
    for (const iframe of childframe) {
    console.log("Style:", await iframe.getAttribute('style'));
   // console.log("iframe src:", await iframe.getAttribute('src'));
  }*/
  //console.log('Child Frame Id:', await childframe.getAttribute('style'))
  // Step 2: Print all frames Playwright knows about
  console.log("\n=== Frames detected by Playwright ===");
  for (const frame of page.frames()) {
    console.log("Frame name:", frame.name());
    console.log("Frame URL:", frame.url());
  }

  await page.mouse.click(300,200);
  console.log('Clicking');
  await page.waitForTimeout(600000);
  // Close VS Code
  await electronApp.close();
});