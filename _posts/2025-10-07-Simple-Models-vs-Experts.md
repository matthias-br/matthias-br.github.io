---
layout: post
title:  Simple Models vs. Experts. The Case of GDP Growth Prediction
author: Matthias
excerpt_separator: <!--end_excerpt-->
---
How do simple predictions models fare against experts when applied to GDP growth rates? <!--end_excerpt-->

Each year in November, the German Council of Economic Experts publishes a report on the country’s economic situation, containing also a forecast of real GDP growth for the following year. Since its establishment in 1963, the council has had a considerable impact on economic policy, with its members being dubbed as “economic sages”. How do the sages’ forecasts hold up when compared to actual GDP growth rates, and can they beat simple prediction models?

I will compare the expert forecasts of annual GDP growth from 2010 to 2025 against predictions based on i) a simple historical mean, ii) a 3-year moving average, and iii) an OLS autoregression of each years GDP growth on 3 lags, using data from a rolling 10-year window. Unlike the expert forecasts that build on additional data and domain knowledge, these predictive models are exclusively based on time series data of the dependent variable alone and can reasonably be expected to perform worse.

The figure below shows actual GDP growth (in % of previous year) and forecasted growth according to each method. On a side note, R packages `flexdashboard`, `plotly`, and `crosstalk` allow you to create Shiny-like dashboards - without Shiny. However, as the R Markdown document is simply knit to a static HTML file, the dashboard lacks Shiny’s reactivity, meaning it is limited to displaying existing data and can’t generate any new data. For our purposes here, that’s perfectly sufficient.

<iframe src="/images/dashboard-gdp-growth-prediction.html" height="520px" width="115%" style="border:none;"></iframe>

As we can see, none of the forecast methods are very accurate, although some do fare better than others. The Covid-19-induced downturn in 2020 was of course absolutely unpredictable for all models, but it exhibits a particular risk associated with using recent lags for prediction, such as with the 3-year moving average and autoregression: If an unpredicted downturn is immediately followed by growth, as is often the case, these models will still predict a downturn. Especially the autoregression also exhibits some dramatical positive overshoots, compensating for the preceding downturns (2008 financial crisis, Covid-19 pandemic) by reversing to the mean and subsequently overcorrecting. 

Ranked by RMSE, the experts indeed performed best, followed very closely by the historical mean, with the moving average further behind and the autoregression coming in last.

|Metric	|Experts|Historical mean|3-year MA|AR(3)|
|---	|---|---|---|---|
|RMSE	|1.8|2.0|2.6|5.4|
|Hit rate	|5/15|4/15|1/15|3/15|

In other words, the most complex model by far (data-driven human judgement) performed best, as might be expected, but among the time series-based prediction models, the simplest one did not only beat the (somewhat) more complex ones, it also comes very close to the winning model’s accuracy. 

If we arbitrarily define a tolerance of +- 0.5 p.pt. to be an acceptable margin of error for a forecast, the experts still lead with five “hits”, still followed by the historical mean, while the autoregression now outperforms the moving average by two hits.

If we think about it from the perspective of some decision maker, be it a business owner or a politician, none of these odds look to good. But what really stands out is just how close the simplest method of forecasting gets to a (presumably costly) expert judgement. Experts’ domain knowledge does appear to give them a certain edge as a crisis unfolds, they accurately predicted the 2021 growth following the pandemic downturn. But it is still not enough to foresee a future crisis. In fact, the very same council, like most economists, could famously also not predict the crises of 2007 or 2011.

In summary: Forecasts of GDP growth on time series data of the dependent variable alone are generally inaccurate, but experts are barely any better. Considering the cost of experts, prediction by historical mean could be a solid option for simple one-year-ahead forecasts. But what then is the point of having an expert council, and should we listen to them as much as we do? Perhaps this shows the need for an advisory institution with a more critical view on economic affairs (and itself). It certainly illustrates how higher model complexity does not equal higher predictive accuracy.
