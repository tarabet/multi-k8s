docker build -t tarabet/multi-client:latest -t tarabet/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t tarabet/multi-server:latest -t tarabet/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t tarabet/multi-worker:latest -t tarabet/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push tarabet/multi-client:latest
docker push tarabet/multi-server:latest
docker push tarabet/multi-worker:latest

docker push tarabet/multi-client:$SHA
docker push tarabet/multi-server:$SHA
docker push tarabet/multi-worker:$SHA

kubectl apply -f ./k8s
kubectl set image deployments/server-deployment server=tarabet/multi-server:$SHA
kubectl set image deployments/client-deployment client=tarabet/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=tarabet/multi-worker:$SHA
