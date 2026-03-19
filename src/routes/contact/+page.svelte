<script lang="ts">
	import { _ } from 'svelte-i18n';
	import ContactForm from '$lib/components/ContactForm.svelte';
	import CalendarCallPicker from '$lib/components/CalendarCallPicker.svelte';
	import LongArrow from '$lib/icons/LongArrow.svelte';
	import ContactFooter from '$lib/components/ContactFooter.svelte';
</script>

<svelte:head>
	<title>Contact — Jan Komínek, Senior Frontend Engineer</title>
	<meta
		name="description"
		content="Get in touch with Jan Komínek — Senior Frontend / Fullstack Engineer. Book a 30-min call or fill out the project form for part-time B2B contracts."
	/>
	<meta property="og:title" content="Contact — Jan Komínek, Senior Frontend Engineer" />
	<meta
		property="og:description"
		content="Book a call or fill out the project form to work with Jan Komínek, Senior Frontend Engineer, on a part-time B2B basis."
	/>
	<meta property="og:url" content="https://jankominek.com/contact" />
</svelte:head>

<div class="flex w-full items-center justify-center px-8">
	<div class="flex w-full max-w-[90rem] flex-col gap-32 py-32">
		<div class="flex w-full flex-col gap-8 lg:flex-row lg:justify-between lg:gap-20">
			<div class="flex w-full shrink-0 flex-col gap-4 lg:w-64">
				<h1 class="text-5xl font-normal">
					{$_('contact.fillForm')}
				</h1>
				<p>
					{$_('contact.fillFormDescription')}
				</p>
				<div class="mt-6 hidden items-center gap-4 lg:flex">
					<LongArrow class="h-10" />
					<a href="#calendar" class="text-sm">
						<!-- eslint-disable-next-line svelte/no-at-html-tags -->
						{@html $_('contact.orBookACall')}
					</a>
				</div>
			</div>
			<ContactForm />
		</div>
		<div class="flex w-full flex-col gap-8 xl:flex-row xl:justify-between xl:gap-20" id="calendar">
			<div class="flex w-full shrink-0 flex-col gap-4 xl:w-64">
				<h2 class="text-5xl font-normal">
					{$_('contact.bookACall')}
				</h2>
				<p>
					{$_('contact.bookACallDescription')}
				</p>
			</div>
			<CalendarCallPicker />
		</div>
		<ContactFooter />
	</div>
</div>
