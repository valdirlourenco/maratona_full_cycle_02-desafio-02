import { Controller, Get, Post, Body } from '@nestjs/common';
import { Maratona } from '../maratona/maratona.entity';
import { MaratonaService } from './maratona.service';

@Controller('maratona')
export class MaratonaController {
    constructor(private maratonaService: MaratonaService) {}

    @Get()
    index(): Promise<Maratona[]> {
        return this.maratonaService.index();
    }

    @Post()
    async create(@Body() maratonaData: Maratona): Promise<any> {
        return this.maratonaService.create(maratonaData);
    }
}
