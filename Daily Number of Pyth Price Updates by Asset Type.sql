SELECT
date_trunc('day',block_timestamp) as day
,CASE 
when event_data:price_feed:price_identifier:bytes = '0x03ae4db29ed4ae33d323568895aa00337e658e348b37509f5372ae51f0af00d5' then 'APT/USD'
when event_data:price_feed:price_identifier:bytes = '0xe62df6c8b4a85fe1a67db44dc12de5db330f7ac66b72dc658afedf0f4a415b43' then 'BTC/USD'
when event_data:price_feed:price_identifier:bytes = '0xff61491a931112ddf1bd8147cd1b641375f79f5825126d665480874634fd0ace' then 'ETH/USD'
when event_data:price_feed:price_identifier:bytes = '0xef0d8b6fda2ceba41da15d4095d1da392a0d2f8ed0c6c7bc0f4cfac8c280b56d' then 'SOL/USD'
when event_data:price_feed:price_identifier:bytes = '0xeaa020c61cc479712813461ce153894a96a6c00b21ed0cfc2798d1f9a9e9c94a' then 'USDC/USD'
when event_data:price_feed:price_identifier:bytes = '0x2b89b9dc8fdf9f34709a5b106b472f0f39bb6ca9ce04b0fd7f2e971688e2e53b' then 'USDT/USD'
when event_data:price_feed:price_identifier:bytes = '0x2356af9529a1064d41e32d617e2ce1dca5733afa901daba9e2b68dee5d53ecf9' then 'CAKE/USD'
when event_data:price_feed:price_identifier:bytes = '0x23d7315113f5b1d3ba7a83604c44b94d79f4fd69af77f804fc7f920a6dc65744' then 'SUI/USD'
when event_data:price_feed:price_identifier:bytes = '0xe5b274b2611143df055d6e7cd8d93fe1961716bcd4dca1cad87a83bc1e78c1ef' then 'CETUS/USD'
when event_data:price_feed:price_identifier:bytes = '0x2f95862b045670cd22bee3114c39763a4a08beeb663b145d283c31d7d1101c4f' then 'BNB/USD'
when event_data:price_feed:price_identifier:bytes = '0xc9d8b075a5c69303365ae23633d4e085199bf5c520a3b90fed1322a0342ffc33' then 'WBTC/USD'
when event_data:price_feed:price_identifier:bytes = '0x74e3fbb0d33e0ed8c0078b56134dcebdae38852f0858a8ea4de4c5ea7474bd42' then 'THL/USD'
else 'other assets' end as Assets
,count(DISTINCT tx_hash) as Price_Updates
FROM aptos.core.fact_events 
WHERE EVENT_TYPE = '0x7e783b349d3e89cf5931af376ebeadbfab855b3fa239b7ada8f5a92fbea6b387::event::PriceFeedUpdate'
and success = 'TRUE'
GROUP BY 1, 2
ORDER BY 1 ASC