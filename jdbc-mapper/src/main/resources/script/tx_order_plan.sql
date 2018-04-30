
——————————————
* 只走其中一个库一张表的表
tx_cancel_payment_log
tx_config
tx_return_detail
tx_return_info
tx_item_attributes
tx_customer_service_status_version

* 需要分库分表数据
tx_customer_service
tx_item_payment
tx_item_promotion
tx_operation_history
tx_order
tx_order_addition
tx_order_extend
tx_order_item
tx_order_reviewed
tx_order_status_version
tx_order_worker
tx_payment_line
tx_payment_line_detail
tx_promotion
tx_promotion_job
tx_refund_bill
tx_attachment


* 数据库表处理流程
  1. 初始化2个数据库
  2. 初始化表
  3. 给表添加sharding_key
  4. 修改表名加_01
  5. 初始化表
  6. 给表添加sharding_key
  7. 修改表名加_02
——————————————





ALTER table  tx_customer_service    RENAME      tx_customer_service_0         ;
ALTER table  tx_item_payment    RENAME          tx_item_payment_0      ;
ALTER table  tx_item_promotion    RENAME        tx_item_promotion_0       ;
ALTER table  tx_operation_history    RENAME     tx_operation_history_0          ;
ALTER table  tx_order    RENAME                 tx_order_0       ;
ALTER table  tx_order_addition    RENAME        tx_order_addition_0       ;
ALTER table  tx_order_extend    RENAME          tx_order_extend_0     ;
ALTER table  tx_order_item    RENAME            tx_order_item_0   ;
ALTER table  tx_order_reviewed    RENAME        tx_order_reviewed_0       ;
ALTER table  tx_order_status_vers    RENAME     tx_order_status_vers_0          ;
ALTER table  tx_order_worker    RENAME          tx_order_worker_0     ;
ALTER table  tx_payment_line    RENAME          tx_payment_line_0     ;
ALTER table  tx_payment_line_detail    RENAME     tx_payment_line_detail_0          ;
ALTER table  tx_promotion    RENAME             tx_promotion_0  ;
ALTER table  tx_promotion_job    RENAME         tx_promotion_job_0      ;
ALTER table  tx_refund_bill    RENAME           tx_refund_bill_0    ;
ALTER table  tx_attachment    RENAME            tx_attachment_0   ;



ALTER table  tx_customer_service    RENAME      tx_customer_service_1         ;
ALTER table  tx_item_payment    RENAME          tx_item_payment_1      ;
ALTER table  tx_item_promotion    RENAME        tx_item_promotion_1       ;
ALTER table  tx_operation_history    RENAME     tx_operation_history_1          ;
ALTER table  tx_order    RENAME                 tx_order_1       ;
ALTER table  tx_order_addition    RENAME        tx_order_addition_1       ;
ALTER table  tx_order_extend    RENAME          tx_order_extend_1     ;
ALTER table  tx_order_item    RENAME            tx_order_item_1   ;
ALTER table  tx_order_reviewed    RENAME        tx_order_reviewed_1       ;
ALTER table  tx_order_status_vers    RENAME     tx_order_status_vers_1          ;
ALTER table  tx_order_worker    RENAME          tx_order_worker_1     ;
ALTER table  tx_payment_line    RENAME          tx_payment_line_1     ;
ALTER table  tx_payment_line_detail    RENAME     tx_payment_line_detail_1          ;
ALTER table  tx_promotion    RENAME             tx_promotion_1  ;
ALTER table  tx_promotion_job    RENAME         tx_promotion_job_1      ;
ALTER table  tx_refund_bill    RENAME           tx_refund_bill_1    ;
ALTER table  tx_attachment    RENAME            tx_attachment_1   ;


