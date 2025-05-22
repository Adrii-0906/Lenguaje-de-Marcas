import { Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { FormationExperienceComponent} from './formation-experience/formation-experience.component';
import { TechnologiesComponent} from './technologies/technologies.component';

export const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'home',component: HomeComponent},
  { path: 'formation-experience',component: FormationExperienceComponent},
  { path: 'technologies',component: TechnologiesComponent},
];
