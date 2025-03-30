<script lang="ts">
	import { _ } from 'svelte-i18n';
</script>

<div class="flex w-full items-center justify-center px-8">
	<div class="flex w-full max-w-[1440px] flex-col gap-32 pt-16 pb-32">
		<div class="flex w-full justify-between gap-20">
			<img src="/images/resume_profile.png" alt="Resumé profile" class="hidden h-full lg:block lg:w-80 xl:w-md" />
			<div class="flex w-full flex-col gap-12">
				<h2 class="xs:text-6xl text-5xl font-normal">
					{$_('resume.jankominek')}
				</h2>
				<div class="flex w-full flex-col gap-1">
					<p class="text-sm text-neutral-500">
						{$_('resume.quickSummaryLabel')}
					</p>
					<p>
						{$_('resume.quickSummary')}
					</p>
				</div>
			</div>
		</div>
		<div class="flex w-full flex-col gap-8 xl:flex-row xl:justify-between xl:gap-20">
			<!-- <div class="flex w-full shrink-0 flex-col gap-4 xl:w-64">
				<h2 class="text-5xl font-normal">
					{$_('contact.bookACall')}
				</h2>
				<p>
					{$_('contact.bookACallDescription')}
				</p>
			</div>
			<CalendarCallPicker /> -->
		</div>
	</div>
</div>
