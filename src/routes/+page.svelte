<script lang="ts">
	import ContactFooter from '$lib/components/ContactFooter.svelte';
	import type { Project } from '$lib/types';
	import { _, locale } from 'svelte-i18n';
	import { trackEvent } from '$lib/utils/analytics';

	let projects: Project[] = $state([]);

	$effect(() => {
		getProjects($locale).then((data) => {
			projects = data;
		});
	});

	async function getProjects(l: string | null | undefined) {
		const response = await fetch(`/api/projects?locale=${l}`);
		return await response.json();
	}

	type CardSize = 'featured' | 'wide' | 'narrow' | 'default';

	const bentoConfig: Record<
		string,
		{
			size: CardSize;
			company: string;
			role: string;
			desc: string;
			chips?: string[];
			badge?: string;
			ctaKey: 'viewProject' | 'readCaseStudy';
		}
	> = {
		corac_sith: {
			size: 'featured',
			badge: '◆ Flagship',
			company: 'CORAC ENGINEERING',
			role: 'SENIOR FRONTEND',
			desc: 'Client-side hash-chain verification, D3.js supply-chain graphs, and zero-trust auth for a sensitive EO data pipeline. 1yr+ ongoing, sole frontend engineer.',
			chips: ['Vue 3', 'D3.js', 'AWS Cognito', 'Vite', 'pnpm', 'Shadcn'],
			ctaKey: 'readCaseStudy'
		},
		iont_charge: {
			size: 'wide',
			company: 'IONT TECH',
			role: 'FULLSTACK',
			desc: 'Public EV-charger payment gateway. ČSOB integration, Docker Swarm, Fastify + MongoDB.',
			chips: ['SvelteKit', 'Fastify', 'Docker Swarm', 'MongoDB'],
			ctaKey: 'readCaseStudy'
		},
		corac_scorecard: {
			size: 'narrow',
			company: 'CORAC',
			role: 'FRONTEND',
			desc: 'Cyber audit tool. NIS2 compliance, PDF export.',
			ctaKey: 'viewProject'
		},
		iont_admin: {
			size: 'wide',
			company: 'IONT TECH',
			role: 'FULLSTACK',
			desc: 'Charger control panel with real-time firmware updates and station diagnostics.',
			chips: ['SvelteKit', 'Fastify', 'Redis', 'WebSockets'],
			ctaKey: 'viewProject'
		},
		iont_info: {
			size: 'narrow',
			company: 'IONT',
			role: 'FULLSTACK',
			desc: 'Public-facing EV charger info app.',
			ctaKey: 'viewProject'
		},
		pangolin: {
			size: 'default',
			company: 'WORK',
			role: 'FRONTEND',
			desc: 'Interactive analytics dashboard with complex data viz.',
			chips: ['React', 'Chart.js'],
			ctaKey: 'viewProject'
		},
		noteful: {
			size: 'default',
			company: 'PERSONAL',
			role: 'FULLSTACK',
			desc: 'Note-taking app with tag hierarchies & real-time sync.',
			chips: ['Vue', 'Node'],
			ctaKey: 'viewProject'
		},
		disenchantment: {
			size: 'default',
			company: 'PERSONAL',
			role: 'JAVA',
			desc: 'Desktop utility app. Java + JavaFX.',
			chips: ['JavaFX'],
			ctaKey: 'viewProject'
		}
	};

	const serviceChips = [
		['Architecture', 'Full-stack', 'DevOps'],
		['Refactor', 'CI / CD', 'Docker'],
		['Mentoring', 'Code review', 'System design']
	];

	const testimonials = [
		{
			quote:
				'"His problem-solving skills and experienced approach shined through. He is excellent at explaining tools and procedures to less experienced team members. Anyone would be lucky to have him."',
			name: 'Amelie Engelmaierová',
			role: 'Software Engineering · Same team, 2 projects',
			initials: 'AE'
		},
		{
			quote:
				'"Jan\'s ability to tackle complex technical solutions and successfully overcome challenges was truly remarkable. He displayed not only technical expertise but also management skills — breaking work into smaller items so multiple team members could contribute seamlessly."',
			name: 'Petr Krejčí',
			role: 'Senior Backend Developer · Direct manager, Precismo',
			initials: 'PK'
		},
		{
			quote:
				'"Happy to recommend him for his amazing problem-solving skills and fast learning pace. He quickly picked up on new technology he hadn\'t used before and very quickly excelled at it."',
			name: 'Marek Vospěl',
			role: 'Full-stack Developer · HAXAGON',
			initials: 'MV'
		},
		{
			quote:
				'"A versatile asset to any team. He consistently demonstrated his ability to turn project requirements into successful web applications. I wholeheartedly recommend Jan for his strong technical skills and commitment to delivering results."',
			name: 'Zdeněk Glazer',
			role: 'Founder & CTO · PRECISMO',
			initials: 'ZG'
		}
	];
