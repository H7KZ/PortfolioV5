<script lang="ts">
	import ContactFooter from '$lib/components/ContactFooter.svelte';
	import { _ } from 'svelte-i18n';
	import { trackEvent } from '$lib/utils/analytics';
</script>

<svelte:head>
	<title>Resumé — Jan Komínek, Senior Frontend Engineer</title>
	<meta name="description" content="Resumé of Jan Komínek — Senior Frontend / Fullstack Engineer based in Prague. Vue.js, React.js, TypeScript, Node.js, Docker. Available for part-time B2B contracts." />
	<meta property="og:title" content="Resumé — Jan Komínek, Senior Frontend Engineer" />
	<meta property="og:description" content="Resumé of Jan Komínek — Senior Frontend / Fullstack Engineer. Vue.js, React.js, TypeScript, Node.js." />
	<meta property="og:url" content="https://jankominek.com/resume" />
</svelte:head>

<!-- ===== RESUME HEADER ===== -->
<div class="resume-header">
	<div class="resume-portrait">
		<img src="/images/resume_profile.webp" alt="Jan Komínek, portrait" width="532" height="576" loading="lazy" decoding="async" />
	</div>
	<div>
		<div class="mono-label">{$_('resume.label')}</div>
		<h1 class="resume-name serif">Jan Komínek<span style="color:var(--fg-3)">.</span></h1>
		<p class="resume-title mono">{$_('resume.subtitle')}</p>
		<p class="resume-bio">
			{$_('resume.bio')}
		</p>
		<div class="resume-actions">
			<a
				href="/files/Jan_Kominek_Resume.pdf"
				download
				class="btn-primary"
				onclick={() => trackEvent('file_download', { file_name: 'resume_pdf' })}
			>
				{$_('resume.download')}
				<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 3v13M5 10l7 7 7-7M3 21h18" /></svg>
			</a>
			<a href="/contact" class="btn-secondary">{$_('resume.hireBtn')}</a>
		</div>
	</div>
</div>

<!-- ===== IMPACT BAND ===== -->
<div class="section" style="margin-bottom: 100px;">
	<div class="impact-band">
		<div class="impact-item">
			<div class="impact-label">{$_('resume.impact1Label')}</div>
			<div class="impact-value serif">4+ <span style="color:var(--fg-4); font-size: 20px; font-family: var(--font-mono)">yrs</span></div>
			<div class="impact-sub mono">{$_('resume.impact1Sub')}</div>
		</div>
		<div class="impact-item">
			<div class="impact-label">{$_('resume.impact2Label')}</div>
			<div class="impact-value serif">7</div>
			<div class="impact-sub mono">{$_('resume.impact2Sub')}</div>
		</div>
		<div class="impact-item">
			<div class="impact-label">{$_('resume.impact3Label')}</div>
			<div class="impact-value mono" style="font-size: 18px;">TS + Vue + Node</div>
			<div class="impact-sub mono">{$_('resume.impact3Sub')}</div>
		</div>
		<div class="impact-item">
			<div class="impact-label">{$_('resume.impact4Label')}</div>
			<div class="impact-value mono" style="font-size: 18px; color: var(--accent);">◆ Available</div>
			<div class="impact-sub mono">{$_('resume.impact4Sub')}</div>
		</div>
	</div>
</div>

