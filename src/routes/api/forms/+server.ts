import { error, json } from '@sveltejs/kit';
import type { RequestHandler } from './$types';
import type ContactFormInterface from '$lib/interfaces/ContactFormInterface';
import { validateContactForm } from '$lib/validations/ContactFormValidation';
import { env } from '$env/dynamic/private';

export const POST: RequestHandler = async ({ request }) => {
	const form: ContactFormInterface = await request.json();

	const validationResult = validateContactForm(form);

	if (!validationResult.success) error(400, { message: 'Validation failed' });

	await fetch(env.WEBHOOK_URL, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify({
			content: `
**New contact form submission**\n
**Name:** ${form.fullName}\n
**Email:** ${form.email}\n
${form.company ? `**Company:** ${form.company}\n` : ''}
**Message:** ${form.message}\n
**Budget:** ${form.budget}\n
${form.projectType ? `**Project Type:** ${form.projectType}\n` : ''}
${form.features.length ? `**Features:**\n- ${form.features.join('\n- ')}\n` : ''}
${form.technologies.length ? `**Technologies:**\n- ${form.technologies.join('\n- ')}\n` : ''}
${form.assets.length ? `**Assets:**\n- ${form.assets.join('\n- ')}\n` : ''}
${form.audiences.length ? `**Audiences:**\n- ${form.audiences.join('\n- ')}\n` : ''}
${form.hosting ? `**Hosting:** ${form.hosting}\n` : ''}
${form.support ? `**Support:** ${form.support}\n` : ''}
${form.legals.length ? `**Legals:**\n- ${form.legals.join('\n- ')}\n` : ''}
${form.deadline ? `**Deadline:** ${form.deadline}\n` : ''}
${form.priority ? `**Priority:** ${form.priority}\n` : ''}
**Timestamp:** ${new Date().toISOString()}
`
		})
	}).catch((err) => {
		console.error('Error sending webhook:', err);
		throw error(500, { message: 'Failed to send webhook' });
	});

	return json({ success: true });
};
