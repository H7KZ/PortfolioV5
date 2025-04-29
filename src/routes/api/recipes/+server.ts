import type { Recipe } from '$lib/types';
import { json, type RequestHandler } from '@sveltejs/kit';

export const GET: RequestHandler = async () => {
	let recipes: Recipe[] = [];

	const paths = import.meta.glob(`../../../recipes/*.md`, { eager: true });

	for (const path in paths) {
		const file = paths[path];
		const slug = path.split('/').at(-1)?.replace('.md', '');

		if (file && typeof file === 'object' && 'metadata' in file && slug) {
			const metadata = file.metadata as Omit<Recipe, 'slug'>;
			const recipe = { ...metadata, slug } satisfies Recipe;
			recipes.push(recipe);
		}
	}

	recipes = recipes.sort((first, second) => new Date(second.date).getTime() - new Date(first.date).getTime());

	return json(recipes);
};
