import { Component, OnInit } from '@angular/core';
import { PorfolioService } from 'src/app/servicios/porfolio.service';

@Component({
  selector: 'app-soft-skills',
  templateUrl: './soft-skills.component.html',
  styleUrls: ['./soft-skills.component.css']
})
export class SoftSkillsComponent implements OnInit {
  softSkillList:any;
  constructor(private datosPorfolio:PorfolioService) { }

  ngOnInit(): void {
    this.datosPorfolio.obtenerDatos()
    .subscribe(data=>
    {
      console.log(data)
      this.softSkillList=data.soft;
    });
  } 

}
