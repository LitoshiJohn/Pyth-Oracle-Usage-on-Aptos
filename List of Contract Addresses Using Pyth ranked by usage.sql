with t5 as
(SELECT
date_trunc('day',block_timestamp) as date
,sender
,tx_hash
  from aptos.core.fact_transactions
  where payload_function like '%0x7e783b349d3e89cf5931af376ebeadbfab855b3fa239b7ada8f5a92fbea6b387%'
)

SELECT
DISTINCT sender as Contract_Address
,count(tx_hash) as usage
from t5
GROUP by 1
ORDER by 2 DESC 