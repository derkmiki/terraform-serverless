'use strict';

exports.handler = async function (event) {
    return {
        statusCode: 200,
        headers: {
            'Access-Control-Allow-origin': '*'
        },
        body: JSON.stringify(
            {
                message: 'Hello world, function has been executed!'
            }, 
            null,
            2
        )
    };
}