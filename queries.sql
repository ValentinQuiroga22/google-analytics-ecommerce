#Funnel completo
SELECT
  event_name,
  COUNT(DISTINCT user_pseudo_id) AS usuarios_unicos
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name IN (
  'session_start',
  'view_item',
  'add_to_cart',
  'begin_checkout',
  'purchase'
)
GROUP BY event_name
ORDER BY usuarios_unicos DESC;

#Conversion por dia de semana
SELECT
  FORMAT_DATE('%A', DATE(TIMESTAMP_MICROS(event_timestamp))) AS dia_semana,
  COUNTIF(event_name = 'session_start') AS sesiones,
  COUNTIF(event_name = 'purchase') AS compras,
  ROUND(
    COUNTIF(event_name = 'purchase') / COUNTIF(event_name = 'session_start') * 100
  , 2) AS tasa_conversion_pct
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name IN ('session_start', 'purchase')
GROUP BY dia_semana
ORDER BY tasa_conversion_pct DESC;

#Abandono de carrito
SELECT
  COUNTIF(event_name = 'add_to_cart') AS usuarios_abandonaron,
  COUNTIF(event_name = 'purchase') AS usuarios_compraron,
  ROUND(
    COUNTIF(event_name = 'add_to_cart') / COUNTIF(event_name = 'purchase') * 100
  , 2) AS pct_abandono
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name IN ('add_to_cart', 'purchase');

#Productos mas vistos
SELECT
  item_name,
  COUNT(*) AS visualizaciones
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`,
  UNNEST(items) AS item
WHERE event_name = 'view_item'
GROUP BY item_name
ORDER BY visualizaciones DESC
LIMIT 10;

#Paises con mas usuarios
SELECT
  geo.country,
  COUNT(DISTINCT user_pseudo_id) AS usuarios_unicos
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE geo.country IS NOT NULL
GROUP BY geo.country
ORDER BY usuarios_unicos DESC
LIMIT 10;

#Productos mas vistos vs Conversion
SELECT
  item.item_name AS producto,
  COUNTIF(event_name = 'view_item') AS veces_visto,
  COUNTIF(event_name = 'purchase') AS veces_comprado,
  ROUND(
    COUNTIF(event_name = 'purchase') * 100.0 / COUNTIF(event_name = 'view_item')
  , 2) AS tasa_conversion_pct
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`,
  UNNEST(items) AS item
WHERE event_name IN ('view_item', 'purchase')
  AND item.item_name IS NOT NULL
GROUP BY producto
HAVING COUNTIF(event_name = 'view_item') > 100
ORDER BY veces_visto DESC
LIMIT 15;

#Paises con mas trafico y Conversion
SELECT
  geo.country AS pais,
  COUNT(DISTINCT user_pseudo_id) AS usuarios,
  COUNTIF(event_name = 'purchase') AS compras,
  ROUND(
    COUNTIF(event_name = 'purchase') * 100.0 / NULLIF(COUNT(DISTINCT user_pseudo_id), 0)
  , 2) AS tasa_conversion_pct
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name IN ('session_start', 'purchase')
  AND geo.country IS NOT NULL
  AND geo.country != ''
GROUP BY pais
HAVING COUNT(DISTINCT user_pseudo_id) > 500
ORDER BY usuarios DESC
LIMIT 15;