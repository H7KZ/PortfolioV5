import { error } from '@sveltejs/kit';
import type { PageLoad } from './$types';
import type { Project } from '$lib/types';

export interface ProjectData {
	slug: string;
	locale: string;
	meta: Project;
	// eslint-disable-next-line @typescript-eslint/no-explicit-any
	content: any;
}

export const load: PageLoad = async ({ params, url }): Promise<ProjectData> => {
	const locale = url.searchParams.get('locale') ?? 'en';

	try {
		const post = await import(`../../../projects/${params.slug}/${locale}.md`);

		return {
			slug: params.slug,
			locale: locale,
			meta: post.metadata,
			content: post.default
		};
	} catch {
		error(404, `Could not find ${params.slug}`);
	}
};
