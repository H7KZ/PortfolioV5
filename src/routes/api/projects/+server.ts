import type { Project } from '$lib/types';
import { json, type RequestHandler } from '@sveltejs/kit';

export const GET: RequestHandler = async () => {
	let projects: Project[] = [];

	const paths = import.meta.glob('/src/projects/*.md', { eager: true });

	for (const path in paths) {
		const file = paths[path];
		const slug = path.split('/').at(-1)?.replace('.md', '');

		if (file && typeof file === 'object' && 'metadata' in file && slug) {
			const metadata = file.metadata as Omit<Project, 'slug'>;
			const post = { ...metadata, slug } satisfies Project;
			projects.push(post);
		}
	}

	projects = projects.sort((first, second) => new Date(second.date).getTime() - new Date(first.date).getTime());

	return json(projects);
};
