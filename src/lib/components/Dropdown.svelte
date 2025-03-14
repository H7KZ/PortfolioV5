<script lang="ts">
	import { clickOutside, tapOutside } from '$lib/utils/clickOutside';
	import type { Snippet } from 'svelte';

	interface Props {
		autoOpen?: boolean;
		width?: number;
		align?: 'left' | 'center' | 'right';
		items?: Snippet<[]>;
		children: Snippet<[]>;
	}

	let { autoOpen = false, width = 8, align = 'left', children, items }: Props = $props();

	let isOpen = $state(false);

	export { isOpen };
</script>

<div
	class="relative"
	onmouseover={() => autoOpen && (isOpen = true)}
	onmouseleave={() => autoOpen && (isOpen = false)}
	onfocus={() => autoOpen && (isOpen = true)}
	onblur={() => autoOpen && (isOpen = false)}
	use:clickOutside={() => (isOpen = false)}
	use:tapOutside={() => (isOpen = false)}
	role="menu"
	tabindex="0"
>
	<button onclick={() => (isOpen = !isOpen)} class="flex cursor-pointer items-center justify-center gap-2">
		{@render children()}
	</button>

	<div
		class="absolute top-full z-50"
		class:invisible={!isOpen}
		class:opacity-0={!isOpen}
		class:left-0={align === 'left'}
		class:left-[50%]={align === 'center'}
		class:translate-x-[-50%]={align === 'center'}
		class:right-0={align === 'right'}
		style="width: {width}rem;"
	>
		<div class="h-2 w-full"></div>
		<div class="rounded-lg bg-neutral-800">
			{@render items?.()}
		</div>
	</div>
</div>
