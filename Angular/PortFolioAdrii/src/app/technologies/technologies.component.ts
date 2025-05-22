import { Component } from '@angular/core';
import {MatIconModule} from '@angular/material/icon';
import {MatCardModule} from '@angular/material/card';

@Component({
  selector: 'app-technologies',
  imports: [
    MatIconModule,
    MatCardModule
  ],
  standalone: true,
  templateUrl: './technologies.component.html',
  styleUrl: './technologies.component.css'
})
export class TechnologiesComponent {

}