<!-- ===== EXPERIENCE ===== -->
<section class="section">
	<div class="section-head">
		<div class="section-label">{$_('resume.experienceLabel')}</div>
		<div>
			<h2 class="serif section-h2">{$_('resume.expH2')}</h2>
			<p class="section-p">{$_('resume.expP')}</p>
		</div>
	</div>

	<div class="timeline">
		<div class="tl-item current">
			<div class="tl-dates mono">APR 2025 — PRESENT <span class="duration">· 1 yr+</span></div>
			<h3 class="tl-role">Senior Frontend Engineer</h3>
			<div class="tl-company mono">CORAC ENGINEERING · FREELANCE · REMOTE</div>
			<p class="tl-desc">Building DeepTrace — a data provenance and integrity platform for Earth Observation data. Sole frontend engineer.</p>
			<ul class="tl-highlights">
				<li>Architected interactive D3.js lineage visualization for complex supply-chain graphs</li>
				<li>Implemented client-side hash-chain verification following zero-trust architecture</li>
				<li>Integrated AWS Cognito (OAuth) for secure client-side-only authentication</li>
			</ul>
			<div class="tl-stack">
				<span class="chip accent">Vue 3</span>
				<span class="chip">TypeScript</span>
				<span class="chip">D3.js</span>
				<span class="chip">AWS Cognito</span>
				<span class="chip">Vite</span>
				<span class="chip">pnpm</span>
			</div>
		</div>

		<div class="tl-item current">
			<div class="tl-dates mono">SEP 2024 — PRESENT <span class="duration">· 1 yr 8 mos</span></div>
			<h3 class="tl-role">Fullstack Engineer</h3>
			<div class="tl-company mono">INTEDAT · FREELANCE · REMOTE</div>
			<p class="tl-desc">Developing and maintaining a fullstack data platform focused on scalability, search performance, and reliable infrastructure.</p>
			<ul class="tl-highlights">
				<li>End-to-end feature delivery — Nuxt on the frontend, AdonisJS on the backend</li>
				<li>Elasticsearch-powered search across large datasets</li>
				<li>CI/CD + DigitalOcean Linux infrastructure for production deployments</li>
			</ul>
			<div class="tl-stack">
				<span class="chip accent">Node.js</span>
				<span class="chip">TypeScript</span>
				<span class="chip">Nuxt</span>
				<span class="chip">AdonisJS</span>
				<span class="chip">PostgreSQL</span>
				<span class="chip">Redis</span>
				<span class="chip">Elasticsearch</span>
			</div>
		</div>

		<div class="tl-item">
			<div class="tl-dates mono">JUL 2022 — PRESENT <span class="duration">· Yearly · 4 editions</span></div>
			<h3 class="tl-role">Lecturer &amp; Organizer</h3>
			<div class="tl-company mono">SMÍCHOVSKÁ SPŠ · SUMMER SCHOOL · ON-SITE</div>
			<p class="tl-desc">Solo-taught "Intro and Basics of 2D Graphics" for 50 students (8th &amp; 9th grade). Consistently top-rated teacher across all four years (2022–2025).</p>
		</div>

		<div class="tl-item">
			<div class="tl-dates mono">AUG 2023 — SEP 2024 <span class="duration">· 1 yr 2 mos</span></div>
			<h3 class="tl-role">Fullstack Engineer</h3>
			<div class="tl-company mono">IONT TECH · FREELANCE · REMOTE</div>
			<p class="tl-desc">Led full-stack development of a web platform managing electric vehicle chargers — from infrastructure setup to payment integration.</p>
			<ul class="tl-highlights">
				<li>Built public-facing charging app with online payment and remote charger authorization</li>
				<li>Designed + deployed infrastructure from scratch on IaaS — Docker Swarm microservices</li>
				<li>Developed auto-updating firmware delivery system with the hardware team</li>
			</ul>
			<div class="tl-stack">
				<span class="chip">SvelteKit</span>
				<span class="chip">Fastify</span>
				<span class="chip">TypeScript</span>
				<span class="chip">Docker Swarm</span>
				<span class="chip">MongoDB</span>
				<span class="chip">Redis</span>
				<span class="chip">Linux</span>
			</div>
		</div>

		<div class="tl-item">
			<div class="tl-dates mono">JAN 2023 — NOV 2023 <span class="duration">· 11 mos</span></div>
			<h3 class="tl-role">Fullstack Developer</h3>
			<div class="tl-company mono">PRECISMO · FREELANCE · HYBRID</div>
			<p class="tl-desc">Fullstack developer on a cross-functional Agile team building an internal customer portal. Collaborated with 6 devs and 1 PM in Scrum.</p>
			<div class="tl-stack">
				<span class="chip">React</span>
				<span class="chip">Node.js</span>
				<span class="chip">Playwright</span>
				<span class="chip">SQL</span>
			</div>
		</div>

		<div class="tl-item">
			<div class="tl-dates mono">OCT 2022 — JUL 2023 <span class="duration">· 10 mos</span></div>
			<h3 class="tl-role">Frontend Developer</h3>
			<div class="tl-company mono">HAXAGON · PART-TIME · REMOTE</div>
			<p class="tl-desc">Frontend on a cybersecurity e-learning platform. Introduced improved dev processes for code quality and delivery flow.</p>
			<div class="tl-stack">
				<span class="chip">Vue.js</span>
				<span class="chip">TypeScript</span>
				<span class="chip">Tailwind</span>
			</div>
		</div>

		<div class="tl-item">
			<div class="tl-dates mono">JUN 2020 — FEB 2024 <span class="duration">· 3 yrs 9 mos</span></div>
			<h3 class="tl-role">IT Support</h3>
			<div class="tl-company mono">KMK FAMILY BUSINESS · FREELANCE</div>
			<p class="tl-desc">Hands-on IT support: Windows workstations, network printers, IoT devices, local network infrastructure, and safety training.</p>
		</div>
	</div>
