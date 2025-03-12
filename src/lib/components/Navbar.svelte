<script lang="ts">
	import { _ } from 'svelte-i18n';
	import Button from './Button.svelte';
</script>

<div class="flex w-full items-center justify-center">
	<div class="flex w-full max-w-[1440px] items-center justify-between pt-10">
		<a href="/">
			<img src="/logo/J.svg" alt="J" class="h-16 w-16" />
		</a>

		<div class="flex items-center justify-center gap-16">
			<a href="/resume" class="text-lg">
				{$_('navbar.resume')}
			</a>
			<a href="https://www.linkedin.com/in/jan-kominek" target="_blank">
				{$_('navbar.linkedin')}
			</a>
			<Button link="/contact">
				<p>
					{$_('navbar.hire')}
				</p>
			</Button>
		</div>
	</div>
</div>
