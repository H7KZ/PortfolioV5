<script lang="ts">
	import { goto } from '$app/navigation';
	import Button from '$lib/components/Button.svelte';
	import TextInput from '$lib/components/inputs/TextInput.svelte';
	import { _ } from 'svelte-i18n';

	let form = $state({
		code: ''
	});

	async function handleSubmit(e: MouseEvent) {
		console.log('Form submitted:', form);
		e.preventDefault();

		if (form.code !== '211') return

		await goto('/fragment/1.txt');
	}
</script>

<div class="flex w-full pt-32 flex-col justify-center items-center gap-3">
	<div class="w-full max-w-xs px-4 flex flex-col gap-8">
		<TextInput
			bind:value={form.code}
			label="Ověřovací kód"
			required
		/>
		<Button onclick={handleSubmit}>
			Odemknout
		</Button>
	</div>
</div>
