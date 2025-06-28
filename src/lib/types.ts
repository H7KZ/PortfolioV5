export type Project = {
	slug: string;
	date: string;
	title: string;
	thumbnail: string;
	tags: string[];
};

export type Post = {
	slug: string;
	date: string;
	title: string;
	author: string;
	thumbnail: string | null;
	tags: string[];
};
