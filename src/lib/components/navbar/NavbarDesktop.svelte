<script lang="ts">
	import { _, locale, locales } from 'svelte-i18n';
	import Button from '$lib/components/Button.svelte';
	import Dropdown from '../Dropdown.svelte';
	import TablerLanguage from '$lib/icons/TablerLanguage.svelte';
	import circleFlagsComponents from '$lib/utils/circleFlagsComponents';
	import Logo from '$lib/icons/Logo.svelte';
</script>

<div class="flex w-full items-center justify-center px-8 pt-10 pb-2">
	<div class="flex w-full max-w-[1440px] items-center justify-between">
		<a href="/">
			<Logo class="h-12 w-12 lg:h-14 lg:w-14" />
		</a>

		<div class="flex items-center justify-center gap-16">
			<a href="/resume" class="text-base hover:underline lg:text-lg">
				{$_('navbar.resume')}
			</a>
			<a href="https://www.linkedin.com/in/jan-kominek" target="_blank" class="text-base hover:underline lg:text-lg">
				{$_('navbar.linkedin')}
			</a>
			<a href="/blog" class="text-base hover:underline lg:text-lg">
				{$_('navbar.blog')}
			</a>
			<Button link="/contact">
				<p class="text-base lg:text-lg">
					{$_('navbar.hire')}
				</p>
			</Button>
			<Dropdown autoOpen width={3} align="center">
				<TablerLanguage class="h-7.5 w-7.5 transition-all hover:text-neutral-400" />
				{#snippet items()}
					<div class="flex flex-col items-center justify-center gap-4 py-3">
						{#each $locales as local}
							<button onclick={() => locale.set(local)} class="flex cursor-pointer items-center justify-center">
								<svelte:component this={circleFlagsComponents[local]} class="h-7 w-7" />
							</button>
						{/each}
					</div>
				{/snippet}
			</Dropdown>
		</div>
	</div>
</div>
