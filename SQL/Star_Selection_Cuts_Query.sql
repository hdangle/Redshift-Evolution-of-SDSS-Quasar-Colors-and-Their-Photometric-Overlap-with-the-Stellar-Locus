WITH step_counts AS (
    SELECT
        COUNT(*) AS n_total_in_region,

        COUNT(CASE WHEN p.type = 6
            THEN 1 END) AS n_after_type,

        COUNT(CASE WHEN p.type = 6
            AND p.clean = 1
            THEN 1 END) AS n_after_clean,

        COUNT(CASE WHEN p.type = 6
            AND p.clean = 1
            AND p.psfMagErr_u >= 0 AND p.psfMagErr_u < 0.1
            AND p.psfMagErr_g >= 0 AND p.psfMagErr_g < 0.1
            AND p.psfMagErr_r >= 0 AND p.psfMagErr_r < 0.1
            AND p.psfMagErr_i >= 0 AND p.psfMagErr_i < 0.1
            AND p.psfMagErr_z >= 0 AND p.psfMagErr_z < 0.1
            THEN 1 END) AS n_after_magerr,

        COUNT(CASE WHEN p.type = 6
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
            AND p.psfMag_z > -100 AND p.psfMag_z < 100
            THEN 1 END) AS n_after_valid_mags

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
)

SELECT 0 AS step, 'objects_in_selected_sky_cells' AS description,
       CAST(NULL AS INT) AS rejected, n_total_in_region AS remaining
INTO MyDB.Star_Selection_Cuts
FROM step_counts

UNION ALL
SELECT 1, 'sdss_photometric_star_classification',
       n_total_in_region - n_after_type, n_after_type
FROM step_counts

UNION ALL
SELECT 2, 'clean_photometry',
       n_after_type - n_after_clean, n_after_clean
FROM step_counts

UNION ALL
SELECT 3, 'photometric_uncertainty_below_0.1',
       n_after_clean - n_after_magerr, n_after_magerr
FROM step_counts

UNION ALL
SELECT 4, 'valid_psf_magnitudes',
       n_after_magerr - n_after_valid_mags, n_after_valid_mags
FROM step_counts

UNION ALL
SELECT 5, 'final_photometric_stellar_sample',
       CAST(NULL AS INT), n_after_valid_mags
FROM step_counts

ORDER BY step;