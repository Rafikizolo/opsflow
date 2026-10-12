-- Each technician with all their skills (includes technicians with none)

SELECT
    t.full_name,
    s.name
FROM technicians t
         LEFT JOIN technician_skills ts
                   ON t.technician_id = ts.technician_id
         LEFT JOIN skills s
                   ON ts.skill_id = s.skill_id;