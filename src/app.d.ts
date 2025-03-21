declare global {
	namespace App {}

	interface Window {
		// eslint-disable-next-line @typescript-eslint/no-explicit-any
		Cal: any;
	}
}

export {};
