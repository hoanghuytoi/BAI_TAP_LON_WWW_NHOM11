package com.project.shopapp.services.order;
import com.project.shopapp.dtos.requests.order.OrderDTO;
import com.project.shopapp.exceptions.DataNotFoundException;
import com.project.shopapp.models.Order;

import java.util.List;


public interface IOrderService {
    Order createOrder(OrderDTO orderDTO) throws Exception;
    Order getOrder(int id) throws DataNotFoundException;
    Order updateOrder(int id, OrderDTO orderDTO) throws DataNotFoundException;
    void deleteOrder(int id);
    List<Order> findByUserId(int userId) throws DataNotFoundException;
    List<Order> getAllOrders();
}
