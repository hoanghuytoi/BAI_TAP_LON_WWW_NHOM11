package com.project.shopapp.dtos.responses.product;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.project.shopapp.dtos.responses.BaseResponse;
import com.project.shopapp.models.Product;
import com.project.shopapp.models.ProductImage;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.ArrayList;
import java.util.List;


@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProductResponse extends BaseResponse {

    int id;
    String name;
    Float price;
    String description;
    String thumbnail;
    @JsonProperty("category_id")
    int categoryId;

    @JsonProperty("product_images")
    List<ProductImage> productImages = new ArrayList<>();


    public static ProductResponse fromProduct(Product product) {
        ProductResponse productResponse=  ProductResponse.builder()
                .id(product.getId())
                .name(product.getName())
                .price(product.getPrice())
                .description(product.getDescription())
                .thumbnail(product.getThumbnail())
                .productImages(product.getProductImages())
                .categoryId(product.getCategory().getId())
                .build();
        productResponse.setCreatedAt(product.getCreatedAt());
        productResponse.setUpdatedAt(product.getUpdatedAt());
        return productResponse;
    }
}
