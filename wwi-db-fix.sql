-- fix: InsertCustomerOrders breaks the record integrity if an invalid StockItemID. 
        -- An order is created and customer is charged without the product information in OrderLines table.
        -- Delivery of the order will not be fulfilled.
        -- raiseerror() if the integrity of order information is broken.

        if not exists (select 1 from Warehouse.StockItems si where si.StockItemID = (select StockItemID from @OrderLines))
            raiserror('Invalid stockItemID', 16, 1);

