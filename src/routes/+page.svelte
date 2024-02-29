<script>
	import Technieken from "$lib/components/Technieken.svelte"
	let input = "";
	$: technieken = getTechnieken(input);

	/**
	 * @param {string} keyword
	 */
	async function getTechnieken(keyword) {
		const res = await fetch("/result.json");
		let technieken = await res.json();

		/**
		 * @type {any[]}
		 */
		let newTechniques = []
		technieken = technieken
			.filter((/** @type {{ technique_name: string; }} */ techniek) => techniek.technique_name.toUpperCase().includes(keyword.toUpperCase()))
			.sort((/** @type {{ technique_name: string; module_name: string; level: number; }} */ a, /** @type {{ technique_name: any; module_name: any; level: number; }} */ b) => 
				a.technique_name.localeCompare(b.technique_name) || 
				a.module_name.localeCompare(b.module_name) || 
				a.level - b.level)
			.filter((/** @type {{ technique_name: any; }} */ techniek) => {
				const duplicateName = newTechniques.includes(techniek.technique_name);
				if (!duplicateName) {
					newTechniques.push(techniek.technique_name);
					return true;
				}
				return false;
			});
			
		if (res.ok) {
			return technieken;
		} else {
			throw new Error(technieken);
		}
	}
</script>
	
<h1>NexEd Technieken:</h1>

<input bind:value={input} on:keyup={() => getTechnieken(input)}>

<Technieken {technieken}/>
