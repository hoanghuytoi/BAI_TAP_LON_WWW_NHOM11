import { ProductService } from './product.service';
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../environments/environment';
import { OrderDTO } from '../dtos/order/order.dto';

@Injectable({
  providedIn: 'root',
})
export class OrderService {
  private apiUrl = `${environment.api}/orders`;

  constructor(private http: HttpClient) {}

  placeOrder(orderData: OrderDTO): Observable<any> {    
    // Gửi yêu cầu đặt hàng
    return this.http.post(this.apiUrl, orderData);
  }

  getOrderById(orderId: number): Observable<any> {
    const url = `${environment.api}/orders/${orderId}`;
    return this.http.get(url);
  }

  getOrdersByUserId(userId: number): Observable<any> {
    const url = `${environment.api}/orders/user/${userId}`;
    return this.http.get(url);
  }
}
