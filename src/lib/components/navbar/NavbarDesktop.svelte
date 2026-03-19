<script lang="ts">
	import { _, locale, locales } from 'svelte-i18n';
	import { page } from '$app/state';
	import Button from '$lib/components/Button.svelte';
	import Dropdown from '../Dropdown.svelte';
	import TablerLanguage from '$lib/icons/TablerLanguage.svelte';
	import circleFlagsComponents from '$lib/utils/circleFlagsComponents';
	import Logo from '$lib/icons/Logo.svelte';
</script>

<div class="flex w-full items-center justify-center px-8 pt-10 pb-2">
	<div class="flex w-full max-w-[90rem] items-center justify-between">
		<a href="/" aria-label="Jan Komínek — Home">
			<Logo class="h-12 w-12 lg:h-14 lg:w-14" />
		</a>

		<div class="flex items-center justify-center gap-16">
			<a
				href="/resume"
				aria-current={page.url.pathname === '/resume' ? 'page' : undefined}
				class="text-base hover:underline lg:text-lg"
				class:underline={page.url.pathname === '/resume'}
			>
				{$_('navbar.resume')}
			</a>
			<a href="https://www.linkedin.com/in/jan-kominek" target="_blank" rel="noopener noreferrer" class="text-base hover:underline lg:text-lg">
				{$_('navbar.linkedin')}
			</a>
			<a
				href="/blog"
				aria-current={page.url.pathname === '/blog' ? 'page' : undefined}
				class="text-base hover:underline lg:text-lg"
				class:underline={page.url.pathname === '/blog'}
			>
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
						{#each $locales as local (local)}
							{@const FlagComponent = circleFlagsComponents[local]}
							<button onclick={() => locale.set(local)} class="flex cursor-pointer items-center justify-center" aria-label={`Switch to ${local}`}>
								<FlagComponent class="h-7 w-7" />
							</button>
						{/each}
					</div>
				{/snippet}
			</Dropdown>
		</div>
	</div>
</div>
