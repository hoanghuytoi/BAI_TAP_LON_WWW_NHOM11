import { Component, OnInit, HostListener, ElementRef } from '@angular/core';
import { UserService } from '../../services/user.service';
import { UserResponse } from 'src/app/responses/user/user.response';
import { TokenService } from 'src/app/services/token.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {
  userResponse?: UserResponse | null;
  isPopoverOpen = false;
  activeNaItem: number = 0;

  constructor(
    private router: Router,
    private userService: UserService,
    private tokenService: TokenService,
    private elementRef: ElementRef
  ) {}

  ngOnInit() {
    this.userResponse = this.userService.getUserResponseFromLocalStorage();
  }

  togglePopover(event: Event): void {
    event.preventDefault();
    this.isPopoverOpen = !this.isPopoverOpen;
  }

  handleItemClick(index: number): void {
    if(index === 0){
      this.router.navigate(['/user-profile']);
    }else if(index === 1){
      this.router.navigate(['/order-info']);
    }
    
    else if(index === 2) {
      this.userService.removeUserFromLocalStorage();
      this.tokenService.removeToken();
      this.userResponse = this.userService.getUserResponseFromLocalStorage();
    }
    this.isPopoverOpen = false; // Close the popover after clicking an item
  }

  @HostListener('document:click', ['$event'])
  onDocumentClick(event: Event): void {
    const targetElement = event.target as HTMLElement;
    // Kiểm tra xem click có nằm trong popover hoặc nút toggle không
    if (!this.elementRef.nativeElement.contains(targetElement)) {
      this.isPopoverOpen = false; // Đóng popover
    }
  }
  setActiveNavItem(index: number): void {
    debugger
    this.activeNaItem = index;
  }
}
