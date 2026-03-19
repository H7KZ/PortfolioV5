<script lang="ts">
	import { _, locale, locales } from 'svelte-i18n';
	import { page } from '$app/state';
	import Button from '$lib/components/Button.svelte';
	import Dropdown from '../Dropdown.svelte';
	import circleFlagsComponents from '$lib/utils/circleFlagsComponents';
	import HugeIconsMenu from '$lib/icons/HugeIconsMenu.svelte';
	import Logo from '$lib/icons/Logo.svelte';
</script>

<div class="flex w-full items-center justify-center px-8 pt-10 pb-2">
	<div class="flex w-full max-w-[90rem] items-center justify-between">
		<a href="/" aria-label="Jan Komínek — Home">
			<Logo class="h-10 w-10 sm:h-12 sm:w-12" />
		</a>

		<Dropdown width={11} align="right">
			<HugeIconsMenu class="h-7 w-7 transition-all hover:text-neutral-400" />
			{#snippet items()}
				<div class="flex flex-col items-center justify-center gap-10 px-4 pt-4 pb-6">
					<div class="flex flex-col items-center justify-center gap-6">
						<a
							href="/resume"
							aria-current={page.url.pathname === '/resume' ? 'page' : undefined}
							class="xs:text-base text-base hover:underline"
							class:underline={page.url.pathname === '/resume'}
						>
							{$_('navbar.resume')}
						</a>
						<a
							href="https://www.linkedin.com/in/jan-kominek"
							target="_blank"
							rel="noopener noreferrer"
							class="xs:text-base text-sm hover:underline"
						>
							{$_('navbar.linkedin')}
						</a>
						<a
							href="/blog"
							aria-current={page.url.pathname === '/blog' ? 'page' : undefined}
							class="xs:text-base text-base hover:underline"
							class:underline={page.url.pathname === '/blog'}
						>
							{$_('navbar.blog')}
						</a>
						<Button link="/contact">
							<p class="xs:text-base text-sm">
								{$_('navbar.hire')}
							</p>
						</Button>
					</div>
					<div class="flex items-center justify-center gap-3">
						{#each $locales as local (local)}
							{@const FlagComponent = circleFlagsComponents[local]}
							<button onclick={() => locale.set(local)} class="flex cursor-pointer items-center justify-center" aria-label={`Switch to ${local}`}>
								<FlagComponent class="h-7 w-7" />
							</button>
						{/each}
					</div>
				</div>
			{/snippet}
		</Dropdown>
	</div>
</div>
