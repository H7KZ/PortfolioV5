<script lang="ts">
	import type { Component } from 'svelte';
	import type { FullAutoFill } from 'svelte/elements';

	interface Props {
		id?: string;
		value: string;
		label?: string;
		autocomplete?: FullAutoFill;
		placeholder?: string;
		Icon?: Component;
		required?: boolean;
		readonly?: boolean;
		disabled?: boolean;
		oninput?: (e: Event & { currentTarget: EventTarget & HTMLInputElement }) => void;
		error?: string;
	}

	let {
		id = crypto.randomUUID(),
		value = $bindable(''),
		label,
		autocomplete,
		placeholder,
		Icon,
		required,
		readonly,
		disabled,
		oninput,
		error
	}: Props = $props();
</script>

<div class="flex w-full flex-col gap-0.5">
	<label for={id} class="text-sm font-normal text-neutral-300">
		{label}
		{required ? '*' : ''}
	</label>
	<div class="relative w-full">
		<input
			{id}
			type="text"
			class="h-10 w-full rounded-md border-[1.5px] border-neutral-500 bg-[#ffffff03] p-2 pl-3.5 text-base text-white placeholder:text-neutral-500"
			class:pl-11.5={Icon}
			bind:value
			{autocomplete}
			{placeholder}
			{required}
			{readonly}
			{disabled}
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
