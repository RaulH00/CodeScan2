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
  console.log("\n=== Iframes found on the page ===");
  let parentframe = await page.locator('iframe').first();
  for (const iframe of iframes) {
    console.log("iframe id:", await iframe.getAttribute('class'));
    console.log("iframe src:", await iframe.getAttribute('src'));
  }
  console.log("Parentframe class:", await parentframe.getAttribute('class'));

  //const parentframe = page.frameLocator('iframe[src*="your-identifier"]');

// Get all header elements (h1, h2, h3, h4, h5, h6)
  const headers = await parentframe.locator('h1, h2, h3, h4, h5, h6').all();

  console.log('Found' + headers.length + 'headers:');

  for (let i = 0; i < headers.length; i++) {
    const header = headers[i];
    const tagName = await header.evaluate(el => el.tagName.toLowerCase());
    const className = await header.getAttribute('class') || 'no-class';
    const id = await header.getAttribute('id') || 'no-id';
    console.log(`${i+1}. <${tagName} class="${className}" id="${id}">`);

    //aca me quede ya encontre el primer Iframe, falta llegar al segundo, pausa porque me duele la cabeza, hare algo mas por un rato. lo de abajo no sirve, peo va ahi la idea
   /* const childframe = await page.locator('html').all();
    for (const iframe of childframe) {
    console.log("Style:", await iframe.getAttribute('style'));
   // console.log("iframe src:", await iframe.getAttribute('src'));*/
  }
  //console.log('Child Frame Id:', await childframe.getAttribute('style'))
  // Step 2: Print all frames Playwright knows about
  console.log("\n=== Frames detected by Playwright ===");
  for (const frame of page.frames()) {
    console.log("Frame name:", frame.name());
    console.log("Frame URL:", frame.url());
  }

  await page.mouse.click(300,200);
  console.log('Clicking');
  //let frame = page.frameLocator(class:'webview ready').frameLocator('iframe[id="active-frame"]').getByText('         Generate Token       ');

  //console.log(frame.textContent());
  //let codescangeneratetoken = page.locator('[id = "vscode-button:generateToken"]');
  // Find the webview iframe first
/*const frame = page.frameLocator('iframe[id="active-frame"]');

console.log('Looking for Generate Token button...');

const codescangeneratetoken = frame.locator('vscode-button#generateToken');

// Wait for it to appear
await codescangeneratetoken.waitFor({ state: 'visible', timeout: 30000 });

console.log('Generate Token button found, proceeding to click');

// (Optional) check the button text
const texto = await codescangeneratetoken.textContent();
console.log('Button text:', texto);

// Click the button
try {
  await codescangeneratetoken.click();
  console.log('Generate Token button clicked');
} catch (error) {
  console.error('Error clicking Generate Token button:', error);
}
*/
 /* 
// Step 1: List all iframes on the page
const iframes = await page.locator('iframe').all();
  console.log("\n=== Iframes found on the page ===");
  for (const iframe of iframes) {
    console.log("iframe id:", await iframe.getAttribute('id'));
    console.log("iframe src:", await iframe.getAttribute('src'));
  }

  // Step 2: Print all frames Playwright knows about
  console.log("\n=== Frames detected by Playwright ===");
  for (const frame of page.frames()) {
    console.log("Frame name:", frame.name());
    console.log("Frame URL:", frame.url());
  }

  // Step 3: Attach to the "active-frame" (adjust if different)
  //const frame = page.frame({ name: 'ed88d2d5-a5db-471e-9042-9882b1b48d6d' });

  // Wait until the frame is attached
  let frame = null;
  for (let i = 0; i < 10; i++) {
    frame = page.frame({ url: /.*codescansf\.codescan-vscode.* });
    console.log(frame.url())
    const html = await frame.content();
    console.log("Frame HTML length:", html.length);
    console.log(html.slice(0, 500)); // first 500 chars
    if (frame) break;
    console.log("⏳ Waiting for CodeScan frame...");
    await page.waitForTimeout(1000);
  }

  const result = await frame.evaluate(() => {
    const host = document.querySelector('vscode-button#generateToken');
    if (!host) return "❌ Host <vscode-button> not found";
  
    const inner = host.shadowRoot?.querySelector('button');
    if (!inner) return "❌ ShadowRoot button not found";

    else {inner.click();
    return "✅ Clicked inner button";}
  });

console.log("Result:", result);


  if (!frame) {
    throw new Error("❌ Could not find CodeScan frame after waiting");
  }
  else{
    console.log("✅ Found CodeScan frame");
  }
  

// Debug: list all buttons inside frame
  const allLightButtons = frame.locator('vscode-button >> :light');
  const count = await allLightButtons.count();
  console.log("Found", count, "light DOM button(s)");
  for (let i = 0; i < count; i++) {
    console.log(i, "->", await allLightButtons.nth(i).innerText());
  }

  // Step 4: Try different locators for the Generate Token button
  console.log("\n=== Trying locators ===");

  // Option A: direct with shadow-DOM piercing
  const btnLight = frame.locator('vscode-button:has-text("Generate Token")');
  try {
    await btnLight.waitFor({ state: 'visible', timeout: 10000 });
    console.log("✅ Found button with :light selector");
    await btnLight.click();
  } catch {
    console.log("❌ Could not find button with :light selector");
  }

  // Option B: by role (preferred in Playwright)
  const btnRole = frame.getByRole('button', { name: 'Generate Token' });
  try {
    await btnRole.waitFor({ state: 'visible', timeout: 5000 });
    console.log("✅ Found button with getByRole");
    await btnRole.click();
  } catch {
    console.log("❌ Could not find button with getByRole");
  }*/

  //await vscode.commands.executeCommand('codescan.generateToken');

  /*try {
    await page.evaluate(() => {
      window.postMessage({ command: 'generateToken' }, '*');
    });
  } catch (error) {
    console.log("GG")
  }*/
  await page.waitForTimeout(600000);
  // Close VS Code
  await electronApp.close();
});
