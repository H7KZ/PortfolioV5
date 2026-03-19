<script lang="ts">
	import '../app.css';
	import Navbar from '$lib/components/navbar/Navbar.svelte';
	import { onMount } from 'svelte';
	import { locale } from 'svelte-i18n';

	let { children } = $props();

	onMount(() => {
		locale.subscribe((l) => {
			localStorage.setItem('locale', l || window.navigator.language || 'en');
		});

		locale.set(localStorage.getItem('locale') || 'en');
	});
</script>

<a
	href="#main-content"
	class="sr-only focus:not-sr-only focus:fixed focus:top-4 focus:left-4 focus:z-[9999] focus:rounded-md focus:bg-white focus:px-4 focus:py-2 focus:text-sm focus:font-medium focus:text-black"
>
	Skip to main content
</a>
<div class="flex h-full min-h-screen w-full flex-col">
	<header>
		<Navbar />
	</header>
	<main id="main-content" class="flex-1">
		{@render children()}
	</main>
</div>
