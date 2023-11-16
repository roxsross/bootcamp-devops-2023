import { Application } from 'express';
import config from '../config';
import { createApp } from './create-app';

const { app: { host, port } } = config;

export const initExpressApp = async () => {
  const app: Application = await createApp();

  app.listen(
    port, 
    host, 
    () => console.log(`Server listening on http://${host}:${port}`)
  );
};