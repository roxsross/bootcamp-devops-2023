import { Collection } from 'mongodb';
import { TopicDAL, TopicDALFactory, TopicDatabase} from './topics.contract.dal';

export const topicDALFactory: TopicDALFactory = (collection: Collection): TopicDAL => {
    return {
        async createTopic(topic: TopicDatabase): Promise<void> {
            try {
                await collection.insertOne(topic);
            } catch (error) {
                console.log(error);
                throw error;
            }
        },
        async getTopics(): Promise<TopicDatabase[]> {
            try {
                const topics = await collection.find({}).toArray();
                return topics as TopicDatabase[];
            } catch (error) {
                console.log(error);
                throw error;
            }
        },
        async getTopicById(id: string): Promise<TopicDatabase | null> {
            const result = await collection.findOne({
                _id: id
            });
            return result as TopicDatabase;
        },
        async updateTopic(id: string, topic: Partial<TopicDatabase>): Promise<void> {
            delete topic['_id'];
            await collection.updateOne({
                _id: id
            }, {
                $set: {
                    ...topic
                }
            });
        },
        async deleteTopic(id: string): Promise<void> {
            await collection.deleteOne({ _id: id });
        }
    };
}