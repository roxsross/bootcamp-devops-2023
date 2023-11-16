import express from 'express';
import { Topic } from '../entities';
import { TopicsService } from '../services';

export const topicsRoutes = (topicsService: TopicsService) => {
    const router = express.Router();

    router.get('/', async (_, res) => {
        const result = await topicsService.getTopics();
        res.json(result);
    });

    router.get('/:id', async (req, res) => {
        const { id } = req.params;
        const result = await topicsService.getTopicById(id);
        res.json(result);
    });

    router.post('/', async (req, res) => {
        const topic = req.body as Topic;;
        await topicsService.createTopic(topic);
        res.json(topic);
    });

    router.put('/:id', async (req, res) => {
        const { id } = req.params;
        const topic = req.body as Topic;
        await topicsService.updateTopic(id, topic);
        res.json(topic);
    });

    router.delete('/:id', async (req, res) => {
        const { id } = req.params;
        await topicsService.deleteTopic(id);
        res.json();
    });

    return router;
}; 