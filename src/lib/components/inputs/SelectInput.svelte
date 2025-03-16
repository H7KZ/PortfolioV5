<script lang="ts">
	import IconamoonArrowUp from '$lib/icons/IconamoonArrowUp.svelte';
	import type { Component } from 'svelte';
	import type { FullAutoFill } from 'svelte/elements';

	interface Props {
		value: string;
		options: { value: string; label: string; disabled?: boolean }[];
		selected?: string;
		label?: string;
		autocomplete?: FullAutoFill;
		Icon?: Component;
		required?: boolean;
		disabled?: boolean;
		oninput?: (e: Event & { currentTarget: EventTarget & HTMLSelectElement }) => void;
		error?: string;
	}

	let { value = $bindable(''), options, selected, label, autocomplete, Icon, required, disabled, oninput, error }: Props = $props();

	let isOpened = $state(false);
</script>

<div class="flex w-full flex-col gap-0.5">
	<label for="select-input" class="text-sm font-normal text-neutral-300">
		{label}
		{required ? '*' : ''}
	</label>
	<div class="relative w-full">
		<select
			id="select-input"
			class="h-10 w-full cursor-pointer rounded-md border-[1.5px] border-neutral-500 bg-[#ffffff05] p-2 px-3 text-base"
			class:px-10.5={Icon}
			class:text-neutral-500={value === ''}
			bind:value
			{autocomplete}
			{required}
			{disabled}
			{oninput}
			onfocus={() => (isOpened = true)}
			onblur={() => (isOpened = false)}
		>
			{#each options as option}
				<option
					value={option.value}
					selected={selected === option.value}
					disabled={option.disabled}
					class="bg-neutral-900 text-base"
					class:text-white={option.value !== ''}
					class:text-neutral-500={option.value === ''}
				>
					{option.label}
				</option>
			{/each}
		</select>
		{#if Icon}
			<div class="pointer-events-none absolute top-1/2 left-3 -translate-y-1/2">
				<Icon class="h-6 w-6 text-neutral-400" />
			</div>
		{/if}
		<div>
			<IconamoonArrowUp
				class="
					absolute top-1/2 right-2.5 h-7 w-7 -translate-y-1/2 text-neutral-400 transition-all
					{isOpened ? 'rotate-180' : ''}
				"
			/>
		</div>
	</div>
	<p class="mt-0.5 h-4 text-xs text-red-400">
		{error}
	</p>
</div>

<style scoped>
	select {
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
		text-indent: 1px;
		text-overflow: '';
	}

	select::-ms-expand {
		display: none;
	}
</style>