</script>

<svelte:head>
	<title>Jan Komínek — Freelance Senior Frontend Engineer, Prague</title>
	<link rel="preload" as="image" href="/images/profile.webp" type="image/webp" fetchpriority="high" />
</svelte:head>

<!-- GEO: machine-readable for LLMs -->
<p class="sr-only">
	Jan Komínek is a Freelance Senior Frontend Engineer based in Prague, Czech Republic, specializing in Vue.js, React.js, TypeScript, and Node.js. Currently available for part-time B2B contracts up to 10 hours per week.
</p>

<!-- ===== HERO ===== -->
<div class="hero-wrap">
	<div class="hero-meta mono">
		<span style="color: var(--fg)">{$_('home.fullstack')}</span>
		<span class="sep">/</span>
		<span>{$_('home.freelance')}</span>
		<span class="sep">/</span>
		<span>{$_('home.prague')}</span>
	</div>

	<h1 class="hero-name">Jan<br /><em>Komínek.</em></h1>

	<p class="hero-value-prop">{@html $_('home.valueProp')}</p>

	<div class="hero-cta-row">
		<a href="/contact" class="btn-primary" onclick={() => trackEvent('cta_click', { cta_name: 'start_project' })}>
			<span>{$_('home.startProject')}</span>
			<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M5 12h14M13 6l6 6-6 6" /></svg>
		</a>
		<a href="/resume" class="btn-secondary">
			<span>{$_('home.viewResume')}</span>
		</a>
	</div>

	<div class="hero-stats">
		<div class="stat">
			<div class="stat-num serif">4<span style="color:var(--fg-4)">+</span></div>
			<div class="stat-label mono">{$_('home.yearsLabel')}</div>
		</div>
		<div class="stat">
			<div class="stat-num serif">12</div>
			<div class="stat-label mono">{$_('home.projectsLabel')}</div>
		</div>
		<div class="stat">
			<div class="stat-num serif">7</div>
			<div class="stat-label mono">{$_('home.clientsLabel')}</div>
		</div>
		<div class="stat">
			<div class="stat-num serif">5<span style="color:var(--fg-4)">★</span></div>
			<div class="stat-label mono">{$_('home.recsLabel')}</div>
		</div>
	</div>

	<div class="hero-portrait">
		<img src="/images/profile.webp" alt="Jan Komínek — Senior Frontend Engineer" width="340" height="440" fetchpriority="high" decoding="async" />
		<div class="status-badge">
			<span class="dot"></span>
			<span style="color:var(--fg)">{$_('home.available')}</span>
			<span style="color:var(--fg-4); margin-left:auto">{$_('home.upToLabel')}</span>
		</div>
	</div>
</div>

<!-- ===== NOW SECTION ===== -->
<div class="section" style="margin-bottom: 96px;">
	<div class="now-card">
		<div>
			<div class="now-label">◆ {$_('home.nowLabel')}</div>
		</div>
		<div>
			<h3 class="serif now-title">{$_('home.nowTitle')}</h3>
			<p class="now-desc">{$_('home.nowDesc')}</p>
		</div>
		<div class="now-meta mono">
			<div>{$_('home.nowDate')}</div>
			<div style="color:var(--fg-3); margin-top:4px;">{$_('home.nowMeta')}</div>
		</div>
	</div>
</div>

