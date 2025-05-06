[
    {
        "name": "${app_name}",
        "image": "${app_image}",
        "essential": true,
        "memoryReservation": 256,
        "logConfiguration": {
            "logDriver": "awslogs",
            "options": {
                "awslogs-group": "${log_group_name}",
                "awslogs-region": "${log_group_region}",
                "awslogs-stream-prefix": "app"
            }
        },
        "portMappings": [
            {
                "containerPort": 5000,
                "hostPort": 5000
            }
        ]
    }
]
