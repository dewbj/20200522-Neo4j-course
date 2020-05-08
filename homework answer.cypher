MATCH (c:Class)<-[r:is_a]-(s:Sample)
MERGE (c)<-[:sample_of]-(s)
SET s.Value = s.Name
DELETE r
RETURN c,s