import { TopicDatabase, TopicDAL } from '../dal/topics.contract.dal';
import { Topic as TopicEntity } from '../entities';

export interface TopicsService {
    createTopic(topic: TopicEntity): Promise<void>;
    getTopics(): Promise<TopicEntity[]>;
    getTopicById(id: string): Promise<TopicEntity | null>;
    updateTopic(id: string, topic: Partial<TopicEntity>): Promise<TopicEntity>;
    deleteTopic(id: string): Promise<void>;
}

export type TopicsServiceFactory = (
    topicDAL: TopicDAL,
    mapperEntitie?: (topic: TopicEntity | TopicDatabase) => TopicEntity | TopicDatabase,
    mapperEntities?: (topic: TopicEntity[] | TopicDatabase[]) => TopicEntity[] | TopicDatabase[],
) => TopicsService;

export const topicsServiceFactory: TopicsServiceFactory = (
    topicDAL: TopicDAL,
    mapperEntity?: (topic: TopicEntity | TopicDatabase) => TopicEntity | TopicDatabase,
    mapperEntities?: (topic: TopicEntity[] | TopicDatabase[]) => TopicEntity[] | TopicDatabase[]
): TopicsService => {
    return {
        async createTopic(topic: TopicEntity): Promise<void> {
            try {
                await topicDAL.createTopic(topic);
            } catch (error) {
                console.error(error);
                throw error;
            }
        },
        async getTopics(): Promise<TopicEntity[]> {
            try {
                const result = await topicDAL.getTopics();
                return mapperEntities(result);
            } catch (error) {
                console.error(error);
                throw error;
            }
        },
        async getTopicById(id: string): Promise<TopicEntity | null> {
            try {
                const result = await topicDAL.getTopicById(id);
                return mapperEntity(result);
            } catch (error) {
                console.error(error);
                throw error;
            }
        },
        async updateTopic(id: string, topic: Partial<TopicEntity>): Promise<TopicEntity> {
            try {
                await topicDAL.updateTopic(id, topic);
                return topic as TopicEntity;
            } catch (error) {
                console.error(error);
                throw error;
            }
        },
        async deleteTopic(id: string): Promise<void> {
            try {
                await topicDAL.deleteTopic(id);
            } catch (error) {
                console.error(error);
                throw error;
            }
        }
    };
}