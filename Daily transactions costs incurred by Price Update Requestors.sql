with t1 as (
SELECT DISTINCT 
tx_hash as txn_hash
FROM aptos.core.fact_events
where event_address = '0x7e783b349d3e89cf5931af376ebeadbfab855b3fa239b7ada8f5a92fbea6b387'
)

SELECT 
date_trunc('day',block_timestamp) as Day
,sum(gas_used*gas_unit_price) / 10000000 as tx_costs
,sum(tx_costs) over (order by day ASC) as cum_cost
FROM aptos.core.fact_transactions a
JOIN t1 b 
on a.tx_hash = b.txn_hash
GROUP by 1
ORDER by 1 ASC 