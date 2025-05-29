import { Component } from '@angular/core';
import { Order } from 'src/app/models/order';
import { OrderService } from 'src/app/services/order.service';
import { TokenService } from 'src/app/services/token.service';

@Component({
  selector: 'app-order-info',
  templateUrl: './order-info.component.html',
  styleUrls: ['./order-info.component.scss']
})
export class OrdersInfoComponent {
  orders: Order[] = []; // Mảng lưu danh sách đơn hàng
  loading: boolean = false; // Biến để hiển thị trạng thái tải dữ liệu
  error: string | null = null; // Biến lưu thông báo lỗi
  selectedOrder?: Order;

  constructor(
    private orderService: OrderService,
    private tokenService: TokenService // Sử dụng để lấy userId từ token
  ) {}

  ngOnInit(): void {
    this.loading = true;

    // Lấy userId từ TokenService
    const userId = this.tokenService.getUserId();

    if (userId) {
      this.orderService.getOrdersByUserId(userId).subscribe({
        next: (response) => {
          this.orders = response; // Gán danh sách đơn hàng
          debugger
        },
        error: (error) => {
          this.error = 'Không thể tải đơn hàng. Vui lòng thử lại!';
          console.error(error);
        },
        complete: () => {
          this.loading = false;
        },
      });
    } else {
      this.error = 'Không tìm thấy thông tin người dùng.';
      this.loading = false;
    }
  }

  toggleOrderDetails(order: Order): void {
    if (this.selectedOrder === order) {
      this.selectedOrder = undefined; // Nếu đã chọn rồi thì ẩn chi tiết
    } else {
      this.selectedOrder = order; // Hiển thị chi tiết đơn hàng đã chọn
    }
  }

}
