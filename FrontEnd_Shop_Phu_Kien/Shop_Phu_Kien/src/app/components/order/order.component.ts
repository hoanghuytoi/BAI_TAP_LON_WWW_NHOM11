import { Component, OnInit } from '@angular/core';
import { Product } from '../../models/product';
import { CartService } from '../../services/cart.service';
import { ProductService } from '../../services/product.service';
import { OrderService } from '../../services/order.service';
import { TokenService } from '../../services/token.service';
import { environment } from 'src/app/environments/environment';
import { OrderDTO } from '../../dtos/order/order.dto';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { Order } from 'src/app/models/order';

@Component({
  selector: 'app-order',
  templateUrl: './order.component.html',
  styleUrls: ['./order.component.scss']
})
export class OrderComponent implements OnInit{
  orderForm: FormGroup; // Đối tượng FormGroup để quản lý dữ liệu của form
  cartItems: { product: Product, quantity: number }[] = [];
  couponCode: string = ''; // Mã giảm giá
  totalAmount: number = 0; // Tổng tiền
  orderData: OrderDTO = {
    user_id: 0, // Thay bằng user_id thích hợp
    fullname: '', // Khởi tạo rỗng, sẽ được điền từ form
    email: '', // Khởi tạo rỗng, sẽ được điền từ form
    phone_number: '', // Khởi tạo rỗng, sẽ được điền từ form
    address: '', // Khởi tạo rỗng, sẽ được điền từ form
    note: '', // Có thể thêm trường ghi chú nếu cần
    total_money: 0, // Sẽ được tính toán dựa trên giỏ hàng và mã giảm giá
    payment_method: 'cod', // Mặc định là thanh toán khi nhận hàng (COD)
    shipping_method: 'express', // Mặc định là vận chuyển nhanh (Express)
    coupon_code: '', // Sẽ được điền từ form khi áp dụng mã giảm giá
    cart_items: []
  };

  constructor(
    private cartService: CartService,
    private productService: ProductService,
    private orderService: OrderService,
    private tokenService: TokenService,
    private formBuilder: FormBuilder,
    private activatedRoute: ActivatedRoute,
    private router: Router,
  ) {
    // Tạo FormGroup và các FormControl tương ứng
    this.orderForm = this.formBuilder.group({
      fullname: ['Nguyễn Tấn Lộc', Validators.required], // fullname là FormControl bắt buộc      
      email: ['nguyentanloc13c9@gmail.com', [Validators.email]], // Sử dụng Validators.email cho kiểm tra định dạng email
      phone_number: ['0326559994', [Validators.required, Validators.minLength(6)]], // phone_number bắt buộc và ít nhất 6 ký tự
      address: ['245 ấp 5, xã Tân Lợi Thạnh, huyện Giồng Trôm, tỉnh Bến Tre', [Validators.required, Validators.minLength(5)]], // address bắt buộc và ít nhất 5 ký tự
      note: ['dễ vỡ'],
      shipping_method: ['express'],
      payment_method: ['cod']
    });
  }
  
  ngOnInit(): void {  
    debugger;
    this.orderData.user_id = this.tokenService.getUserId();

    const buyNowProductData = localStorage.getItem('buyNowProduct');
    if (buyNowProductData) {
        // Nếu có sản phẩm "Mua ngay" trong localStorage, xử lý riêng
        const { productId, quantity } = JSON.parse(buyNowProductData);
        this.productService.getProductsByIds([productId]).subscribe({
            next: (products) => {
                debugger;
                const product = products[0];
                if (product) {
                    product.thumbnail = `${environment.api}/products/images/${product.thumbnail}`;
                    this.cartItems = [{ product, quantity }];
                }
            },
            complete: () => {
                debugger;
                this.calculateTotal();
                localStorage.removeItem('buyNowProduct'); // Xóa sản phẩm "Mua ngay" sau khi xử lý
            },
            error: (error: any) => {
                console.error('Error fetching product for buy now:', error);
            }
        });
    } else {
        // Xử lý lấy từ giỏ hàng thông thường
        const cart = this.cartService.getCart();
        const productIds = Array.from(cart.keys());
        if (productIds.length === 0) return;

        this.productService.getProductsByIds(productIds).subscribe({
            next: (products) => {
                this.cartItems = productIds.map((productId) => {
                    const product = products.find((p) => p.id === productId);
                    if (product) {
                        product.thumbnail = `${environment.api}/products/images/${product.thumbnail}`;
                    }
                    return {
                        product: product!,
                        quantity: cart.get(productId)!
                    };
                });
            },
            complete: () => {
                this.calculateTotal();
            },
            error: (error: any) => {
                console.error('Error fetching cart details:', error);
            }
        });
    }
}


  



placeOrder() {
  debugger;
  if (this.orderForm.valid) {
    this.orderData = {
      ...this.orderData,
      ...this.orderForm.value
    };
    this.orderData.cart_items = this.cartItems.map(cartItem => ({
      product_id: cartItem.product.id,
      quantity: cartItem.quantity
    }));
    this.orderData.total_money = this.totalAmount;

    this.orderService.placeOrder(this.orderData).subscribe({
      next: (response: Order) => {
        debugger;
        alert('Đặt hàng thành công');
        
        const isBuyNow = localStorage.getItem('buyNow') === 'true';
        if (isBuyNow) {
          localStorage.removeItem('buyNow'); // Xóa cờ "Mua ngay"
          localStorage.removeItem('buyNowProduct'); // Xóa sản phẩm "Mua ngay"
        } else {
          this.cartService.clearCart(); // Xóa toàn bộ giỏ hàng nếu không phải "Mua ngay"
        }

        this.router.navigate(['/']);
      },
      complete: () => {
        debugger;
        this.calculateTotal();
      },
      error: (error: any) => {
        debugger;
        alert(`Lỗi khi đặt hàng: ${error}`);
      },
    });
  } else {
    alert('Dữ liệu không hợp lệ. Vui lòng kiểm tra lại.');
  }        
}


    
    
  
  // Hàm tính tổng tiền
  calculateTotal(): void {
      this.totalAmount = this.cartItems.reduce(
          (total, item) => total + item.product.price * item.quantity,
          0
      );
  }

  // Hàm xử lý việc áp dụng mã giảm giá
  applyCoupon(): void {
      // Viết mã xử lý áp dụng mã giảm giá ở đây
      // Cập nhật giá trị totalAmount dựa trên mã giảm giá nếu áp dụng
  }
}
