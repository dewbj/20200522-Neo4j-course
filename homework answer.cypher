MATCH (c:Class)<-[r:is_a]-(s:Sample)
MERGE (c)<-[:sample_of]-(s)
DELETE r
RETURN c,s