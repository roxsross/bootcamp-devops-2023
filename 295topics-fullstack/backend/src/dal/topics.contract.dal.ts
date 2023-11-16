import { ObjectId, Collection } from 'mongodb';
import { Topic as TopicEntity } from '../entities';

type Topic = Pick<TopicEntity, 'Name'>;

export interface TopicDatabase extends Topic {
    _id?: ObjectId
}

export interface TopicDAL {
    createTopic(topic: TopicDatabase): Promise<void>;
    getTopics(): Promise<TopicDatabase[]>;
    getTopicById(id: string): Promise<TopicDatabase | null>;
    updateTopic(id: string, topic: Partial<TopicDatabase>): Promise<void>;
    deleteTopic(id: string): Promise<void>;
}

export type TopicDALFactory = (collection: Collection) => TopicDAL; 