package com.project.shopapp.controllers;

import com.project.shopapp.components.LocalizationUtils;
import com.project.shopapp.dtos.requests.order.OrderDetailDTO;
import com.project.shopapp.dtos.responses.orderdetail.OrderDetailResponse;
import com.project.shopapp.services.orderdetail.OrderDetailService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("${api.prefix}/order-details")
@RequiredArgsConstructor
public class OrderDetailController {

    private final OrderDetailService orderDetailService;
    private final LocalizationUtils localizationUtils;

    @GetMapping("/{id}")
    public ResponseEntity<?> getOrderDetail(@PathVariable("id") int orderId){
        try {
            OrderDetailResponse orderDetailResponse = orderDetailService.getOrderDetail(orderId);
            return ResponseEntity.ok(orderDetailResponse);
        }catch (Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("")
    public ResponseEntity<?> getOrderDetails(){
        try {
            List<OrderDetailResponse> orderDetailResponse = orderDetailService.getAllOrderDetails();
            return ResponseEntity.ok(orderDetailResponse);
        }catch (Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping("")
    public ResponseEntity<?> createOrderDetail(@RequestBody @Valid OrderDetailDTO orderDetailDTO){
        try {
            OrderDetailResponse orderDetailResponse = orderDetailService.createOrderDetail(orderDetailDTO);
            return ResponseEntity.ok(orderDetailResponse);
        }catch (Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("/order/{orderId}")
    public ResponseEntity<?> getOrderDetailsByOrderId(@PathVariable("orderId") int orderId){
        try {
            List<OrderDetailResponse> orderDetailResponses = orderDetailService.findByOrderId(orderId);
            return ResponseEntity.ok(orderDetailResponses);
        }catch (Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateOrderDetail(@PathVariable("id") int orderDetailId, @RequestBody @Valid OrderDetailDTO orderDerailDTO){
        try {
            OrderDetailResponse orderDetailResponse = orderDetailService.updateOrderDetail(orderDetailId, orderDerailDTO);
            return ResponseEntity.ok(orderDetailResponse);
        }catch (Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteOrderDetail(@PathVariable("id") int orderDetailId){
        try {
            orderDetailService.deleteById(orderDetailId);
            return ResponseEntity.ok("Order detail deleted successfully");
        }catch (Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

}
