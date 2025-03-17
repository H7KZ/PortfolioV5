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
	import { _ } from 'svelte-i18n';

	let form = $state({
		fullName: '',
		email: '',
		company: '',
		message: '',
		file: '',
		budget: 2500,
		projectType: '',
		deadline: '',
		priority: ''
	});

	let error = $state({
		fullName: '',
		email: '',
		company: '',
		message: '',
		file: '',
		budget: '',
		projectType: '',
		deadline: '',
		priority: ''
	});

	function handleSubmit() {
		console.log(form);
	}
</script>

<div class="flex w-full items-center justify-center px-8">
	<div class="w-full max-w-[1440px] pt-32">
		<div class="flex justify-between gap-20">
			<div class="flex w-64 shrink-0 flex-col gap-4">
				<h2 class="text-5xl font-normal">
					{$_('contact.fillForm')}
				</h2>
				<p>
					{$_('contact.fillFormDescription')}
				</p>
			</div>
			<div class="flex w-full flex-col gap-3">
				<div class="flex w-full flex-row gap-8">
					<TextInput bind:value={form.fullName} label={$_('contact.form.fullName')} placeholder={$_('contact.form.fullNamePlaceholder')} required error={error.fullName} />
					<TextInput bind:value={form.email} label={$_('contact.form.email')} placeholder={$_('contact.form.emailPlaceholder')} required error={error.email} />
					<TextInput bind:value={form.company} label={$_('contact.form.company')} placeholder={$_('contact.form.companyPlaceholder')} />
				</div>
				<div class="relative">
					<TextAreaInput bind:value={form.message} height={14} label={$_('contact.form.message')} placeholder={$_('contact.form.messagePlaceholder')} required error={error.message} />
					<div class="absolute right-3.5 bottom-9.5">
						<FileInput bind:value={form.file} />
					</div>
				</div>
				<SliderInput
					bind:value={form.budget}
					valueLabel={(value) => `€ ${value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')}`}
					min={1000}
					minLabel="€ 1,000"
					max={25000}
					maxLabel="€ 25,000+"
					step={250}
					label={$_('contact.form.budget')}
					required
					error={error.budget}
				/>
				<div class="flex w-full flex-row gap-8">
					<SelectInput
						bind:value={form.projectType}
						options={[
							{ value: '', label: $_('contact.form.projects.none') },
							{ value: 'website', label: $_('contact.form.projects.website') },
							{ value: 'webapp', label: $_('contact.form.projects.webapp') },
							{ value: 'mobileapp', label: $_('contact.form.projects.mobileapp') },
							{ value: 'other', label: $_('contact.form.projects.other') }
						]}
						selected=""
						label={$_('contact.form.projectType')}
					/>
					<div class="w-52 shrink-0">
						<DateInput bind:value={form.deadline} label={$_('contact.form.deadline')} Icon={TablerCalendarWeek} error={error.deadline} />
					</div>
					<div class="w-72 shrink-0">
						<SelectInput
							bind:value={form.priority}
							options={[
								{ value: '', label: $_('contact.form.priorities.none') },
								{ value: 'low', label: $_('contact.form.priorities.low') },
								{ value: 'medium', label: $_('contact.form.priorities.medium') },
								{ value: 'high', label: $_('contact.form.priorities.high') },
								{ value: 'urgent', label: $_('contact.form.priorities.urgent') },
								{ value: 'asap', label: $_('contact.form.priorities.asap') }
							]}
							selected=""
							label={$_('contact.form.priority')}
						/>
					</div>
				</div>
				<div class="mt-4 flex w-full justify-end">
					<BoldButton Icon={MynaUiSend} onclick={handleSubmit}>
						{$_('contact.form.send')}
					</BoldButton>
				</div>
			</div>
			<!-- <TextInput bind:value={textInputValue} label="Name" placeholder="Enter your name" Icon={TablerCalendarWeek} required error="Name is required" />
			<TextAreaInput bind:value={textAreaInputValue} label="Message" placeholder="Textarea" required error="Message is reauered" />
			<FileInput bind:value={fileInputValue} />
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
			<DateInput bind:value={dateInputValue} label="Deadline" placeholder="Enter deadline" Icon={TablerCalendarWeek} required error="Dead is required" />
			<BoldButton Icon={MynaUiSend}>SEND</BoldButton> -->
		</div>
	</div>
</div>
