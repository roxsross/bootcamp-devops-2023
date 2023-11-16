import { Application } from 'express';
import { TopicsService } from '../services';
import { topicsRoutes } from './topics.route';

export const routesInitialization = (app: Application, topicsService: TopicsService) => {
    // TODO: Inject DAL
    app.use('/api/topics', topicsRoutes(topicsService));
};