

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
docker build -t osmosis-node -f Dockerfile-o .smosis-node
```


Run image with directory onto previously downloaded snapshot
```

docker run -v ~/mathieu/snapshots:/root/snapshots -p 26656:26656 -p 26657:26657 -it osmosis-node


```

Optionally you can use a volume to keep the data outside of the docker image


```
docker run -v ~/mathieu/snapshots:/root/snapshots -v ~/mathieu/states/osmosis1:/root/.osmosisd -p 26656:26656 -p 26657:26657 -it simple-ubuntu
```