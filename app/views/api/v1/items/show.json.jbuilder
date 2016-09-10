json.extract! @item, :name, :description, :merchant_id, :created_at, :updated_at, :unit_price
json.unit_price format_price(@item.unit_price)
