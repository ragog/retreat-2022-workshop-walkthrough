const { chromium } = require('playwright')
const expect = require('expect');

(async () => {
	const browser = await chromium.launch();
	const context = await browser.newContext();

	const page = await context.newPage();

	await page.goto('https://icanhazdadjoke.com/');

	await page.locator('#nav-menu a:has-text("Search jokes")').click();

	await page.locator('[placeholder="Search terms\\.\\.\\."]').click();
	await page.locator('[placeholder="Search terms\\.\\.\\."]').fill('orange');
	await page.locator('[placeholder="Search terms\\.\\.\\."]').press('Enter');

	await page.screenshot({ path: 'scr1.png' })

	const rows = page.locator('table tr');
	const count = await rows.count()

	expect(count).toEqual(8)

	await context.close();
	await browser.close();
})();