<script lang="ts">
	import { _, json } from 'svelte-i18n';
	import ContactFooter from '$lib/components/ContactFooter.svelte';
</script>

<div class="flex w-full flex-col items-center justify-center">
	<div class="flex w-full max-w-[1440px] flex-col gap-32 px-8 pt-16 pb-32 min-[1440px]:px-2">
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
	</div>
	<div class="bg-background flex w-full flex-col items-center justify-center">
		<div class="flex w-full max-w-[1440px] flex-col gap-32 px-8 py-24 min-[1440px]:px-2">
			<div class="flex w-full flex-col gap-4 md:flex-row md:gap-8">
				<h2 class="xs:text-3xl w-full shrink-0 text-2xl font-normal md:w-1/3">
					{$_('resume.aboutLabel')}
				</h2>
				<div class="flex w-full flex-col gap-8">
					{#each $json('resume.about') as string[] as about}
						<p>
							{about}
						</p>
					{/each}
				</div>
			</div>
		</div>
	</div>
	<div class="h-[1.5px] w-full bg-neutral-800"></div>
	<div class="bg-background flex w-full flex-col items-center justify-center">
		<div class="flex w-full max-w-[1440px] flex-col gap-32 px-8 py-16 min-[1440px]:px-2">
			<div class="flex w-full flex-col gap-4 md:flex-row md:gap-8">
				<h2 class="xs:text-3xl w-full shrink-0 text-2xl font-normal md:w-1/3">
					{$_('resume.experienceLabel')}
				</h2>
				<div class="flex w-full flex-col gap-8">
					{#each $json('resume.experience') as { company: string; position: string }[] as experience}
						<div class="flex w-full flex-col gap-1">
							<p class="font-medium">
								{experience.company}
							</p>
							<p class="text-neutral-500">
								{experience.position}
							</p>
						</div>
					{/each}
				</div>
			</div>
		</div>
	</div>
	<div class="h-[1.5px] w-full bg-neutral-800"></div>
	<div class="bg-background flex w-full flex-col items-center justify-center">
		<div class="flex w-full max-w-[1440px] flex-col gap-32 px-8 py-16 min-[1440px]:px-2">
			<div class="flex w-full flex-col gap-4 md:flex-row md:gap-8">
				<h2 class="xs:text-3xl w-full shrink-0 text-2xl font-normal md:w-1/3">
					{$_('resume.educationLabel')}
				</h2>
				<div class="flex w-full flex-col gap-8">
					{#each $json('resume.education') as { school: string; degree: string }[] as education}
						<div class="flex w-full flex-col gap-1">
							<p class="font-medium">
								{education.school}
							</p>
							<p class="text-neutral-500">
								{education.degree}
							</p>
						</div>
					{/each}
				</div>
			</div>
		</div>
	</div>
	<div class="h-[1.5px] w-full bg-neutral-800"></div>
	<div class="bg-background flex w-full flex-col items-center justify-center">
		<div class="flex w-full max-w-[1440px] flex-col gap-32 px-8 pt-24 pb-32 min-[1440px]:px-2">
			<div class="flex w-full flex-col gap-4 md:flex-row md:gap-8">
				<h2 class="xs:text-3xl w-full shrink-0 text-2xl font-normal md:w-1/3">
					{$_('resume.toolsLabel')}
				</h2>
				<div class="flex w-full flex-wrap gap-1">
					{#each $json('resume.tools') as string[] as tool}
						<p class="text-neutral-500" class:text-white={tool.startsWith('!')}>
							{tool.replace('!', '')}
						</p>
						<p class="text-neutral-500 last:hidden">/</p>
					{/each}
				</div>
			</div>
		</div>
	</div>
	<div class="flex w-full items-center justify-center px-8">
		<div class="w-full max-w-[1440px] pt-16 pb-32">
			<ContactFooter />
		</div>
	</div>
</div>
