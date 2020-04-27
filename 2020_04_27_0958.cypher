LOAD CSV WITH HEADERS
FROM "FILE:///table_L6_train.csv" AS File
FIELDTERMINATOR '\t'
WITH File, apoc.text.split(apoc.text.replace(File.`#OTU ID`,'D_*._*',''),';') AS Text
WITH
    Text[0] AS D0,
    Text[1] AS D1,
    Text[2] AS D2,
    Text[3] AS D3,
    Text[4] AS D4,
    Text[5] AS D5,
    toFloat(File.`193`) AS `193`,
    toFloat(File.`192-2`) AS `192-2`,
    toFloat(File.`193-2`) AS `193-2`
WITH [D0,D1,D2,D3,D4,D5,`193`,`192-2`,`193-2`] AS List
MERGE (n0:D0:Class {Name: List[0]})
WITH List, n0
MERGE (n0)<-[:is_a]-(n1:D1:Class {Name: List[1]})
WITH List, n1
MERGE (n1)<-[:is_a]-(n2:D2:Class {Name: List[2]})
WITH List, n2
MERGE (n2)<-[:is_a]-(n3:D3:Class {Name: List[3]})
WITH List, n3
MERGE (n3)<-[:is_a]-(n4:D4:Class {Name: List[4]})
WITH List, n4
MERGE (n4)<-[:is_a]-(n5:D5:Class {Name: List[5]})
WITH List, n5
MERGE (n5)<-[:is_a]-(n6:`193`:Sample {Name: List[6]})
WITH List, n5
MERGE (n5)<-[:is_a]-(n7:`192-2`:Sample {Name: List[7]})
WITH List, n5
MERGE (n5)<-[:is_a]-(n8:`193-2`:Sample {Name: List[8]})
WITH '' AS s
MATCH (n:Class) RETURN n