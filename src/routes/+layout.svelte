<script lang="ts">
	import Navbar from '$lib/components/Navbar.svelte';
	import '../app.css';
	
	let { children } = $props();
</script>

<main>
	<nav>
		<Navbar />
	</nav>
	{@render children()}
</main>
