var request = require("request"),
    assert = require('assert'),
    helloWorld = require("../app.js"),
    base_url = "http://localhost:3000/";

describe("Test", function() {

  describe("GET /", function() {
    it("returns status code 200", function(done) {
      request.get(base_url, function(error, response, body) {
        assert.equal(200, response.statusCode);
        helloWorld.close();
        done();
      });
    });
  });

  describe("welcomeMessage", function (){
    it("Validate Message", function(){
      var res = helloWorld.welcomeMessage();
      var message = "Hello World";
      assert.equal(res, message);
    });  
  });
});