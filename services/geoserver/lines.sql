SELECT geometry, (fk_operator=2) as user2 from sql.ls_observation, sql.ls_process where sql.ls_process._id = sql.ls_observation.fk_process