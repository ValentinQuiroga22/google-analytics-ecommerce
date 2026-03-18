# Análisis de comportamiento de usuarios — Google Merchandise Store
**Herramientas:** BigQuery (SQL) · Python (pandas, matplotlib, seaborn)  
**Dataset:** GA4 Obfuscated Sample E-commerce — Google Cloud Public Data

---

## Objetivo

Analizar el comportamiento de los usuarios del Google Merchandise Store para identificar
fricciones en el proceso de compra, oportunidades de mejora y patrones de conversión
por día, producto y geografía.

---

## Gráfico 1 — Funnel de conversión

El funnel muestra cuántos usuarios únicos llegaron a cada etapa del proceso de compra,
desde la visita inicial hasta la compra completada.

**Hallazgo principal:** de 267.116 visitantes, solo 4.419 completaron una compra,
resultando en una tasa de conversión global del **1.65%**. El drop-off más crítico
ocurre entre la visita y la visualización de productos — el **77% de los visitantes
nunca llega a ver un producto**, lo que sugiere problemas de navegación o tráfico
mal segmentado.

---

## Gráfico 2 — Conversión por día de semana

Análisis de la tasa de conversión desagregada por día de la semana para identificar
patrones temporales de comportamiento.

**Hallazgo principal:** el viernes es el día de mayor conversión (1.95%), casi el doble
que el domingo (1.08%). El domingo concentra 40.000 sesiones pero convierte muy poco,
lo que representa una oportunidad concreta para campañas de activación específicas
ese día.

---

## Gráfico 3 — Abandono de carrito

Comparación entre usuarios que agregaron productos al carrito y los que efectivamente
completaron la compra.

**Hallazgo principal:** el **81.1% de los usuarios con intención de compra demostrada
no completó la transacción**. Recuperar apenas el 20% de estos usuarios duplicaría
el volumen actual de ventas sin invertir en adquisición de nuevo tráfico. Las causas
más probables son costos de envío inesperados, procesos de checkout largos o falta
de métodos de pago.

---

## Gráfico 4 — Productos más vistos vs conversión

Análisis comparativo entre la cantidad de vistas y la tasa de conversión de los
15 productos más vistos del sitio.

**Hallazgo principal:** dos productos acumulan más de **76.000 vistas combinadas
con cero compras** — Google Women's Striped L/S (42.142 vistas) y Google F/C Long
Sleeve Tee Charcoal (34.275 vistas). Esto no es un problema de demanda sino de
experiencia de producto: precio, stock, fotos o un error técnico en el botón de compra.
El contraste con el Google Crewneck Sweatshirt Navy (0.70% de conversión) refuerza
esta hipótesis.

---

## Gráfico 5 — Tráfico y conversión por país

Análisis geográfico que cruza el volumen de tráfico con la tasa de conversión
por país para identificar mercados con oportunidades de crecimiento.

**Hallazgo principal:** mercados pequeños como Turquía (2.82%) y España (2.62%)
superan la conversión de mercados core como Estados Unidos (2.12%) y Alemania (1.81%).
Esto sugiere dos acciones: aumentar inversión publicitaria en mercados emergentes
con alta intención de compra, e investigar problemas de localización en mercados
grandes con conversión por debajo del promedio.

---

## Conclusión general

El análisis revela que el principal problema del Google Merchandise Store no es
la adquisición de tráfico sino la conversión. Con 267.000 visitantes mensuales
y solo 1.65% de conversión global, existe una oportunidad significativa de
mejora sin necesidad de aumentar el presupuesto publicitario. Las tres palancas
más concretas son: optimizar la navegación para reducir el drop-off temprano del
funnel, reducir el abandono de carrito con emails automáticos y checkout simplificado,
y resolver los problemas específicos de los productos con alta visibilidad y cero ventas.

Dashboard: 
https://lookerstudio.google.com/s/l5pD2APRcvw
