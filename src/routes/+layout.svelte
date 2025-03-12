<script lang="ts">
	import '../app.css';
	import Navbar from '$lib/components/navbar/Navbar.svelte';

	let { children } = $props();
</script>

<main>
	<nav>
		<Navbar />
	</nav>
	{@render children()}
</main>
