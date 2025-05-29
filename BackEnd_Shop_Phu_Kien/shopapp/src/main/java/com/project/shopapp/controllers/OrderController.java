package com.project.shopapp.controllers;

import com.project.shopapp.components.LocalizationUtils;
import com.project.shopapp.dtos.requests.order.OrderDTO;
import com.project.shopapp.dtos.responses.order.OrderResponse;
import com.project.shopapp.models.Order;
import com.project.shopapp.services.order.OrderService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("${api.prefix}/orders")
@RequiredArgsConstructor
public class OrderController {

    private final OrderService orderService;
    private final LocalizationUtils localizationUtils;

    @PostMapping("")
    public ResponseEntity<?> createOrder(@Valid @RequestBody OrderDTO orderDTO, BindingResult bindingResult)  {
        try {
            if(bindingResult.hasErrors()){
                List<String> errorMessages =  bindingResult.getFieldErrors().stream().map(FieldError::getDefaultMessage).toList();
                return ResponseEntity.badRequest().body(errorMessages);
            }
            Order order = orderService.createOrder(orderDTO);
            return ResponseEntity.ok(OrderResponse.fromOrder(order));
        }catch (Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("user/{user_id}")
    public ResponseEntity<?> getOrdersByUser(@Valid @PathVariable("user_id") int userId){
       try {
            List<Order> orders = orderService.findByUserId(userId);
            List<OrderResponse> orderResponses = new java.util.ArrayList<>(List.of());
            for (Order order : orders){
                orderResponses.add(OrderResponse.fromOrder(order));
            }
            return ResponseEntity.ok(orderResponses);
       }catch (Exception e){
           return ResponseEntity.badRequest().body(e.getMessage());
       }
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getOrder(@Valid @PathVariable("id") int userId){
        try {
            Order order = orderService.getOrder(userId);
            OrderResponse orderResponse = OrderResponse.fromOrder(order);
            return ResponseEntity.ok(orderResponse);
        }catch (Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("")
    public ResponseEntity<?> getAllOrders(){
        try {
            List<Order> orders = orderService.getAllOrders();
            return ResponseEntity.ok(orders);
        }catch (Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/{order_id}")
    public ResponseEntity<?> updateOrder(@Valid @PathVariable("order_id") int orderId, @Valid @RequestBody OrderDTO orderDTO){
        try {
            Order order = orderService.updateOrder(orderId, orderDTO);
            return ResponseEntity.ok(order);
        }catch (Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @DeleteMapping("/{order_id}")
    public ResponseEntity<String> deleteOrder(@Valid @PathVariable("order_id") int orderId){
        try {
            orderService.deleteOrder(orderId);
            return ResponseEntity.ok("Delete order with id = " + orderId);
        }catch (Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }


}
