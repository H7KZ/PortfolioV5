<script lang="ts">
    interface Props {
        link?: string;
        target?: string;
        children: () => any;
    }
    let { link, target, children }: Props = $props();
</script>

<a href={link} target={target}>
    <button class="px-6 py-1.5 border-[1.5px] border-primary rounded-full cursor-pointer hover:bg-primary">
        {@render children()}
    </button>
</a>
