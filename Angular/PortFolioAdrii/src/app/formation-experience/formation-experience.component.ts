import { Component } from '@angular/core';
import { MatExpansionModule } from '@angular/material/expansion';
import {MatIcon} from '@angular/material/icon';
import {MatCardModule} from '@angular/material/card';


@Component({
  selector: 'app-formation-experience',
  imports: [
    MatExpansionModule,
    MatIcon,
    MatCardModule
  ],
  standalone: true,
  templateUrl: './formation-experience.component.html',
  styleUrl: './formation-experience.component.css'
})
export class FormationExperienceComponent {

}
