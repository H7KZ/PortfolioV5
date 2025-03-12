<script lang="ts">
	import type { Snippet } from 'svelte';

	interface Props {
		link?: string;
		target?: string;
		children: Snippet<[]>;
	}

	let { link, target, children }: Props = $props();
</script>

<a href={link} {target}>
	<button class="border-primary cursor-pointer rounded-full border-[1.5px] px-6 py-1.5 transition-all hover:bg-[#ffffff18]">
		{@render children()}
	</button>
</a>
