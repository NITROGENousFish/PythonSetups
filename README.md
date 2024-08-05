# PythonSetups

My vscode setup for python projects, set all executiond env inside a docker container, with debugpy attachment.
All the python runtime is inside that docker!


# How things work?
1. export PYTHONPATH in Dockerfile.
2. When create docker container: use docker volume to map the local source code to the container `/workdir` folder.
3. Use `debugpy` to attach to the python process in the container. The remote root is synced with the local source code folder by 2.

# Known issues
1. Any files generated inside docker may be root, and you cannot remove it from outside. You may need to remove it inside the container by docker exec.

Enjoy debugging in vscode! :)


