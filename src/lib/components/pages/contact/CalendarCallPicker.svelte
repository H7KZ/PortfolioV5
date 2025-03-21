<script lang="ts">
	import { onMount } from 'svelte';

	onMount(() => {
		(function (C, A, L) {
			let p = function (a: { (): void; q: any }, ar: IArguments | string[]) {
				a.q.push(ar);
			};

			let d = C.document;

			C.Cal =
				C.Cal ||
				function () {
					let cal = C.Cal;
					let ar = arguments;

					if (!cal.loaded) {
						cal.ns = {};
						cal.q = cal.q || [];
						d.head.appendChild(d.createElement('script')).src = A;
						cal.loaded = true;
					}

					if (ar[0] === L) {
						const api = function () {
							p(api, arguments);
						} as any;

						const namespace = ar[1];
						api.q = api.q || [];

						if (typeof namespace === 'string') {
							cal.ns[namespace] = cal.ns[namespace] || api;
							p(cal.ns[namespace], ar);
							p(cal, ['initNamespace', namespace]);
						} else p(cal, ar);

						return;
					}

					p(cal, ar);
				};
		})(window, 'https://app.cal.com/embed/embed.js', 'init');

		window.Cal('init', '30min', { origin: 'https://cal.com' });

		window.Cal.ns['30min']('inline', {
			elementOrSelector: '#my-cal-inline',
			config: { layout: 'month_view', theme: 'dark' },
			calLink: 'jankominek/30min'
		});

		window.Cal.ns['30min']('ui', {
			theme: 'dark',
			cssVarsPerTheme: { light: { 'cal-brand': '#161616' }, dark: { 'cal-brand': '#ffffff' } },
			hideEventTypeDetails: false,
			layout: 'month_view'
		});
	});
</script>

<div class="h-full w-full max-w-[980px] !overflow-hidden" id="my-cal-inline"></div>

<style scoped>
	@media (min-width: 848px) {
		#my-cal-inline {
			height: 490px !important;
		}
	}
</style>
