with t2 as (
SELECT DISTINCT
tx_hash as txn_hash
FROM aptos.core.fact_events
WHERE event_address = '0x7e783b349d3e89cf5931af376ebeadbfab855b3fa239b7ada8f5a92fbea6b387'
)

SELECT 
date_trunc('day',block_timestamp) as Day
,count(DISTINCT sender) as unique_wallets
,sum(unique_wallets) over (order by 'day') as total_unique_wallets
FROM aptos.core.fact_transactions a 
JOIN t2 b 
ON a.tx_hash = b.txn_hash
GROUP by 1
ORDER by 1 ASC 