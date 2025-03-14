<script lang="ts">
	import { _, locale, locales } from 'svelte-i18n';
	import Button from '$lib/components/Button.svelte';
	import Dropdown from '../Dropdown.svelte';
	import circleFlagsComponents from '$lib/utils/circleFlagsComponents';
	import HugeIconsMenu from '$lib/icons/HugeIconsMenu.svelte';
	import Logo from '$lib/icons/Logo.svelte';
</script>

<div class="flex w-full items-center justify-center px-8 pt-10 pb-2">
	<div class="flex w-full max-w-[1440px] items-center justify-between">
		<a href="/">
			<Logo class="h-10 w-10 sm:h-12 sm:w-12" />
		</a>

		<Dropdown width={11} align="right">
			<HugeIconsMenu class="h-7 w-7 transition-all hover:text-neutral-400" />
			{#snippet items()}
				<div class="flex flex-col items-center justify-center gap-10 px-4 pt-4 pb-6">
					<div class="flex flex-col items-center justify-center gap-6">
						<a href="/resume" class="xs:text-base text-base hover:underline">
							{$_('navbar.resume')}
						</a>
						<a href="https://www.linkedin.com/in/jan-kominek" target="_blank" class="xs:text-base text-sm hover:underline">
							{$_('navbar.linkedin')}
						</a>
						<Button link="/contact">
							<p class="xs:text-base text-sm">
								{$_('navbar.hire')}
							</p>
						</Button>
					</div>
					<div class="flex items-center justify-center gap-3">
						{#each $locales as local}
							<button onclick={() => locale.set(local)} class="flex cursor-pointer items-center justify-center">
								<svelte:component this={circleFlagsComponents[local]} class="h-7 w-7" />
							</button>
						{/each}
					</div>
				</div>
			{/snippet}
		</Dropdown>
	</div>
</div>
