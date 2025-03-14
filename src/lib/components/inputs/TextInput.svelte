<script lang="ts">
	import type { Component } from 'svelte';

	interface Props {
		value: string;
		label?: string;
		placeholder?: string;
		Icon?: Component;
		required?: boolean;
		readonly?: boolean;
		oninput?: (e: Event & { currentTarget: EventTarget & HTMLInputElement }) => void;
		error?: string;
	}

	let { value = $bindable(''), label, placeholder, Icon, required, readonly, oninput, error }: Props = $props();
</script>

<div class="flex w-full flex-col gap-0.5">
	<label for="text-input" class="text-sm font-normal text-neutral-300">
		{label}
		{required ? '*' : ''}
	</label>
	<div class="relative w-full">
		<input
			id="text-input"
			type="text"
			class="h-10 w-full rounded-md border-[1.5px] border-neutral-500 bg-[#ffffff05] p-2 pl-3.5 text-base text-white placeholder:text-neutral-500"
			class:pl-11.5={Icon}
			bind:value
			{placeholder}
			{required}
			{readonly}
			{oninput}
		/>
		{#if Icon}
			<div class="pointer-events-none absolute top-1/2 left-3 -translate-y-1/2">
				<Icon class="h-6 w-6 text-neutral-400" />
			</div>
		{/if}
	</div>
	<p class="mt-0.5 h-4 text-xs text-red-400">
		{error}
	</p>
</div>
