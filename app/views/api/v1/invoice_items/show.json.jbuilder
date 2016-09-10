json.extract! @invoice_item, :quantity, :unit_price, :item_id, :invoice_id, :created_at, :updated_at
json.unit_price format_price(@invoice_item.unit_price)
