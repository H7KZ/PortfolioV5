<script lang="ts">
	import FileInput from '$lib/components/inputs/FileInput.svelte';
	import SliderInput from '$lib/components/inputs/SliderInput.svelte';
	import TextAreaInput from '$lib/components/inputs/TextAreaInput.svelte';
	import TextInput from '$lib/components/inputs/TextInput.svelte';
	import TablerCalendarWeek from '$lib/icons/TablerCalendarWeek.svelte';

	let textInputValue = $state('');
	let textAreaInputValue = $state('');
	let fileInputValue = $state('');
	let sliderInputValue = $state(2500);
</script>

<div class="flex w-full items-center justify-center px-8">
	<div class="w-full max-w-[1440px]">
		<div class="h-[80rem]">
			<div class="h-12"></div>
			<TextInput bind:value={textInputValue} label="Name" placeholder="Enter your name" Icon={TablerCalendarWeek} required error="Name is required" />
			<div class="h-12"></div>
			<TextAreaInput bind:value={textAreaInputValue} label="Message" placeholder="Textarea" required error="Message is reauered" />
			<div class="h-12"></div>
			<FileInput bind:value={fileInputValue} />
			<div class="h-12"></div>
			<SliderInput
				bind:value={sliderInputValue}
				valueLabel={(value) => `€ ${value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')}`}
				min={1000}
				minLabel="€ 1,000"
				max={25000}
				maxLabel="€ 25,000+"
				step={250}
				label="Budget"
				required
				error="Budget is required"
			/>
		</div>
	</div>
</div>
