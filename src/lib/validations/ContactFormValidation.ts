import type ContactFormInterface from '$lib/interfaces/ContactFormInterface';
import { z } from 'zod';

export const ContactFormValidationSchema = z.object({
	fullName: z.string().nonempty(),
	email: z.string().email().nonempty(),
	company: z.string(),
	message: z.string().nonempty(),
	budget: z.number().min(1000),
	projectType: z.string(),
	features: z.array(z.string()),
	technologies: z.array(z.string()),
	assets: z.array(z.string()),
	audiences: z.array(z.string()),
	hosting: z.string(),
	support: z.string(),
	legals: z.array(z.string()),
	deadline: z.date().nullable(),
	priority: z.string().nonempty()
});

export function validateContactForm(form: ContactFormInterface) {
	return ContactFormValidationSchema.safeParse({
		fullName: form.fullName,
		email: form.email,
		company: form.company,
		message: form.message,
		budget: form.budget,
		projectType: form.projectType,
		features: form.features,
		technologies: form.technologies,
		assets: form.assets,
		audiences: form.audiences,
		hosting: form.hosting,
		support: form.support,
		legals: form.legals,
		deadline: form.deadline ? new Date(form.deadline) : null,
		priority: form.priority
	});
}
