##datastax-cassandra-docker
Community Datastax cassandra with datastax agent.
######Run in cluster with opcenter monitoring
    docker run -e SEEDS=IP1,IP2 -e OPS_IP=IP3 datastax-cassandra
######Pull from Docker Hub
    docker pull allen13/datastax-cassandra
######Build Image
    make
######Destroy Deployed Image
    make destroy
######Shell into container
    make shell
