<script lang="ts">
	import { _ } from 'svelte-i18n';
	import ContactForm from '$lib/components/ContactForm.svelte';
	import CalendarCallPicker from '$lib/components/CalendarCallPicker.svelte';
</script>

<svelte:head>
	<title>Contact — Jan Komínek, Senior Frontend Engineer</title>
	<meta name="description" content="Get in touch with Jan Komínek — Senior Frontend / Fullstack Engineer. Book a 30-min call or fill out the project form for part-time B2B contracts." />
	<meta property="og:title" content="Contact — Jan Komínek, Senior Frontend Engineer" />
	<meta property="og:description" content="Book a call or fill out the project form to work with Jan Komínek, Senior Frontend Engineer, on a part-time B2B basis." />
	<meta property="og:url" content="https://jankominek.com/contact" />
</svelte:head>

<div class="contact-grid">
	<!-- ===== LEFT COL ===== -->
	<div class="contact-intro">
		<div class="mono-label">{$_('contact.hireLabel')}</div>
		<h1 class="serif contact-h1">{$_('contact.h1')}</h1>
		<p class="contact-p">{$_('contact.intro')}</p>

		<div class="contact-options">
			<a href="mailto:contact@jankominek.com" class="contact-option">
				<div class="option-icon mono">@</div>
				<div class="option-info">
					<span class="option-name">{$_('contact.emailDirect')}</span>
					<span class="option-desc mono">contact@jankominek.com</span>
				</div>
				<div class="option-arrow">→</div>
			</a>
			<a href="https://www.linkedin.com/in/jan-kominek" target="_blank" rel="noopener noreferrer" class="contact-option">
				<div class="option-icon mono">in</div>
				<div class="option-info">
					<span class="option-name">LinkedIn</span>
					<span class="option-desc mono">{$_('contact.linkedinSub')}</span>
				</div>
				<div class="option-arrow">→</div>
			</a>
			<a href="#calendar" class="contact-option">
				<div class="option-icon mono">📅</div>
				<div class="option-info">
					<span class="option-name">{$_('contact.bookCall')}</span>
					<span class="option-desc mono">{$_('contact.freeChat')}</span>
				</div>
				<div class="option-arrow">→</div>
			</a>
		</div>

		<div class="what-to-include">
			<div class="mono-label" style="color: var(--accent)">{$_('contact.whatToInclude')}</div>
			<p>{$_('contact.whatToIncludeText')}</p>
		</div>
	</div>

	<!-- ===== RIGHT COL ===== -->
	<div>
		<div class="form-card">
			<div class="form-head">
				<h3 class="serif form-title">{$_('contact.projectBrief')}</h3>
				<div class="mono-label">{$_('contact.formStep')}</div>
			</div>
			<ContactForm />
		</div>

		<div class="book-card" id="calendar">
			<div class="mono-label">{$_('contact.skipForm')}</div>
			<p class="book-desc">{$_('contact.skipFormDesc')}</p>
			<CalendarCallPicker />
		</div>
	</div>
</div>

<style>
	.contact-grid {
		display: grid;
		grid-template-columns: 1fr 1fr;
		gap: 64px;
		max-width: var(--max);
		margin: 0 auto;
		padding: 40px 32px 120px;
	}
	@media (max-width: 900px) {
		.contact-grid {
			grid-template-columns: 1fr;
			gap: 48px;
			padding: 28px 20px 80px;
		}
	}

	.mono-label {
		font-family: var(--font-mono);
		font-size: 11px;
		color: var(--fg-4);
		letter-spacing: 0.1em;
		text-transform: uppercase;
		margin-bottom: 14px;
	}
	.contact-h1 {
		font-size: clamp(32px, 5vw, 56px);
		letter-spacing: -0.025em;
		margin: 0 0 20px;
		line-height: 1;
	}
	.contact-p {
		font-size: 17px;
		line-height: 1.55;
		color: var(--fg-2);
		max-width: 460px;
		margin: 0;
	}

	.contact-options {
		margin-top: 36px;
		display: flex;
		flex-direction: column;
		gap: 10px;
	}
	.contact-option {
		display: grid;
		grid-template-columns: auto 1fr auto;
		gap: 18px;
		padding: 18px 22px;
		border: 1px solid var(--line);
		border-radius: var(--radius);
		background: var(--bg-2);
		text-decoration: none;
		color: var(--fg);
		transition:
			border-color 200ms,
			transform 200ms;
		align-items: center;
	}
	.contact-option:hover {
		border-color: var(--fg-5);
		transform: translateX(4px);
	}
	.option-icon {
		width: 36px;
		height: 36px;
		border-radius: 8px;
		background: var(--bg-3);
		border: 1px solid var(--line);
		display: grid;
		place-items: center;
		font-size: 12px;
		color: var(--fg-3);
	}
	.option-info {
		display: flex;
		flex-direction: column;
		gap: 2px;
	}
	.option-name {
		font-size: 14px;
		font-weight: 500;
	}
	.option-desc {
		font-size: 11px;
		color: var(--fg-4);
	}
	.option-arrow {
		color: var(--fg-4);
		transition: color 200ms;
	}
	.contact-option:hover .option-arrow {
		color: var(--accent);
	}

	.what-to-include {
		margin-top: 40px;
		padding: 18px 22px;
		border: 1px dashed var(--line-2);
		border-radius: var(--radius);
		font-size: 13px;
		color: var(--fg-3);
		line-height: 1.6;
	}
	.what-to-include p {
		margin: 0;
	}

	/* ===== Form card ===== */
	.form-card {
		background: var(--bg-2);
		border: 1px solid var(--line);
		border-radius: var(--radius-lg);
		padding: 28px;
		margin-bottom: 20px;
	}
	.form-head {
		display: flex;
		justify-content: space-between;
		align-items: flex-end;
		margin-bottom: 24px;
		padding-bottom: 18px;
		border-bottom: 1px solid var(--line);
	}
	.form-title {
		margin: 0;
		font-weight: 400;
		font-size: 20px;
	}

	/* ===== Book card ===== */
	.book-card {
		background: var(--bg-2);
		border: 1px solid var(--line);
		border-radius: var(--radius-lg);
		padding: 28px;
	}
	.book-desc {
		font-size: 14px;
		color: var(--fg-2);
		margin: 0 0 20px;
		line-height: 1.55;
	}
</style>
