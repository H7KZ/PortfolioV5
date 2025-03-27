<script lang="ts">
	import IconamoonArrowUp from '$lib/icons/IconamoonArrowUp.svelte';
	import type { Snippet } from 'svelte';

	interface Props {
		opened?: boolean;
		title?: string;
		children: Snippet<[]>;
	}

	let { opened = false, title = '', children }: Props = $props();

	let isOpened = $state(false);

	export { isOpened };
</script>

<div class="flex h-full w-full flex-col gap-6">
	<button type="button" onclick={() => (isOpened = !isOpened)} class="flex cursor-pointer items-center gap-4">
		<IconamoonArrowUp class="h-5 w-5 shrink-0 rotate-90 text-neutral-400 transition-all {isOpened ? 'rotate-180' : ''}" />
		<p class="shrink-0 text-sm text-neutral-300 italic">
			{title}
		</p>
		<div class="mr-1.5 ml-2.5 h-[1px] w-full bg-neutral-700">
			<!-- This is a line that will be displayed when the accordion is opened. -->
		</div>
	</button>

	<div class="w-full" class:h-0={!isOpened} class:opacity-0={!isOpened} class:overflow-hidden={!isOpened} class:h-full={isOpened}>
		{@render children()}
	</div>
</div>
