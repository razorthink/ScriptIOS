var _ = require("./underscore");

module.exports = function (queryProp, queryValue, scope) {
    return _.filter(scope, function (elem) {
        return elem.get(queryProp) == queryValue;
    });
};