

Download snapshot

```

cd <snapshots directory>

# Fetch the snapshot URL
export SNAPSHOT_URL=$(curl -s https://osmosis.fra1.digitaloceanspaces.com/osmo-test-5/snapshots/latest)

# Extract the file name from the URL
SNAPSHOT_NAME=$(basename "$SNAPSHOT_URL")

# Print the file name
echo "The file name is: $SNAPSHOT_NAME"

# Download the file using wget
wget "$SNAPSHOT_URL"

```

Build image

```
docker build -t osmosis-node -f Dockerfile-o osmosis-node
```


Run image with directory onto previously downloaded snapshot
```

docker run -v ~/mathieu/snapshots:/root/snapshots -p 26656:26656 -p 26657:26657 -d osmosis-node


```

Optionally you can use a volume to keep the data outside of the docker image


```
mkdir -p ~/states/osmosis2
docker run -v ~/snapshots:/root/snapshots -v ~/states/osmosis2:/root/.osmosisd -p 26656:26656 -p 26657:26657 -d osmosis-node
```



Check logs of the container

```
docker ps
docker logs 152e2d566c1e -f
```


kill the container

```
docker ps
docker kill 152e2d566c1e
```