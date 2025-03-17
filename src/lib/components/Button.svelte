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

{#if link}
	<a href={link} {target} {onclick}>
		<button class="cursor-pointer rounded-full border-[1.5px] border-white px-6 py-1.25 transition-all hover:bg-[#ffffff18]">
			{@render children()}
		</button>
	</a>
{:else}
	<button class="cursor-pointer rounded-full border-[1.5px] border-white px-6 py-1.25 transition-all hover:bg-[#ffffff18]" {onclick}>
		{@render children()}
	</button>
{/if}
