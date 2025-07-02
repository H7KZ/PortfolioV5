<script lang="ts">
	import { _, locale } from 'svelte-i18n';
	import BoldButton from './BoldButton.svelte';
	import MynaUiSend from '$lib/icons/MynaUISend.svelte';
	import JanKominekName from '$lib/icons/JanKominekName.svelte';
</script>

<div class="bg-special-gradient flex w-full flex-col gap-8 rounded-2xl">
	<div class="flex w-full items-center justify-between gap-32 px-12 pt-12 pb-20">
		<div class="flex flex-col gap-6 sm:shrink-0">
			<div class="flex flex-col gap-2">
				<p class="text-sm text-neutral-400">
					{$_('footer.contactMe')}
				</p>
				<div>
					{#if $locale === 'en'}
						<div class="hidden flex-col gap-3 sm:flex">
							<h3 class="text-4xl text-neutral-400 xl:text-5xl">
								Let’s <span class="font-semibold text-white">discuss</span> your
							</h3>
							<div class="flex items-center gap-3 xl:gap-4">
								<h3 class="text-4xl text-neutral-400 xl:text-5xl">vision</h3>
								<div>
									<BoldButton Icon={MynaUiSend} link="/contact">Let's talk</BoldButton>
								</div>
								<h3 class="text-4xl font-semibold xl:text-5xl">with me</h3>
							</div>
						</div>
						<div class="flex flex-col gap-3 sm:hidden">
							<h3 class="text-4xl text-neutral-400 xl:text-5xl">
								Let’s <span class="font-semibold text-white">discuss</span> your vision <span class="font-semibold text-white">with me</span>
							</h3>
							<div>
								<BoldButton Icon={MynaUiSend} link="/contact">Let's talk</BoldButton>
							</div>
						</div>
					{:else if $locale === 'cs'}
						<div class="hidden flex-col gap-3 sm:flex">
							<h3 class="text-4xl font-medium text-neutral-400 xl:text-5xl">Probereme se mnou</h3>
							<div class="flex items-center gap-4">
								<div>
									<BoldButton Icon={MynaUiSend} link="/contact">Napište mi</BoldButton>
								</div>
								<h3 class="text-4xl font-semibold xl:text-5xl">vaši vizi</h3>
							</div>
						</div>
						<div class="flex flex-col gap-3 sm:hidden">
							<h3 class="text-4xl text-neutral-400 xl:text-5xl">
								Probereme se mnou <span class="font-semibold text-white">vaši vizi</span>
							</h3>
							<div>
								<BoldButton Icon={MynaUiSend} link="/contact">Napište mi</BoldButton>
							</div>
						</div>
					{/if}
				</div>
			</div>
			<div class="flex flex-wrap items-center gap-2">
				<a href="mailto:contact@jankominek.com" class="hover:underline">
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
		<JanKominekName class="mt-4 mr-12 hidden h-36 w-auto text-neutral-50 lg:block" />
	</div>
</div>
