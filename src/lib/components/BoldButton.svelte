<script lang="ts">
	import type { Component, Snippet } from 'svelte';

	interface Props {
		type?: 'button' | 'submit' | 'reset';
		link?: string;
		target?: string;
		Icon?: Component;
		onclick?: (e: MouseEvent) => void;
		children: Snippet<[]>;
	}

	let { type = 'button', link, target, Icon, onclick, children }: Props = $props();

	let spinButton = $state(false);

	function handleClick(e: MouseEvent) {
		spinButton = true;
		setTimeout(() => (spinButton = false), 1050);

		if (onclick) onclick(e);
	}
</script>

{#snippet BoldButton()}
	<button {type} class="group flex h-10 cursor-pointer flex-row items-center justify-center transition-all" onclick={handleClick}>
		<div
			class="text-background flex h-full items-center justify-center rounded-full bg-neutral-50 px-4 text-center text-xl font-semibold transition-all group-hover:bg-neutral-200"
		>
			{@render children()}
		</div>
		<div
			class="text-background flex h-full w-10 -translate-x-0.75 transform items-center justify-center rounded-full bg-neutral-50 text-center font-bold transition-all group-hover:bg-neutral-200"
		>
			{#if Icon}
				<Icon class="text-background h-6 w-6 {spinButton ? 'rotate-360 transition-all duration-1000' : ''}" />
			{/if}
		</div>
	</button>
{/snippet}

{#if link}
	<a href={link} {target}>
		{@render BoldButton()}
	</a>
{:else}
	{@render BoldButton()}
{/if}