<!-- ===== PROJECTS BENTO ===== -->
<section class="section">
	<div class="section-head">
		<div class="section-label">◆ {$_('home.workLabel')} — {projects.length}</div>
		<div>
			<h2 class="serif section-h2">{$_('home.workH2')}</h2>
			<p class="section-p">{$_('home.workP')}</p>
		</div>
	</div>

	<div class="projects-grid">
		{#each projects as project (project.slug)}
			{@const cfg = bentoConfig[project.slug] ?? { size: 'default', company: '', role: '', desc: '' }}
			<a
				href={`/projects/${project.slug}?locale=${$locale}`}
				class="project-card"
				class:featured={cfg.size === 'featured'}
				class:wide={cfg.size === 'wide'}
				class:narrow={cfg.size === 'narrow'}
				onclick={() => trackEvent('project_view', { project_name: project.slug })}
			>
				<div class="project-visual">
					<img src={project.thumbnail} alt={project.title} loading="lazy" />
					{#if cfg.badge}
						<span class="project-badge">{cfg.badge}</span>
					{/if}
					<span class="project-year mono">{new Date(project.date).getFullYear()}</span>
				</div>
				<div class="project-body">
					<div>
						<div class="project-org mono">{cfg.company}<span style="color:var(--fg-5); margin:0 8px">/</span>{cfg.role}</div>
						<h3 class="project-title serif">{project.title}</h3>
						<p class="project-sub">{cfg.desc}</p>
					</div>
					<div>
						{#if cfg.chips}
							<div class="project-chips">
								{#each cfg.chips as chip (chip)}
									<span class="chip">{chip}</span>
								{/each}
							</div>
						{/if}
						<div class="project-footer">
							<span>{$_('home.' + cfg.ctaKey)}</span>
							<span class="arrow">→</span>
						</div>
					</div>
				</div>
			</a>
		{/each}
	</div>
</section>

<!-- ===== SERVICES ===== -->
<section class="section">
	<div class="section-head">
		<div class="section-label">◆ {$_('home.servicesLabel')}</div>
		<div>
			<h2 class="serif section-h2">{$_('home.servicesH2')}</h2>
			<p class="section-p">{$_('home.servicesP')}</p>
		</div>
	</div>

	<div class="services-grid">
		<div class="service">
			<div class="service-num mono">{$_('home.service1Num')}</div>
			<h3 class="service-title serif">{$_('home.service1Title')}</h3>
			<p class="service-desc">{$_('home.service1Desc')}</p>
			<div class="service-chips">
				{#each serviceChips[0] as chip (chip)}<span class="chip">{chip}</span>{/each}
			</div>
		</div>
		<div class="service">
			<div class="service-num mono">{$_('home.service2Num')}</div>
			<h3 class="service-title serif">{$_('home.service2Title')}</h3>
			<p class="service-desc">{$_('home.service2Desc')}</p>
			<div class="service-chips">
				{#each serviceChips[1] as chip (chip)}<span class="chip">{chip}</span>{/each}
			</div>
		</div>
		<div class="service">
			<div class="service-num mono">{$_('home.service3Num')}</div>
			<h3 class="service-title serif">{$_('home.service3Title')}</h3>
			<p class="service-desc">{$_('home.service3Desc')}</p>
			<div class="service-chips">
				{#each serviceChips[2] as chip (chip)}<span class="chip">{chip}</span>{/each}
			</div>
		</div>
	</div>
</section>

<!-- ===== TESTIMONIALS ===== -->
<section class="section">
	<div class="section-head">
		<div class="section-label">◆ {$_('home.testimonialsLabel')}</div>
		<div>
			<h2 class="serif section-h2">{$_('home.testimonialsH2')}</h2>
			<p class="section-p">{$_('home.testimonialsP')}</p>
		</div>
	</div>

	<div class="testimonials-grid">
		{#each testimonials as t}
			<div class="testimonial">
				<blockquote class="serif">{t.quote}</blockquote>
				<div class="author">
					<div class="avatar serif">{t.initials}</div>
					<div class="author-info">
						<div class="author-name">{t.name}</div>
						<div class="author-role mono">{t.role}</div>
					</div>
				</div>
			</div>
		{/each}
	</div>
</section>

<!-- ===== CONTACT FOOTER ===== -->
<div class="px-section pb-32">
	<ContactFooter />
</div>

<style>
	/* ===== Layout container ===== */
	.section {
		padding: 0 32px;
		max-width: var(--max);
		margin: 0 auto;
		margin-bottom: 140px;
	}
	.px-section {
		padding: 0 32px;
		max-width: var(--max);
		margin: 0 auto;
	}
	@media (max-width: 640px) {
		.section,
		.px-section {
			padding: 0 20px;
		}
	}

	/* ===== Hero ===== */
	.hero-wrap {
		padding: 40px 32px 120px;
		max-width: var(--max);
		margin: 0 auto;
		display: grid;
		grid-template-columns: 1fr auto;
		grid-template-rows: auto auto auto auto auto;
		gap: 0 80px;
		align-items: start;
	}
	@media (max-width: 900px) {
		.hero-wrap {
			grid-template-columns: 1fr;
			gap: 24px;
			padding-bottom: 64px;
		}
	}
	.hero-meta {
		display: flex;
		flex-wrap: wrap;
		gap: 4px 16px;
		font-size: 12px;
		color: var(--fg-3);
		letter-spacing: 0.04em;
		margin-bottom: 32px;
		grid-column: 1;
	}
	.sep {
		color: var(--fg-5);
	}
	.hero-name {
		font-family: var(--font-serif);
		font-weight: 300;
		font-size: clamp(52px, 9vw, 120px);
		line-height: 0.95;
		letter-spacing: -0.03em;
		margin: 0 0 24px;
		grid-column: 1;
	}
	.hero-name em {
		font-style: italic;
		color: var(--fg-2);
	}
	.hero-value-prop {
		font-weight: 300;
		font-size: clamp(18px, 2.2vw, 26px);
		line-height: 1.4;
		letter-spacing: -0.015em;
		color: var(--fg-2);
		max-width: 600px;
		margin: 0 0 32px;
		grid-column: 1;
	}
	.hero-value-prop :global(strong) {
		color: var(--fg);
		font-weight: 500;
	}
	.hero-cta-row {
		display: flex;
		gap: 12px;
		flex-wrap: wrap;
		grid-column: 1;
	}
	.hero-stats {
		display: flex;
		gap: 40px;
		flex-wrap: wrap;
		margin-top: 48px;
		padding-top: 28px;
		border-top: 1px solid var(--line);
		grid-column: 1;
	}
	.stat {
		display: flex;
		flex-direction: column;
		gap: 4px;
	}
	.stat-num {
		font-size: 36px;
		font-weight: 300;
		line-height: 1;
	}
	.stat-label {
		font-size: 10px;
		color: var(--fg-4);
		letter-spacing: 0.1em;
		text-transform: uppercase;
	}
	.hero-portrait {
		grid-column: 2;
		grid-row: 1 / 6;
		position: relative;
		width: 320px;
		height: 390px;
		border-radius: 180px 180px 12px 12px;
		overflow: hidden;
		border: 1px solid var(--line-2);
		background: linear-gradient(180deg, #2a2a2a, #181818);
		align-self: center;
	}
	.hero-portrait img {
		width: 100%;
		height: 100%;
		object-fit: cover;
		object-position: top center;
	}
	@media (max-width: 900px) {
		.hero-portrait {
			grid-column: 1;
			grid-row: auto;
			width: 100%;
			max-width: 320px;
			height: 400px;
			margin: 0 auto;
		}
	}
	.status-badge {
		position: absolute;
		bottom: 14px;
		left: 14px;
		right: 14px;
		background: color-mix(in srgb, var(--bg) 80%, transparent);
		backdrop-filter: blur(8px);
		border: 1px solid var(--line-2);
		border-radius: 8px;
		padding: 9px 12px;
		display: flex;
		align-items: center;
		gap: 8px;
		font-family: var(--font-mono);
		font-size: 11px;
	}
	.dot {
		width: 8px;
		height: 8px;
		border-radius: 50%;
		background: var(--accent);
		box-shadow: 0 0 10px var(--accent);
		flex-shrink: 0;
		animation: dot-pulse 2.4s ease-in-out infinite;
	}

	/* ===== Buttons ===== */
	.btn-primary {
		padding: 13px 22px;
		background: var(--fg);
		color: var(--bg);
		border-radius: 999px;
		font-size: 14px;
		font-weight: 500;
		display: inline-flex;
		align-items: center;
		gap: 8px;
		text-decoration: none;
		transition: all 200ms;
	}
	.btn-primary:hover {
		background: var(--accent);
		color: var(--bg);
	}
	.btn-secondary {
		padding: 13px 22px;
		border: 1px solid var(--line-2);
		border-radius: 999px;
		font-size: 14px;
		display: inline-flex;
		align-items: center;
		gap: 8px;
		text-decoration: none;
		color: var(--fg);
		transition: all 200ms;
	}
	.btn-secondary:hover {
		border-color: var(--fg-3);
	}

	/* ===== Now card ===== */
	.now-card {
		border: 1px solid var(--line);
		border-radius: var(--radius);
		background: var(--bg-2);
		padding: 24px 28px;
		display: grid;
		grid-template-columns: auto 1fr auto;
		gap: 28px;
		align-items: center;
	}
	@media (max-width: 700px) {
		.now-card {
			grid-template-columns: 1fr;
			gap: 12px;
		}
	}
	.now-label {
		font-family: var(--font-mono);
		font-size: 11px;
		color: var(--accent);
		letter-spacing: 0.1em;
		text-transform: uppercase;
	}
	.now-title {
		margin: 0 0 6px;
		font-size: 20px;
	}
	.now-desc {
		margin: 0;
		color: var(--fg-3);
		font-size: 14px;
		line-height: 1.55;
	}
	.now-meta {
		font-size: 12px;
		color: var(--fg-4);
		text-align: right;
		white-space: nowrap;
	}
	@media (max-width: 700px) {
		.now-meta {
			text-align: left;
		}
	}

	/* ===== Section head ===== */
	.section-head {
		display: grid;
		grid-template-columns: 1fr 2fr;
		gap: 40px;
		margin-bottom: 40px;
		padding-bottom: 20px;
		border-bottom: 1px solid var(--line);
	}
	@media (max-width: 768px) {
		.section-head {
			grid-template-columns: 1fr;
			gap: 12px;
		}
	}
	.section-label {
		font-family: var(--font-mono);
		font-size: 11px;
		color: var(--fg-4);
		letter-spacing: 0.12em;
		text-transform: uppercase;
		padding-top: 12px;
	}
	.section-h2 {
		font-size: clamp(24px, 3.5vw, 44px);
		letter-spacing: -0.02em;
		margin: 0;
		line-height: 1.05;
	}
	.section-p {
		font-size: 15px;
		color: var(--fg-3);
		margin: 14px 0 0;
		max-width: 520px;
	}

	/* ===== Projects Bento Grid ===== */
	.projects-grid {
		display: grid;
		grid-template-columns: repeat(6, 1fr);
		gap: 14px;
	}
	@media (max-width: 900px) {
		.projects-grid {
			grid-template-columns: 1fr 1fr;
		}
	}
	@media (max-width: 560px) {
		.projects-grid {
			grid-template-columns: 1fr;
		}
	}
	.project-card {
		grid-column: span 3;
		background: var(--bg-2);
		border: 1px solid var(--line);
		border-radius: var(--radius-lg);
		overflow: hidden;
		display: flex;
		flex-direction: column;
		transition:
			border-color 200ms,
			transform 200ms;
		text-decoration: none;
		color: var(--fg);
		position: relative;
	}
	.project-card:hover {
		border-color: var(--fg-5);
		transform: translateY(-2px);
	}
	.project-card.featured {
		grid-column: span 6;
		flex-direction: row;
		min-height: 420px;
	}
	.project-card.featured .project-visual {
		flex: 1.2;
	}
	.project-card.featured .project-body {
		flex: 1;
		padding: 36px;
	}
	.project-card.wide {
		grid-column: span 4;
	}
	.project-card.narrow {
		grid-column: span 2;
	}
	@media (max-width: 900px) {
		.project-card,
		.project-card.featured,
		.project-card.wide,
		.project-card.narrow {
			grid-column: span 2;
			flex-direction: column;
		}
		.project-card.featured {
			min-height: auto;
		}
		.project-card.featured .project-body {
			padding: 20px;
		}
	}
	@media (max-width: 560px) {
		.project-card,
		.project-card.featured,
		.project-card.wide,
		.project-card.narrow {
			grid-column: span 1;
		}
	}

	.project-visual {
		aspect-ratio: 16 / 10;
		background: var(--bg-3);
		position: relative;
		overflow: hidden;
		border-bottom: 1px solid var(--line);
	}
	.project-card.featured .project-visual {
		aspect-ratio: auto;
		border-bottom: none;
		border-right: 1px solid var(--line);
	}
	@media (max-width: 900px) {
		.project-card.featured .project-visual {
			border-right: none;
			border-bottom: 1px solid var(--line);
			aspect-ratio: 16 / 10;
		}
	}
	.project-visual img {
		width: 100%;
		height: 100%;
		object-fit: cover;
		transition: transform 300ms ease;
	}
	.project-card:hover .project-visual img {
		transform: scale(1.02);
	}
	.project-badge {
		position: absolute;
		top: 10px;
		left: 10px;
		z-index: 2;
		padding: 4px 10px;
		border-radius: 999px;
		background: color-mix(in srgb, var(--bg) 80%, transparent);
		backdrop-filter: blur(8px);
		border: 1px solid var(--line-2);
		font-family: var(--font-mono);
		font-size: 10px;
		letter-spacing: 0.08em;
		text-transform: uppercase;
		color: var(--fg-2);
	}
	.project-year {
		position: absolute;
		top: 10px;
		right: 10px;
		z-index: 2;
		font-size: 11px;
		color: var(--fg-2);
		padding: 4px 10px;
		background: color-mix(in srgb, var(--bg) 80%, transparent);
		backdrop-filter: blur(8px);
		border-radius: 999px;
	}
	.project-body {
		padding: 18px;
		display: flex;
		flex-direction: column;
		gap: 12px;
		flex: 1;
	}
	.project-card.featured .project-body {
		justify-content: space-between;
	}
	.project-org {
		font-size: 10px;
		color: var(--fg-4);
		letter-spacing: 0.08em;
		text-transform: uppercase;
		margin-bottom: 8px;
	}
	.project-title {
		font-size: 22px;
		letter-spacing: -0.01em;
		margin: 0 0 6px;
		line-height: 1.15;
	}
	.project-card.featured .project-title {
		font-size: 36px;
	}
	.project-sub {
		color: var(--fg-3);
		font-size: 14px;
		line-height: 1.5;
		margin: 0;
	}
	.project-card.featured .project-sub {
		font-size: 16px;
	}
	.project-chips {
		display: flex;
		flex-wrap: wrap;
		gap: 5px;
		margin-bottom: 14px;
	}
	.project-footer {
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding-top: 10px;
		border-top: 1px solid var(--line);
		font-family: var(--font-mono);
		font-size: 11px;
		color: var(--fg-4);
		letter-spacing: 0.04em;
	}
	.arrow {
		transition: transform 200ms;
		color: var(--fg-2);
	}
	.project-card:hover .arrow {
		transform: translateX(4px);
		color: var(--accent);
	}

	/* ===== Services ===== */
	.services-grid {
		display: grid;
		grid-template-columns: repeat(3, 1fr);
		gap: 14px;
	}
	@media (max-width: 768px) {
		.services-grid {
			grid-template-columns: 1fr;
		}
	}
	.service {
		padding: 24px;
		border: 1px solid var(--line);
		border-radius: var(--radius);
		background: var(--bg-2);
	}
	.service-num {
		font-size: 11px;
		color: var(--fg-4);
		letter-spacing: 0.1em;
		margin-bottom: 28px;
	}
	.service-title {
		font-size: 22px;
		margin: 0 0 10px;
	}
	.service-desc {
		color: var(--fg-3);
		font-size: 14px;
		margin: 0;
		line-height: 1.55;
	}
	.service-chips {
		display: flex;
		flex-wrap: wrap;
		gap: 6px;
		margin-top: 18px;
	}

	/* ===== Testimonials ===== */
	.testimonials-grid {
		display: grid;
		grid-template-columns: repeat(2, 1fr);
		gap: 14px;
	}
	@media (max-width: 768px) {
		.testimonials-grid {
			grid-template-columns: 1fr;
		}
	}
	.testimonial {
		padding: 24px;
		border: 1px solid var(--line);
		border-radius: var(--radius);
		background: var(--bg-2);
		display: flex;
		flex-direction: column;
		gap: 20px;
	}
	blockquote {
		margin: 0;
		font-size: 15px;
		line-height: 1.65;
		color: var(--fg-2);
		font-weight: 300;
		letter-spacing: -0.005em;
	}
	.author {
		display: flex;
		align-items: center;
		gap: 12px;
		margin-top: auto;
	}
	.avatar {
		width: 40px;
		height: 40px;
		border-radius: 50%;
		background: linear-gradient(135deg, #3a3a3a, #1a1a1a);
		flex-shrink: 0;
		display: grid;
		place-items: center;
		font-size: 13px;
		border: 1px solid var(--line-2);
		color: var(--fg-3);
	}
	.author-info {
		display: flex;
		flex-direction: column;
		gap: 2px;
	}
	.author-name {
		font-size: 14px;
		font-weight: 500;
	}
	.author-role {
		font-size: 11px;
		color: var(--fg-4);
	}
</style>
