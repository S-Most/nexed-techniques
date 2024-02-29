<script>
    /**
	 * @type {{ technique_name: any; module_name: any; level: any; exercise_title: any; }}
	 */
     export let techniek;
</script>

<details>
    <summary>{techniek.technique_name}</summary>
    <ul>
        <li>Module: {techniek.module_name}</li>
        <li>Level: {techniek.level}</li>
        <li>Exercise: {techniek.exercise_title}</li>
    </ul>
</details>

<style>
    ul{
        margin-top: 0;
    }

    summary:hover,
    summary:focus{
        cursor: pointer;
        border: 1px solid #000563;
        color: #000563;
        font-weight: 900;
        padding: .3rem;
    }
</style>