<script lang="ts">
	import { _ } from 'svelte-i18n';
	import Button from '$lib/components/Button.svelte';
</script>

<div class="flex w-full items-center justify-center px-8 pt-10 pb-2">
	<div class="flex w-full max-w-[1440px] items-center justify-between">
		<a href="/">
			<img src="/logo/J.svg" alt="J" class="h-12 w-12 lg:h-14 lg:w-14" />
		</a>

		<div class="flex items-center justify-center gap-16">
			<a href="/resume" class="text-base hover:underline lg:text-lg">
				{$_('navbar.resume')}
			</a>
			<a href="https://www.linkedin.com/in/jan-kominek" target="_blank" class="text-base hover:underline lg:text-lg">
				{$_('navbar.linkedin')}
			</a>
			<Button link="/contact">
				<p class="text-base lg:text-lg">
					{$_('navbar.hire')}
				</p>
			</Button>
			<div>
				<img src="/icons/language.svg" alt="Lang" class="h-6 w-6" />
			</div>
		</div>
	</div>
</div>
