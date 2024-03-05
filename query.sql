WHERE PUBLIC == TRUE

SELECT cm.name as module_name, cml.ordering as level, ce.title as exercise_title, ct.id as technique_id, ct.name as technique_name, cc.name as technique_category
FROM code_modules cm
INNER JOIN code_modules_levels cml ON cm.id = cml.module_id and cm.language = cml.language
INNER JOIN code_levels_exercises cle ON cml.level_id = cle.level_id AND cle.language = cml.language
INNER JOIN code_exercises ce ON cle.exercise_id = ce.id and cle.language = ce.language
INNER JOIN code_technique_exercise cte ON ce.id = cte.exercise_id and ce.language = cte.language
INNER JOIN code_techniques ct ON cte.technique_id = ct.id and cte.language = ct.language
INNER JOIN code_technique_category ctc ON ct.id = ctc.technique_id and ct.language = ctc.technique_language
INNER JOIN code_category cc ON ctc.category_id = cc.id and ctc.technique_language = cc.language
order by cm.name, cml.ordering, cle.ordering, ct.name

WHERE PUBLIC == TRUE