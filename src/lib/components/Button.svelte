<script lang="ts">
	import type { Snippet } from 'svelte';

	interface Props {
		link?: string;
		target?: string;
		onclick?: (e: MouseEvent) => void;
		children: Snippet<[]>;
	}

	let { link, target, onclick, children }: Props = $props();
</script>

{#snippet Button()}
	<button class="cursor-pointer rounded-full border-[1.5px] border-white px-6 py-1.25 transition-all hover:bg-[#ffffff18]">
		{@render children()}
	</button>
{/snippet}

{#if link}
	<a href={link} {target} {onclick}>
		{@render Button()}
	</a>
{:else}
	{@render Button()}
{/if}
