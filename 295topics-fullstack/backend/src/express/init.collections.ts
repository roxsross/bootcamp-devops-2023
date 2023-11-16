import config from '../config';
import { Collection } from 'mongodb';
import { connect, getDatabaseInstance, getCollection } from '../dal/mongo-client.manager';

export const startCollections = async (): Promise<Collection[]> => {
    await connect();
    const db = getDatabaseInstance(config.database.name);
    const topicsCollection = getCollection(db, 'Topics');
    return [topicsCollection];
}