emacs-js:
	docker build \
    -f docker/emacs-js/Dockerfile \
    -t local/devenv-emacs-js \
    --build-arg user=${USER} \
    .

	docker run \
    -it \
    --rm \
    --name emacs-js \
    -p8080:8080 \
    -p 3000:3000 \
    -v /run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock \
    -e SSH_AUTH_SOCK=/run/host-services/ssh-auth.sock \
    --mount type=bind,source=${HOME}/repo,target=/home/${USER}/repo \
    --add-host=host.docker.internal:host-gateway \
    local/devenv-emacs-js
