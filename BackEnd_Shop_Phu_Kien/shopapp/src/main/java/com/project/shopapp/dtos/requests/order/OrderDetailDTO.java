package com.project.shopapp.dtos.requests.order;


import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderDetailDTO {

    @JsonProperty("order_id")
    int orderId;

    @JsonProperty("product_id")
    int productId;

    @JsonProperty("price")
    Float price;

    @JsonProperty("number_of_products")
    int numberOfProducts;

    @JsonProperty("total_money")
    Float totalMoney;

    @JsonProperty("color")
    String color;

}
