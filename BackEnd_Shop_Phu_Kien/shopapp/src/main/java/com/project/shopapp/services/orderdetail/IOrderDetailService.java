package com.project.shopapp.services.orderdetail;

import com.project.shopapp.dtos.requests.order.OrderDetailDTO;
import com.project.shopapp.dtos.responses.orderdetail.OrderDetailResponse;
import com.project.shopapp.exceptions.DataNotFoundException;

import java.util.List;

public interface IOrderDetailService {
    OrderDetailResponse createOrderDetail(OrderDetailDTO newOrderDetail) throws Exception;

    OrderDetailResponse getOrderDetail(int id) throws DataNotFoundException;

    OrderDetailResponse updateOrderDetail(int id, OrderDetailDTO newOrderDetailData)
            throws DataNotFoundException;

    void deleteById(int id);

    List<OrderDetailResponse> getAllOrderDetails();

    List<OrderDetailResponse> findByOrderId(int orderId) throws DataNotFoundException;
}