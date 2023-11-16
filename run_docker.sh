#build image
docker build -f Dockerfile.dev -t matter-server-mod:v1.0 .

#stop docker container
docker stop matter-server-mod

#remove old container with same name
docker rm matter-server-mod

#run container in detached mode
docker run -d \
      --name matter-server-mod \
      --restart unless-stopped \
      --network host \
      -p 2222:22 \
      --security-opt apparmor:unconfined \
      -v /opt/matter-server:/data/ \
      -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
      -v /run/dbus:/run/dbus:ro \
      -it matter-server-mod:v1.0