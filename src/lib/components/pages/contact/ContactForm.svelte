<script lang="ts">
	import BoldButton from '$lib/components/BoldButton.svelte';
	import DateInput from '$lib/components/inputs/DateInput.svelte';
	import SelectInput from '$lib/components/inputs/SelectInput.svelte';
	import SliderInput from '$lib/components/inputs/SliderInput.svelte';
	import TextAreaInput from '$lib/components/inputs/TextAreaInput.svelte';
	import TextInput from '$lib/components/inputs/TextInput.svelte';
	import MynaUiSend from '$lib/icons/MynaUISend.svelte';
	import TablerCalendarWeek from '$lib/icons/TablerCalendarWeek.svelte';
	import { _ } from 'svelte-i18n';
	import PocketBase from 'pocketbase';
	import { z } from 'zod';
	import Accordition from '$lib/components/Accordition.svelte';

	const pb = new PocketBase('https://api.jankominek.com');

	let form = $state({
		fullName: '',
		email: '',
		company: '',
		message: '',
		budget: 2500,
		projectType: '',
		features: [],
		deadline: '',
		priority: ''
	});

	let error = $state({
		fullName: '',
		email: '',
		company: '',
		message: '',
		budget: '',
		projectType: '',
		features: '',
		deadline: '',
		priority: '',
		api: ''
	});

	let success = $state('');

	const formSchema = z.object({
		fullName: z.string().nonempty(),
		email: z.string().email().nonempty(),
		company: z.string(),
		message: z.string().nonempty(),
		budget: z.number().min(1000),
		projectType: z.string().nonempty(),
		features: z.array(z.string()),
		deadline: z.date().nullable(),
		priority: z.string().nonempty()
	});

	async function handleSubmit(e: MouseEvent) {
		e.preventDefault();

		const validationResult = formSchema.safeParse({
			fullName: form.fullName,
			email: form.email,
			company: form.company,
			message: form.message,
			budget: form.budget,
			projectType: form.projectType,
			features: form.features,
			deadline: form.deadline ? new Date(form.deadline) : null,
			priority: form.priority
		});

		if (!validationResult.success) {
			const errors = validationResult.error.errors;
			errors.forEach((e) => {
				const key = e.path.find((p) => Object.keys(form).includes(p.toString())) as keyof typeof form;
				const message = $_(`contact.form.errors.${key}.${e.code}`);
				error[key] = message;
			});
			return;
		}

		try {
			await pb.collection('forms').create({
				fullName: form.fullName,
				email: form.email,
				company: form.company,
				message: form.message,
				budget: form.budget,
				projectType: form.projectType,
				features: form.features.join(', '),
				deadline: form.deadline ? new Date(form.deadline) : null,
				priority: form.priority
			});
		} catch (e) {
			error.api = $_('contact.form.errors.api');
			return;
		}

		success = $_('contact.form.success');

		form = {
			fullName: '',
			email: '',
			company: '',
			message: '',
			budget: 2500,
			projectType: '',
			features: [],
			deadline: '',
			priority: ''
		};

		error = {
			fullName: '',
			email: '',
			company: '',
			message: '',
			budget: '',
			projectType: '',
			features: '',
			deadline: '',
			priority: '',
			api: ''
		};
	}
</script>

<form class="flex w-full flex-col gap-3">
	<div class="flex w-full flex-col gap-3 xl:flex-row xl:gap-8">
		<div class="flex w-full flex-col gap-3 sm:flex-row sm:gap-8">
			<TextInput
				bind:value={form.fullName}
				label={$_('contact.form.fullName')}
				placeholder={$_('contact.form.fullNamePlaceholder')}
				required
				error={error.fullName}
				oninput={() => (error.fullName = '')}
			/>
			<TextInput
				bind:value={form.email}
				label={$_('contact.form.email')}
				placeholder={$_('contact.form.emailPlaceholder')}
				required
				error={error.email}
				oninput={() => (error.email = '')}
			/>
		</div>
		<div class="w-full xl:w-1/2">
			<TextInput
				bind:value={form.company}
				label={$_('contact.form.company')}
				placeholder={$_('contact.form.companyPlaceholder')}
				error={error.company}
				oninput={() => (error.email = '')}
			/>
		</div>
	</div>
	<TextAreaInput
		bind:value={form.message}
		height={14}
		label={$_('contact.form.message')}
		placeholder={$_('contact.form.messagePlaceholder')}
		required
		error={error.message}
		oninput={() => (error.message = '')}
	/>
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
		oninput={() => (error.budget = '')}
	/>
	<Accordition title={$_('contact.form.advanced')}>
		<div class="flex w-full flex-col gap-3 xl:flex-row xl:gap-8">
			<SelectInput
				bind:value={form.projectType}
				options={[
					{ value: '', label: $_('contact.form.projects.none'), selected: true },
					{ value: 'website', label: $_('contact.form.projects.website') },
					{ value: 'webapp', label: $_('contact.form.projects.webapp') },
					{ value: 'mobileapp', label: $_('contact.form.projects.mobileapp') },
					{ value: 'other', label: $_('contact.form.projects.other') }
				]}
				label={$_('contact.form.projectType')}
				error={error.projectType}
			/>
			<div class="flex w-full flex-col gap-3 sm:flex-row sm:gap-8">
				<div class="w-full xl:w-52 xl:shrink-0">
					<DateInput
						bind:value={form.deadline}
						label={$_('contact.form.deadline')}
						Icon={TablerCalendarWeek}
						error={error.deadline}
						oninput={() => (error.deadline = '')}
					/>
				</div>
				<div class="w-full xl:w-72 xl:shrink-0">
					<SelectInput
						bind:value={form.priority}
						options={[
							{ value: '', label: $_('contact.form.priorities.none'), selected: true },
							{ value: 'low', label: $_('contact.form.priorities.low') },
							{ value: 'medium', label: $_('contact.form.priorities.medium') },
							{ value: 'high', label: $_('contact.form.priorities.high') },
							{ value: 'urgent', label: $_('contact.form.priorities.urgent') },
							{ value: 'asap', label: $_('contact.form.priorities.asap') }
						]}
						label={$_('contact.form.priority')}
						error={error.priority}
						oninput={() => (error.priority = '')}
					/>
				</div>
			</div>
		</div>
	</Accordition>
	<div class="mt-4 flex w-full flex-col items-end gap-4">
		<BoldButton Icon={MynaUiSend} type="submit" onclick={handleSubmit}>
			{$_('contact.form.send')}
		</BoldButton>
		<p class="h-4 text-sm" class:text-red-400={error.api} class:text-green-400={success}>
			{error.api || success}
		</p>
	</div>
</form>
