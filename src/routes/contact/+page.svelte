<script lang="ts">
	import { _ } from 'svelte-i18n';
	import ContactForm from '$lib/components/pages/contact/ContactForm.svelte';
	import CalendarCallPicker from '$lib/components/pages/contact/CalendarCallPicker.svelte';
	import LongArrow from '$lib/icons/LongArrow.svelte';
</script>

<div class="flex w-full items-center justify-center px-8">
	<div class="flex w-full max-w-[1440px] flex-col gap-32 py-32">
		<div class="flex flex-col gap-8 lg:flex-row lg:justify-between lg:gap-20">
			<div class="flex w-full shrink-0 flex-col gap-4 lg:w-64">
				<h2 class="text-5xl font-normal">
					{$_('contact.fillForm')}
				</h2>
				<p>
					{$_('contact.fillFormDescription')}
				</p>
				<div class="mt-6 hidden items-center gap-4 lg:flex">
					<LongArrow class="h-10" />
					<p class="text-sm">
						{@html $_('contact.orBookACall')}
					</p>
				</div>
			</div>
			<ContactForm />
		</div>
		<div class="flex flex-col gap-8 xl:flex-row xl:justify-between xl:gap-20">
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
	</div>
</div>
