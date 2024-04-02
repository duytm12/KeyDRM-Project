WITH PhimGoi AS (SELECT PG.Date                       AS Date,
                        'PhimGoi'                     AS Service,
                        COUNT(DISTINCT PG.CustomerID) AS DRM
                 FROM SalesLT.Log_Get_DRM_List PG
                          JOIN SalesLT.Customers C
                               ON PG.CustomerID = C.[customerid ]
                 GROUP BY PG.Date),
     BHD AS (SELECT CAST(B.DATE AS date)         AS Date,
                    'PhimBHD'                    AS Service,
                    COUNT(DISTINCT B.CustomerID) AS DRM
             FROM SalesLT.Log_BHD_MovieID B
             WHERE B.MovieID IN (SELECT MV.id
                                 FROM SalesLT.MV_PropertiesShowVN MV
                                 WHERE MV.isDRM = 1)
             GROUP BY CAST(B.DATE AS date)),
     PhimPlus AS (SELECT CAST(FP.date AS date)         AS Date,
                         'PhimPlus'                    AS Service,
                         COUNT(DISTINCT FP.CustomerID) AS DRM
                  FROM SalesLT.Log_Fimplus_MovieID FP
                  WHERE FP.MovieId IN (SELECT MV.id
                                       FROM SalesLT.MV_PropertiesShowVN MV
                                       WHERE MV.isDRM = 1)
                  GROUP BY CAST(FP.date AS date)),
     Key_DRM AS (SELECT * FROM BHD
                 UNION
                 SELECT * FROM PhimPlus
                 UNION
                 SELECT * FROM PhimGoi)

SELECT *
FROM Key_DRM
ORDER BY Key_DRM.Date;

