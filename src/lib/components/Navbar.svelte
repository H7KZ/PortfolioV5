<script lang="ts">
    import { _ } from 'svelte-i18n';
	import Button from './Button.svelte';
</script>

<div class="w-full flex justify-center items-center">
    <div class="max-w-[1440px] flex justify-between items-center w-full pt-10">
        <div>
            <img src="/logo/J.svg" alt="J" class="w-16 h-16" />
        </div>

        <div>
            <p class="text-lg">
                {$_('navbar.resume')}
            </p>
            <p>
                {$_('navbar.linkedin')}
            </p>
            <Button>
                <p>
                    {$_('navbar.hire')}
                </p>
            </Button>
        </div>
    </div>
</div>
