import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FormationExperienceComponent } from './formation-experience.component';

describe('FormationExperienceComponent', () => {
  let component: FormationExperienceComponent;
  let fixture: ComponentFixture<FormationExperienceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [FormationExperienceComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FormationExperienceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
