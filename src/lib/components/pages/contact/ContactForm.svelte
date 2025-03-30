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
	import MultiSelectInput from '$lib/components/inputs/MultiSelectInput.svelte';

	const pb = new PocketBase('https://api.jankominek.com');

	let form = $state({
		fullName: '',
		email: '',
		company: '',
		message: '',
		budget: 2500,
		projectType: '',
		features: [] as string[],
		technologies: [] as string[],
		assets: [] as string[],
		audiences: [] as string[],
		hosting: '',
		support: '',
		legals: [] as string[],
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
		technologies: '',
		assets: '',
		audiences: '',
		hosting: '',
		support: '',
		legals: '',
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
		technologies: z.array(z.string()),
		assets: z.array(z.string()),
		audiences: z.array(z.string()),
		hosting: z.string(),
		support: z.string(),
		legals: z.array(z.string()),
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
			technologies: form.technologies,
			assets: form.assets,
			audiences: form.audiences,
			hosting: form.hosting,
			support: form.support,
			legals: form.legals,
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
				technologies: form.technologies.join(', '),
				assets: form.assets.join(', '),
				audiences: form.audiences.join(', '),
				hosting: form.hosting,
				support: form.support,
				legals: form.legals.join(', '),
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
			technologies: [],
			assets: [],
			audiences: [],
			hosting: '',
			support: '',
			legals: [],
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
			technologies: '',
			assets: '',
			audiences: '',
			hosting: '',
			support: '',
			legals: '',
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
		<div class="flex w-full flex-col gap-3">
			<div class="flex w-full flex-col gap-3 xl:flex-row xl:gap-8">
				<div class="w-full xl:max-w-1/2">
					<SelectInput
						bind:value={form.projectType}
						options={[
							{ value: '', label: $_('contact.form.projects.none') },
							{ value: 'website', label: $_('contact.form.projects.website') },
							{ value: 'webApp', label: $_('contact.form.projects.webApp') },
							{ value: 'ecommerce', label: $_('contact.form.projects.ecommerce') },
							{ value: 'saas', label: $_('contact.form.projects.saas') },
							{ value: 'api', label: $_('contact.form.projects.api') },
							{ value: 'mobileApp', label: $_('contact.form.projects.mobileApp') },
							{ value: 'desktopApp', label: $_('contact.form.projects.desktopApp') },
							{ value: 'admin', label: $_('contact.form.projects.admin') },
							{ value: 'landingPage', label: $_('contact.form.projects.landingPage') },
							{ value: 'other', label: $_('contact.form.projects.other') }
						]}
						height={20}
						label={$_('contact.form.projectType')}
						selected={form.projectType}
						error={error.projectType}
					/>
				</div>
				<div class="w-full xl:max-w-1/2">
					<MultiSelectInput
						bind:value={form.features}
						options={[
							{ value: 'auth', label: $_('contact.form.features.auth') },
							{ value: 'admin', label: $_('contact.form.features.admin') },
							{ value: 'payment', label: $_('contact.form.features.payment') },
							{ value: 'database', label: $_('contact.form.features.database') },
							{ value: 'files', label: $_('contact.form.features.files') },
							{ value: 'notifications', label: $_('contact.form.features.notifications') },
							{ value: 'realtime', label: $_('contact.form.features.realtime') },
							{ value: 'i18n', label: $_('contact.form.features.i18n') },
							{ value: 'analytics', label: $_('contact.form.features.analytics') },
							{ value: 'seo', label: $_('contact.form.features.seo') },
							{ value: 'customAPI', label: $_('contact.form.features.customAPI') },
							{ value: 'thirdParty', label: $_('contact.form.features.thirdParty') },
							{ value: 'responsive', label: $_('contact.form.features.responsive') },
							{ value: 'other', label: $_('contact.form.features.other') }
						]}
						height={20}
						label={$_('contact.form.feature')}
						error={error.features}
						oninput={() => (error.features = '')}
						placeholder={$_('contact.form.featurePlaceholder')}
					/>
				</div>
			</div>
			<div class="flex w-full flex-col gap-3 xl:flex-row xl:gap-8">
				<div class="w-full xl:max-w-1/2">
					<MultiSelectInput
						bind:value={form.technologies}
						options={[
							{ value: 'wordpress', label: $_('contact.form.technologies.wordpress') },
							{ value: 'vuejs', label: $_('contact.form.technologies.vuejs') },
							{ value: 'reactjs', label: $_('contact.form.technologies.reactjs') },
							{ value: 'svelte', label: $_('contact.form.technologies.svelte') },
							{ value: 'tailwind', label: $_('contact.form.technologies.tailwind') },
							{ value: 'nodejs', label: $_('contact.form.technologies.nodejs') },
							{ value: 'typescript', label: $_('contact.form.technologies.typescript') },
							{ value: 'sql', label: $_('contact.form.technologies.sql') },
							{ value: 'nosql', label: $_('contact.form.technologies.nosql') },
							{ value: 'graphql', label: $_('contact.form.technologies.graphql') },
							{ value: 'cache', label: $_('contact.form.technologies.cache') },
							{ value: 'docker', label: $_('contact.form.technologies.docker') },
							{ value: 'aws', label: $_('contact.form.technologies.aws') },
							{ value: 'gcp', label: $_('contact.form.technologies.gcp') },
							{ value: 'azure', label: $_('contact.form.technologies.azure') },
							{ value: 'vps', label: $_('contact.form.technologies.vps') },
							{ value: 'restAPI', label: $_('contact.form.technologies.restAPI') },
							{ value: 'websocket', label: $_('contact.form.technologies.websocket') },
							{ value: 'other', label: $_('contact.form.technologies.other') }
						]}
						height={20}
						label={$_('contact.form.technology')}
						error={error.technologies}
						oninput={() => (error.technologies = '')}
						placeholder={$_('contact.form.technologyPlaceholder')}
					/>
				</div>
				<div class="w-full xl:max-w-1/2">
					<MultiSelectInput
						bind:value={form.assets}
						options={[
							{ value: 'design', label: $_('contact.form.assets.design') },
							{ value: 'codebase', label: $_('contact.form.assets.codebase') },
							{ value: 'database', label: $_('contact.form.assets.database') },
							{ value: 'branding', label: $_('contact.form.assets.branding') },
							{ value: 'documentation', label: $_('contact.form.assets.documentation') },
							{ value: 'domain', label: $_('contact.form.assets.domain') },
							{ value: 'hosting', label: $_('contact.form.assets.hosting') },
							{ value: 'other', label: $_('contact.form.assets.other') }
						]}
						height={20}
						label={$_('contact.form.asset')}
						error={error.assets}
						oninput={() => (error.assets = '')}
						placeholder={$_('contact.form.assetPlaceholder')}
					/>
				</div>
			</div>
			<div class="flex w-full flex-col gap-3 xl:flex-row xl:gap-8">
				<div class="w-full xl:max-w-1/2">
					<MultiSelectInput
						bind:value={form.audiences}
						options={[
							{ value: 'public', label: $_('contact.form.audiences.public') },
							{ value: 'b2b', label: $_('contact.form.audiences.b2b') },
							{ value: 'b2c', label: $_('contact.form.audiences.b2c') },
							{ value: 'startup', label: $_('contact.form.audiences.startup') },
							{ value: 'internal', label: $_('contact.form.audiences.internal') },
							{ value: 'enterprise', label: $_('contact.form.audiences.enterprise') },
							{ value: 'nonprofit', label: $_('contact.form.audiences.nonprofit') },
							{ value: 'developer', label: $_('contact.form.audiences.developer') },
							{ value: 'other', label: $_('contact.form.audiences.other') }
						]}
						height={20}
						label={$_('contact.form.audience')}
						error={error.audiences}
						oninput={() => (error.audiences = '')}
						placeholder={$_('contact.form.audiencePlaceholder')}
					/>
				</div>
				<div class="w-full xl:max-w-1/2">
					<SelectInput
						bind:value={form.hosting}
						options={[
							{ value: '', label: $_('contact.form.hostings.none') },
							{ value: 'client', label: $_('contact.form.hostings.client') },
							{ value: 'need', label: $_('contact.form.hostings.need') },
							{ value: 'server', label: $_('contact.form.hostings.server') },
							{ value: 'other', label: $_('contact.form.hostings.other') }
						]}
						height={20}
						label={$_('contact.form.hosting')}
						selected={form.hosting}
						error={error.hosting}
						oninput={() => (error.hosting = '')}
					/>
				</div>
			</div>
			<div class="flex w-full flex-col gap-3 xl:flex-row xl:gap-8">
				<div class="w-full xl:max-w-1/2">
					<SelectInput
						bind:value={form.support}
						options={[
							{ value: '', label: $_('contact.form.supports.none') },
							{ value: 'onetime', label: $_('contact.form.supports.onetime') },
							{ value: 'ongoing', label: $_('contact.form.supports.ongoing') },
							{ value: 'training', label: $_('contact.form.supports.training') },
							{ value: 'consultation', label: $_('contact.form.supports.consultation') },
							{ value: 'updates', label: $_('contact.form.supports.updates') },
							{ value: 'other', label: $_('contact.form.supports.other') }
						]}
						height={20}
						label={$_('contact.form.support')}
						selected={form.support}
						error={error.support}
						oninput={() => (error.support = '')}
					/>
				</div>
				<div class="w-full xl:max-w-1/2">
					<MultiSelectInput
						bind:value={form.legals}
						options={[
							{ value: 'nda', label: $_('contact.form.legals.nda') },
							{ value: 'contract', label: $_('contact.form.legals.contract') },
							{ value: 'standard', label: $_('contact.form.legals.standard') },
							{ value: 'gdpr', label: $_('contact.form.legals.gdpr') },
							{ value: 'other', label: $_('contact.form.legals.other') }
						]}
						height={20}
						label={$_('contact.form.legal')}
						error={error.legals}
						oninput={() => (error.legals = '')}
						placeholder={$_('contact.form.legalPlaceholder')}
					/>
				</div>
			</div>
		</div>
	</Accordition>
	<div class="flex w-full justify-end gap-3 xl:flex-row xl:gap-8">
		<div class="hidden w-full xl:block xl:max-w-1/2"></div>
		<div class="flex w-full flex-col gap-3 sm:flex-row xl:max-w-1/2 xl:gap-8">
			<div class="w-full xl:w-52 xl:shrink-0">
				<DateInput
					bind:value={form.deadline}
					label={$_('contact.form.deadline')}
					Icon={TablerCalendarWeek}
					error={error.deadline}
					oninput={() => (error.deadline = '')}
				/>
			</div>
			<div class="w-full xl:w-full">
				<SelectInput
					bind:value={form.priority}
					options={[
						{ value: '', label: $_('contact.form.priorities.none') },
						{ value: 'low', label: $_('contact.form.priorities.low') },
						{ value: 'medium', label: $_('contact.form.priorities.medium') },
						{ value: 'high', label: $_('contact.form.priorities.high') },
						{ value: 'critical', label: $_('contact.form.priorities.critical') },
						{ value: 'asap', label: $_('contact.form.priorities.asap') }
					]}
					height={20}
					label={$_('contact.form.priority')}
					selected={form.priority}
					error={error.priority}
					oninput={() => (error.priority = '')}
				/>
			</div>
		</div>
	</div>
	<div class="mt-4 flex w-full flex-col items-end gap-4">
		<BoldButton Icon={MynaUiSend} type="submit" onclick={handleSubmit}>
			{$_('contact.form.send')}
		</BoldButton>
		<p class="h-4 text-sm" class:text-red-400={error.api} class:text-green-400={success}>
			{error.api || success}
		</p>
	</div>
</form>
