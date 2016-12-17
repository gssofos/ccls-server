SELECT LS_Process._id as id ,LS_Process.setPointCode as code,LS_Point.geom as geom
 , count(LS_Observation._id) as counter
 FROM sql.LS_Process, sql.LS_Point ,sql.LS_Observation
 WHERE LS_Process.setPointCode=LS_Point.tmpcode
AND LS_Observation.fk_process =LS_Process._id
 group by LS_Process._id, geom