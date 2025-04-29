<script lang="ts">
	import type { Recipe } from '$lib/types';
	import { _ } from 'svelte-i18n';

	let recipes: Recipe[] = $state([]);

	$effect(() => {
		getRecipes().then((data) => {
			recipes = data;
		});
	});

	async function getRecipes() {
		const response = await fetch(`/api/recipes`);
		return await response.json();
	}
</script>

<div class="flex w-full items-center justify-center px-8">
	<div class="w-full max-w-[90rem] pt-16 pb-32">
		<div class="mb-64 flex w-full flex-col gap-8">
			<div class="flex flex-wrap justify-center gap-6">
				{#each recipes as recipe}
					<a href={`/recipes/${recipe.slug}`} class="group rounded-xl bg-neutral-900 px-4 py-4">
						<div class="flex w-full max-w-[28.75rem] min-w-[17rem] flex-col gap-2">
							{#if recipe.thumbnail}
								<img src={recipe.thumbnail} alt={recipe.title} class="w-full rounded-lg" />
							{/if}

							<h4 class="text-2xl group-hover:underline">{recipe.title}</h4>

							<div class="flex w-full items-center justify-between gap-1 pt-2">
								<p class="font-robotomono text-sm text-neutral-400">
									{new Date(recipe.date).getUTCDate()}/{new Date(recipe.date).getUTCMonth()}/{new Date(recipe.date).getUTCFullYear()}
								</p>
							</div>
						</div>
					</a>
				{/each}
			</div>
		</div>
	</div>
</div>
