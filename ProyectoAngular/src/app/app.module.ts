import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { EncabezadoComponent } from './componentes/encabezado/encabezado.component';
import { BannerComponent } from './componentes/banner/banner.component';
import { AcercaComponent } from './componentes/acerca/acerca.component';
import { InformacionComponent } from './componentes/informacion/informacion.component';
import { FooterComponent } from './componentes/footer/footer.component';
import {HttpClientModule} from '@angular/common/http';
import { ExperienciaComponent } from './componentes/experiencia/experiencia.component';
import { DatosComponent } from './componentes/datos/datos.component';
import { EstudiosComponent } from './componentes/estudios/estudios.component';
import { SoftSkillsComponent } from './componentes/soft-skills/soft-skills.component';
import { TecnologiasComponent } from './componentes/tecnologias/tecnologias.component';

@NgModule({
  declarations: [
    AppComponent,
    EncabezadoComponent,
    BannerComponent,
    AcercaComponent,
    InformacionComponent,
    FooterComponent,
    ExperienciaComponent,
    DatosComponent,
    EstudiosComponent,
    SoftSkillsComponent,
    TecnologiasComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
