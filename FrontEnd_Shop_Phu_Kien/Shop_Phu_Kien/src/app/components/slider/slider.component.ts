import { Component, OnInit, OnDestroy } from '@angular/core';

@Component({
  selector: 'app-slider',
  templateUrl: './slider.component.html',
  styleUrls: ['./slider.component.scss']
})
export class SliderComponent implements OnInit, OnDestroy {
  images: string[] = [
    './assets/images/BluePurpleModernGradientWereLaunchingExclusivePhoneBanner.png',
    './assets/images/BluePurpleModernGradientWereLaunchingExclusivePhoneBanner2.png',

  ];
  currentIndex = 0;
  interval: any;

  ngOnInit() {
    this.interval = setInterval(() => this.nextSlide(), 3000);
  }

  ngOnDestroy() {
    clearInterval(this.interval);
  }

  nextSlide() {
    this.currentIndex = (this.currentIndex + 1) % this.images.length;
  }

  prevSlide() {
    this.currentIndex =
      (this.currentIndex - 1 + this.images.length) % this.images.length;
  }
}
