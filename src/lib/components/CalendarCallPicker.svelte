<script lang="ts">
	import { onMount } from 'svelte';

	onMount(async () => {
		const { initNamespace, configureInlineCalendar, configureUI } = await import('$lib/utils/calcom');

		initNamespace();
		configureInlineCalendar('cal');
		configureUI();
	});
</script>

<div class="h-full w-full max-w-[1040px] !overflow-hidden" id="cal"></div>
