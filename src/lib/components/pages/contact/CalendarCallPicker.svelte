<script lang="ts">
	import BoldButton from '$lib/components/BoldButton.svelte';
	import TextInput from '$lib/components/inputs/TextInput.svelte';
	import { _ } from 'svelte-i18n';
	import PocketBase from 'pocketbase';
	import { z } from 'zod';
	import { onMount } from 'svelte';

	interface Call {
		meeting: string;
		timezone: string;
		datetime: string;
		lengthInMinutes: number;
	}

	const pb = new PocketBase('https://api.jankominek.com');

	let calls: Call[] = [];

	onMount(async () => {
		const apiCalls = await pb.collection('calls').getFullList({
			filter: `datetime >= "${new Date().toISOString().replace('T', ' ')}"`,
			sort: 'datetime'
		});

		calls = apiCalls.map((c) => ({
			meeting: c.meeting,
			timezone: c.timezone,
			datetime: c.datetime,
			lengthInMinutes: c.lengthInMinutes
		}));

		console.log(calls);
	});

	let call = $state({
		meeting: '',
		timezone: '',
		datetime: '',
		lengthInMinutes: 0
	});

	let error = $state({
		meeting: '',
		timezone: '',
		datetime: '',
		lengthInMinutes: ''
	});

	const callSchema = z.object({
		meeting: z.string().nonempty(),
		timezone: z.string().nonempty(),
		datetime: z.date(),
		lengthInMinutes: z.number().min(15)
	});

	async function handleSubmit(e: MouseEvent) {
		e.preventDefault();

		const validationResult = callSchema.safeParse({
			meeting: call.meeting,
			timezone: call.timezone,
			datetime: new Date(call.datetime),
			lengthInMinutes: call.lengthInMinutes
		});

		if (!validationResult.success) {
			const errors = validationResult.error.errors;
			errors.forEach((e) => {
				const key = e.path.find((p) => Object.keys(call).includes(p.toString())) as keyof typeof call;
				const message = $_(`contact.form.errors.${key}.${e.code}`);
				error[key] = message;
			});
			return;
		}

		await pb.collection('calls').create({
			meeting: call.meeting,
			timezone: call.timezone,
			datetime: new Date(call.datetime),
			lengthInMinutes: call.lengthInMinutes
		});
	}
</script>
