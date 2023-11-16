// TODO: Move to infrastructure.
// TODO: Create services.
import { Collection, Db, Document, MongoClient } from "mongodb";
import config from '../config';

export type CollectionNames = 'Topics';

const { url } = config.database;
const client = new MongoClient(url);

export const connect = async () => {
  try {
    await client.connect();
  } catch (error) {
    console.error();
  }
};

export const disconnect = async () => {
  await client.close();
};

export const getDatabaseInstance = (databaseName: string): Db =>
  client.db(databaseName);

export const getCollection = (db: Db, collection: CollectionNames): Collection<Document> => {
  // TODO: Create schemas.
  return db.collection(collection);
};


