import express, { Application } from 'express';
import cors from 'cors';
import { startCollections } from './init.collections';
import { topicDALFactory } from '../dal/topics.dal';
import { mapTopic, mapTopics, topicsServiceFactory } from '../services';
import { routesInitialization } from '../routes';
 

export const createApp = async () => {
  const app: Application = express();

  app.use(cors());
  app.use(express.json());
  app.use(express.urlencoded({ extended: true }));

  const [topicsCollection] = await startCollections();
  const topicsDAL = topicDALFactory(topicsCollection);
  const topicsService = topicsServiceFactory(topicsDAL, mapTopic, mapTopics);

  routesInitialization(app, topicsService);

  return app;
};