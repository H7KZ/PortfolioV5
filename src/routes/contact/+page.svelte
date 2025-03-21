<script lang="ts">
	import { _ } from 'svelte-i18n';
	import ContactForm from '$lib/components/pages/contact/ContactForm.svelte';
	import CalendarCallPicker from '$lib/components/pages/contact/CalendarCallPicker.svelte';
</script>

<div class="flex w-full items-center justify-center px-8">
	<div class="flex w-full max-w-[1440px] flex-col gap-32 pt-32">
		<div class="flex justify-between gap-20">
			<div class="flex w-64 shrink-0 flex-col gap-4">
				<h2 class="text-5xl font-normal">
					{$_('contact.fillForm')}
				</h2>
				<p>
					{$_('contact.fillFormDescription')}
				</p>
			</div>
			<ContactForm />
		</div>
		<div class="flex justify-between gap-20">
			<div class="flex w-64 shrink-0 flex-col gap-4">
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
