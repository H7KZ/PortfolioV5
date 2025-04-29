import { error } from '@sveltejs/kit';
import type { PageLoad } from './$types';
import type { Post } from '$lib/types';

export interface PostData {
	slug: string;
	meta: Post;
	// eslint-disable-next-line @typescript-eslint/no-explicit-any
	content: any;
}

export const load: PageLoad = async ({ params }): Promise<PostData> => {
	try {
		const post = await import(`../../../recipes/${params.slug}.md`);

		return {
			slug: params.slug,
			meta: post.metadata,
			content: post.default
		};
	} catch {
		error(404, `Could not find ${params.slug}`);
	}
};
