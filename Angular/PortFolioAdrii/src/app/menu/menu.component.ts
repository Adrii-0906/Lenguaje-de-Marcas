import { Component } from '@angular/core';
import {MatToolbar} from '@angular/material/toolbar';
import {RouterLink} from '@angular/router';
import {MatButton} from '@angular/material/button';

@Component({
  selector: 'app-menu',
  imports: [
    MatToolbar,
    RouterLink,
    MatButton,
  ],
  templateUrl: './menu.component.html',
  styleUrl: './menu.component.css'
})
export class MenuComponent {

}
