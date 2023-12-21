const express = require('express');
const chai = require('chai');
const chaiHttp = require('chai-http');

const app = express();
const { expect } = chai;

chai.use(chaiHttp);

describe('Server', () => {
  it('should start the server without errors', (done) => {
    chai.request(app).get('/')
      .end((err) => {
        expect(err).to.be.null;
        done();
      });
  });


});
