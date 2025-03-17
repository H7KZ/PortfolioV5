<script lang="ts">
	import type { Component, Snippet } from 'svelte';

	interface Props {
		link?: string;
		target?: string;
		Icon?: Component;
		onclick?: (e: MouseEvent) => void;
		children: Snippet<[]>;
	}

	let { link, target, Icon, onclick, children }: Props = $props();
</script>

{#if link}
	<a href={link} {target} {onclick}>
		<button class="cursor-pointer rounded-full px-6 py-1.25 transition-all hover:bg-[#ffffff18]">
			{@render children()}
		</button>
	</a>
{:else}
	<button class="group flex h-10 cursor-pointer flex-row items-center justify-center transition-all" {onclick}>
		<div class="text-background flex h-full items-center justify-center rounded-full bg-neutral-200 px-4 text-center text-xl font-bold transition-all group-hover:bg-white">
			{@render children()}
		</div>
		<div class="text-background flex h-full w-10 -translate-x-0.75 transform items-center justify-center rounded-full bg-neutral-200 text-center font-bold transition-all group-hover:bg-white">
			{#if Icon}
				<Icon class="text-background h-6 w-6" />
			{/if}
		</div>
	</button>
{/if}
