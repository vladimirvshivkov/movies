MONGO_HOST="mongo"
MONGO_PORT=27017
MONGO_DBNAME="movies"

RESOURCE_METHODS = ['GET', 'POST', 'DELETE']
ITEM_METHODS = ['GET', 'PATCH', 'PUT', 'DELETE']

DOMAIN = {
    'movies': {
        'schema': {
            'name': {
                'type': 'string',
                'minlength': 5,
                'maxlength': 32,
                'required': True,
                'unique': True,
            },
            'description': {
                'type': 'string',
                'minlength': 10,
                'maxlength': 250,
                'required': True,
            },
            'casts': {
                'type': 'string',
                'minlength': 15,
                'maxlength': 250,
                'required': True,
            }
        }
    },
    'views':{
        'schema': {
            'views': {
                'type': 'integer'
            }
        }
    }
}