<script lang="ts">
	import BoldButton from '$lib/components/BoldButton.svelte';
	import DateInput from '$lib/components/inputs/DateInput.svelte';
	import FileInput from '$lib/components/inputs/FileInput.svelte';
	import SelectInput from '$lib/components/inputs/SelectInput.svelte';
	import SliderInput from '$lib/components/inputs/SliderInput.svelte';
	import TextAreaInput from '$lib/components/inputs/TextAreaInput.svelte';
	import TextInput from '$lib/components/inputs/TextInput.svelte';
	import MynaUiSend from '$lib/icons/MynaUISend.svelte';
	import TablerCalendarWeek from '$lib/icons/TablerCalendarWeek.svelte';

	let textInputValue = $state('');
	let textAreaInputValue = $state('');
	let fileInputValue = $state('');
	let sliderInputValue = $state(2500);
	let selectInputValue = $state('');
	let dateInputValue = $state('');
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
			<div class="h-12"></div>
			<SelectInput
				bind:value={selectInputValue}
				options={[
					{ value: '', label: 'Select or leave blank' },
					{ value: '1', label: 'Web application' },
					{ value: '2', label: 'Full huge software' },
					{ value: '3', label: 'Not sure ahahah' }
				]}
				selected=""
				label="Project type"
				Icon={TablerCalendarWeek}
			/>
			<div class="h-12"></div>
			<DateInput bind:value={dateInputValue} label="Deadline" placeholder="Enter deadline" Icon={TablerCalendarWeek} required error="Dead is required" />
			<div class="h-12"></div>
			<BoldButton Icon={MynaUiSend}>SEND</BoldButton>
		</div>
	</div>
</div>
