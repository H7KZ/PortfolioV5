import { error } from '@sveltejs/kit';
import type { PageLoad } from './$types';

export const load: PageLoad = async ({ params, url }) => {
	try {
		const post = await import(`../../../projects/${params.slug}/${url.searchParams.get('locale') ?? 'en'}.md`);

		return {
			slug: params.slug,
			locale: url.searchParams.get('locale') ?? 'en',
			meta: post.metadata,
			content: post.default
		};
	} catch {
		error(404, `Could not find ${params.slug}`);
	}
};
