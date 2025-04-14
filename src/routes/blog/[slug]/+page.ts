import { error } from '@sveltejs/kit';
import type { PageLoad } from './$types';
import type { Post } from '$lib/types';

export interface PostData {
	slug: string;
	locale: string;
	meta: Post;
	// eslint-disable-next-line @typescript-eslint/no-explicit-any
	content: any;
}

export const load: PageLoad = async ({ params, url }): Promise<PostData> => {
	try {
		const post = await import(`../../../posts/${params.slug}/${url.searchParams.get('locale') ?? 'en'}.md`);

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
