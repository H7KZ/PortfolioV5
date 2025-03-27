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

<main class="h-full min-h-screen w-full">
	<nav>
		<Navbar />
	</nav>
	{@render children()}
</main>
