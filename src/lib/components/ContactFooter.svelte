<script lang="ts">
	import { _, locale } from 'svelte-i18n';
	import BoldButton from './BoldButton.svelte';
	import MynaUiSend from '$lib/icons/MynaUISend.svelte';
	import JanKominekName from '$lib/icons/JanKominekName.svelte';
</script>

<div class="bg-special-gradient flex w-full flex-col gap-8 rounded-2xl">
	<div class="flex w-full items-center justify-between px-12 pt-12 pb-20">
		<div class="flex flex-col gap-6">
			<div class="flex flex-col gap-2">
				<p class="text-sm text-neutral-400">
					{$_('footer.contactMe')}
				</p>
				<div>
					{#if $locale === 'en'}
						<div class="flex flex-col gap-3">
							<h3 class="text-5xl text-neutral-400">
								Let’s <span class="font-semibold text-white">discuss</span> your
							</h3>
							<div class="flex items-center gap-4">
								<h3 class="text-5xl text-neutral-400">vision</h3>
								<div>
									<BoldButton Icon={MynaUiSend} link="/contact">Let's talk</BoldButton>
								</div>
								<h3 class="text-5xl font-semibold">with me</h3>
							</div>
						</div>
					{:else if $locale === 'cs'}
						<div class="flex flex-col gap-3">
							<h3 class="text-5xl font-medium text-neutral-400">Probereme se mnou</h3>
							<div class="flex items-center gap-4">
								<div>
									<BoldButton Icon={MynaUiSend} link="/contact">Napište mi</BoldButton>
								</div>
								<h3 class="text-5xl font-semibold">vaši vizi</h3>
							</div>
						</div>
					{/if}
				</div>
			</div>
			<div class="flex items-center gap-2">
				<a href="to:contact@jankominek.com" class="hover:underline">
					{$_('footer.email')}
				</a>
				<p>–</p>
				<a href="https://www.linkedin.com/in/jan-kominek" class="hover:underline">
					{$_('footer.linkedin')}
				</a>
				<p>–</p>
				<a href="https://www.jankominek.com" class="hover:underline">
					{$_('footer.form')}
				</a>
				<p>–</p>
				<a href="/contact#calendar" class="hover:underline">
					{$_('footer.calendar')}
				</a>
			</div>
		</div>
		<JanKominekName class="mt-4 mr-12 h-36 text-neutral-50" />
	</div>
</div>
