SELECT
    p.objID,
    p.ra,
    p.dec,
    p.type,
    p.clean,
    p.psfMag_u,
    p.psfMag_g,
    p.psfMag_r,
    p.psfMag_i,
    p.psfMag_z,
    p.psfMagErr_u,
    p.psfMagErr_g,
    p.psfMagErr_r,
    p.psfMagErr_i,
    p.psfMagErr_z,
    p.extinction_u,
    p.extinction_g,
    p.extinction_r,
    p.extinction_i,
    p.extinction_z
INTO MyDB.Star_Catalog
FROM PhotoPrimary AS p
WHERE
(
       (p.dec >= -10 AND p.dec < 0
        AND p.ra >= 30 AND p.ra < 40)
    OR (p.dec >= 0 AND p.dec < 10
        AND (
               (p.ra >= 0   AND p.ra < 30)
            OR (p.ra >= 350 AND p.ra < 360)
        ))
    OR (p.dec >= 10 AND p.dec < 20
        AND p.ra >= 20 AND p.ra < 30)
    OR (p.dec >= 20 AND p.dec < 30
        AND (
               (p.ra >= 10  AND p.ra < 20)
            OR (p.ra >= 130 AND p.ra < 140)
            OR (p.ra >= 150 AND p.ra < 160)
            OR (p.ra >= 340 AND p.ra < 350)
        ))
    OR (p.dec >= 30 AND p.dec < 40
        AND (
               (p.ra >= 120 AND p.ra < 130)
            OR (p.ra >= 140 AND p.ra < 160)
            OR (p.ra >= 190 AND p.ra < 210)
            OR (p.ra >= 240 AND p.ra < 260)
        ))
    OR (p.dec >= 40 AND p.dec < 50
        AND (
               (p.ra >= 180 AND p.ra < 190)
            OR (p.ra >= 210 AND p.ra < 220)
            OR (p.ra >= 240 AND p.ra < 250)
        ))
)
AND p.type = 6
AND p.clean = 1
AND p.psfMagErr_u >= 0 AND p.psfMagErr_u < 0.1
AND p.psfMagErr_g >= 0 AND p.psfMagErr_g < 0.1
AND p.psfMagErr_r >= 0 AND p.psfMagErr_r < 0.1
AND p.psfMagErr_i >= 0 AND p.psfMagErr_i < 0.1
AND p.psfMagErr_z >= 0 AND p.psfMagErr_z < 0.1
AND p.psfMag_u > -100 AND p.psfMag_u < 100
AND p.psfMag_g > -100 AND p.psfMag_g < 100
AND p.psfMag_r > -100 AND p.psfMag_r < 100
AND p.psfMag_i > -100 AND p.psfMag_i < 100
AND p.psfMag_z > -100 AND p.psfMag_z < 100;