</section>

<!-- ===== EDUCATION ===== -->
<section class="section">
	<div class="section-head">
		<div class="section-label">{$_('resume.educationLabel')}</div>
		<div>
			<h2 class="serif section-h2">{$_('resume.eduH2')}</h2>
		</div>
	</div>

	<div class="timeline">
		<div class="tl-item current">
			<div class="tl-dates mono">SEP 2024 — JUL 2027 <span class="duration">· Bachelor's, ongoing · Grade 2</span></div>
			<h3 class="tl-role">Applied Computer Science</h3>
			<div class="tl-company mono">PRAGUE UNIVERSITY OF ECONOMICS AND BUSINESS (VŠE)</div>
			<p class="tl-desc">B.S. focused on bridging software engineering and business strategy. System design, machine learning, cloud computing, data analytics alongside business fundamentals.</p>
			<ul class="tl-highlights">
				<li>Leading backend + DevOps architecture for Diář FISáka — team of 4 developers on Hetzner VPS</li>
				<li>Completed certifications: Building AI, Elements of AI, Data Science in Python, Joining Data in SQL</li>
			</ul>
		</div>
		<div class="tl-item">
			<div class="tl-dates mono">SEP 2020 — MAY 2024 <span class="duration">· High School Diploma</span></div>
			<h3 class="tl-role">Cyber / Computer Forensics &amp; Counterterrorism</h3>
			<div class="tl-company mono">SMICHOV SECONDARY TECHNICAL SCHOOL</div>
			<p class="tl-desc">Graduated with full marks in technical subjects. Network security, forensics, system admin. Final thesis: full-stack e-commerce store built from scratch, covering DevOps and CI/CD.</p>
		</div>
	</div>
</section>

