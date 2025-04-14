import type { Project } from '$lib/types';
import { json, type RequestHandler } from '@sveltejs/kit';

export const GET: RequestHandler = async () => {
	// export const GET: RequestHandler = async ({ url }) => {
	// const localeParam = url.searchParams.get('locale') ?? 'en';

	// let match = localeParam.match(/^[a-z]+(?=[-_])/i);

	// if (!match) match = localeParam.match(/^[a-z]+/i);

	// const locale = match ? match[0].toLowerCase() : 'en';

	const locale = 'en';

	let projects: Project[] = [];

	let paths = import.meta.glob(`../../../projects/**/*.md`, { eager: true });

	paths = Object.fromEntries(
		Object.entries(paths).filter(([path]) => {
			const fileLocale = path.split('/').at(-1)?.replace('.md', '');

			if (fileLocale === locale) return true;
		})
	);

	for (const path in paths) {
		const file = paths[path];
		const slug = path.split('/').at(-2);

		if (file && typeof file === 'object' && 'metadata' in file && slug) {
			const metadata = file.metadata as Omit<Project, 'slug'>;
			const post = { ...metadata, slug } satisfies Project;
			projects.push(post);
		}
	}

	projects = projects.sort((first, second) => new Date(second.date).getTime() - new Date(first.date).getTime());

	return json(projects);
};
