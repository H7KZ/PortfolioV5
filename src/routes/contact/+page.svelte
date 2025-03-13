<script lang="ts">
	import TextInput from '$lib/components/inputs/TextInput.svelte';

	let textInputValue = $state('');
</script>

<div class="flex w-full items-center justify-center px-8">
	<div class="w-full max-w-[1440px]">
		<div class="h-[80rem]">
			<div class="h-12"></div>
			<TextInput bind:value={textInputValue} label="Name" placeholder="Enter your name" icon="fluent:rename-20-regular" required error="Name is required" />
		</div>
	</div>
</div>