<!-- ===== SKILLS ===== -->
<section class="section">
	<div class="section-head">
		<div class="section-label">{$_('resume.toolsLabel')}</div>
		<div>
			<h2 class="serif section-h2">{$_('resume.skillsH2')}</h2>
			<p class="section-p">{$_('resume.skillsP')}</p>
		</div>
	</div>

	<div class="skills-grid">
		<div class="skill-group">
			<h4 class="mono">{$_('resume.skillGroup1')}</h4>
			<div class="skill-list">
				<span class="skill primary">TypeScript</span>
				<span class="skill primary">Vue.js</span>
				<span class="skill primary">Node.js</span>
				<span class="skill">React.js</span>
				<span class="skill">SvelteKit</span>
				<span class="skill">Nuxt.js</span>
				<span class="skill">AdonisJS</span>
				<span class="skill">Fastify</span>
				<span class="skill">Express</span>
			</div>
		</div>
		<div class="skill-group">
			<h4 class="mono">{$_('resume.skillGroup2')}</h4>
			<div class="skill-list">
				<span class="skill primary">PostgreSQL</span>
				<span class="skill primary">MongoDB</span>
				<span class="skill primary">Redis</span>
				<span class="skill">MySQL</span>
				<span class="skill">Elasticsearch</span>
				<span class="skill">BullMQ</span>
				<span class="skill">REST APIs</span>
				<span class="skill">GraphQL</span>
			</div>
		</div>
		<div class="skill-group">
			<h4 class="mono">{$_('resume.skillGroup3')}</h4>
			<div class="skill-list">
				<span class="skill primary">Docker</span>
				<span class="skill primary">CI/CD</span>
				<span class="skill primary">Linux</span>
				<span class="skill">Docker Swarm</span>
				<span class="skill">Kubernetes</span>
				<span class="skill">DigitalOcean</span>
				<span class="skill">AWS (Cognito)</span>
				<span class="skill">Traefik</span>
				<span class="skill">Bash</span>
			</div>
		</div>
		<div class="skill-group">
			<h4 class="mono">{$_('resume.skillGroup4')}</h4>
			<div class="skill-list">
				<span class="skill primary">Git</span>
				<span class="skill primary">Figma</span>
				<span class="skill">Agile / Scrum</span>
				<span class="skill">UX Design</span>
				<span class="skill">System Architecture</span>
				<span class="skill">Power BI</span>
				<span class="skill">Network Security</span>
			</div>
		</div>
	</div>
</section>

<div class="px-section pb-32">
	<ContactFooter />
</div>

