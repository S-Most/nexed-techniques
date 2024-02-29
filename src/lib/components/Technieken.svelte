<script>
    import Techniek from "../components/Techniek.svelte"
    /**
	 * @type {any}
	 */
     export let technieken;
</script>


{#await technieken}
	<p>...waiting</p>
{:then technieken}
	{#each technieken as techniek }
        <Techniek {techniek}/>
	{/each}
{:catch error}
	<p style="color: red">{error.message}</p>
{/await}