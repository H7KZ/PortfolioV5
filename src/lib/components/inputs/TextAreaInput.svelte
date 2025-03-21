<script lang="ts">
	import type { FullAutoFill } from 'svelte/elements';

	interface Props {
		value: string;
		label?: string;
		resize?: 'none' | 'both' | 'horizontal' | 'vertical';
		height?: number;
		maxlength?: number;
		autocomplete?: FullAutoFill;
		placeholder?: string;
		required?: boolean;
		readonly?: boolean;
		disabled?: boolean;
		oninput?: (e: Event & { currentTarget: EventTarget & HTMLTextAreaElement }) => void;
		error?: string;
	}

	let {
		value = $bindable(''),
		label,
		resize = 'none',
		height = 8,
		maxlength,
		autocomplete,
		placeholder,
		required,
		readonly,
		disabled,
		oninput,
		error
	}: Props = $props();
</script>

<div class="flex w-full flex-col gap-0.5">
	<label for="textarea-input" class="text-sm font-normal text-neutral-300">
		{label}
		{required ? '*' : ''}
	</label>
	<textarea
		id="textarea-input"
		class="w-full rounded-md border-[1.5px] border-neutral-500 bg-[#ffffff05] p-2 pl-3.5 text-sm text-white placeholder:text-neutral-500"
		style="height: {height}rem"
		class:resize-none={resize === 'none'}
		class:resize-both={resize === 'both'}
		class:resize-horizontal={resize === 'horizontal'}
		class:resize-vertical={resize === 'vertical'}
		bind:value
		{maxlength}
		{autocomplete}
		{placeholder}
		{required}
		{readonly}
		{disabled}
		{oninput}
	></textarea>
	<p class="mt-0.5 h-4 text-xs text-red-400">
		{error}
	</p>
</div>