<style>
	.section {
		padding: 0 32px;
		max-width: var(--max);
		margin: 0 auto;
		margin-bottom: 100px;
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

	/* ===== Resume header ===== */
	.resume-header {
		display: grid;
		grid-template-columns: auto 1fr;
		gap: 48px;
		padding: 40px 32px 64px;
		max-width: var(--max);
		margin: 0 auto;
		align-items: center;
		border-bottom: 1px solid var(--line);
		margin-bottom: 64px;
	}
	@media (max-width: 700px) {
		.resume-header {
			grid-template-columns: 1fr;
			gap: 28px;
			padding: 28px 20px 40px;
		}
	}
	.resume-portrait {
		width: 260px;
		height: 260px;
		border-radius: var(--radius-lg);
		overflow: hidden;
		border: 1px solid var(--line-2);
		background: linear-gradient(135deg, #2a2a2a, #161616);
		flex-shrink: 0;
	}
	.resume-portrait img {
		width: 100%;
		height: 100%;
		object-fit: cover;
		object-position: top center;
	}
	@media (max-width: 700px) {
		.resume-portrait {
			width: 120px;
			height: 120px;
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
	.resume-name {
		font-size: clamp(36px, 5.5vw, 64px);
		letter-spacing: -0.025em;
		margin: 0 0 6px;
		line-height: 1;
	}
	.resume-title {
		font-size: 13px;
		color: var(--fg-3);
		margin: 0 0 20px;
		letter-spacing: 0.02em;
	}
	.resume-bio {
		font-size: 15px;
		line-height: 1.65;
		color: var(--fg-2);
		max-width: 560px;
		margin: 0;
	}
	.resume-actions {
		display: flex;
		gap: 12px;
		margin-top: 24px;
		flex-wrap: wrap;
	}
	.btn-primary {
		padding: 11px 20px;
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
		padding: 11px 20px;
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

	/* ===== Impact band ===== */
	.impact-band {
		display: grid;
		grid-template-columns: repeat(4, 1fr);
		border: 1px solid var(--line);
		border-radius: var(--radius);
		overflow: hidden;
		background: var(--bg-2);
	}
	@media (max-width: 768px) {
		.impact-band {
			grid-template-columns: repeat(2, 1fr);
		}
	}
	.impact-item {
		padding: 24px;
		border-right: 1px solid var(--line);
	}
	.impact-item:last-child {
		border-right: none;
	}
	@media (max-width: 768px) {
		.impact-item:nth-child(2n) {
			border-right: none;
		}
		.impact-item:nth-child(-n + 2) {
			border-bottom: 1px solid var(--line);
		}
	}
	.impact-label {
		font-family: var(--font-mono);
		font-size: 10px;
		color: var(--fg-4);
		letter-spacing: 0.1em;
		text-transform: uppercase;
		margin-bottom: 12px;
	}
	.impact-value {
		font-size: 34px;
		font-weight: 300;
		line-height: 1;
		letter-spacing: -0.02em;
	}
	.impact-sub {
		font-size: 11px;
		color: var(--fg-4);
		margin-top: 6px;
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
		font-size: clamp(24px, 3vw, 42px);
		letter-spacing: -0.02em;
		margin: 0;
		line-height: 1.05;
	}
	.section-p {
		font-size: 14px;
		color: var(--fg-3);
		margin: 12px 0 0;
	}

	/* ===== Timeline ===== */
	.timeline {
		position: relative;
		padding-left: 32px;
	}
	.timeline::before {
		content: '';
		position: absolute;
		left: 5px;
		top: 8px;
		bottom: 8px;
		width: 1px;
		background: var(--line-2);
	}
	.tl-item {
		position: relative;
		padding-bottom: 40px;
	}
	.tl-item::before {
		content: '';
		position: absolute;
		left: -32px;
		top: 10px;
		width: 11px;
		height: 11px;
		border-radius: 50%;
		background: var(--bg);
		border: 2px solid var(--fg-3);
	}
	.tl-item.current::before {
		background: var(--accent);
		border-color: var(--accent);
		box-shadow: 0 0 12px var(--accent);
	}
	.tl-dates {
		font-size: 11px;
		color: var(--fg-4);
		letter-spacing: 0.06em;
		margin-bottom: 4px;
	}
	.duration {
		color: var(--fg-3);
		margin-left: 6px;
	}
	.tl-role {
		font-size: 18px;
		font-weight: 500;
		margin: 0 0 4px;
	}
	.tl-company {
		font-size: 12px;
		color: var(--accent);
		letter-spacing: 0.02em;
		margin-bottom: 10px;
	}
	.tl-desc {
		font-size: 14px;
		color: var(--fg-2);
		line-height: 1.55;
		margin: 0 0 12px;
	}
	.tl-highlights {
		list-style: none;
		padding: 0;
		margin: 0 0 12px;
		display: flex;
		flex-direction: column;
		gap: 5px;
	}
	.tl-highlights li {
		font-size: 13px;
		color: var(--fg-3);
		line-height: 1.5;
		padding-left: 14px;
		position: relative;
	}
	.tl-highlights li::before {
		content: '—';
		position: absolute;
		left: 0;
		color: var(--fg-5);
	}
	.tl-stack {
		display: flex;
		flex-wrap: wrap;
		gap: 5px;
	}

	/* ===== Skills grid ===== */
	.skills-grid {
		display: grid;
		grid-template-columns: repeat(4, 1fr);
		gap: 32px;
	}
	@media (max-width: 768px) {
		.skills-grid {
			grid-template-columns: repeat(2, 1fr);
		}
	}
	@media (max-width: 480px) {
		.skills-grid {
			grid-template-columns: 1fr;
		}
	}
	.skill-group h4 {
		font-size: 10px;
		color: var(--fg-4);
		letter-spacing: 0.12em;
		text-transform: uppercase;
		margin: 0 0 14px;
		padding-bottom: 10px;
		border-bottom: 1px solid var(--line);
		font-weight: 500;
	}
	.skill-list {
		display: flex;
		flex-direction: column;
		gap: 8px;
		font-size: 14px;
	}
	.skill {
		color: var(--fg-2);
	}
	.skill.primary {
		color: var(--fg);
		font-weight: 500;
	}
	.skill.primary::after {
		content: '';
		display: inline-block;
		width: 4px;
		height: 4px;
		border-radius: 50%;
		background: var(--accent);
		margin-left: 8px;
		vertical-align: middle;
		transform: translateY(-2px);
	}
</style>
