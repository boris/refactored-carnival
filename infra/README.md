# Infrastructure & Ops

This directory contains automation, configuration, and tooling for deploying and managing infrastructure.

## Contents

- **ansible/** — Playbooks for server provisioning and configuration.
- **terraform/** — Infrastructure-as-Code for cloud resources.
- **aws/** — AWS-specific scripts and helper tools.
- **kubernetes/** — Kubernetes manifests and cluster configurations.
- **docker/** — Dockerfiles, Compose setups, and related scripts.
- **vagrant/** — Local VM provisioning for testing and development.

## Usage

Each subdirectory is self-contained.  
Refer to the `README.md` inside each for specific usage instructions and prerequisites.

## Conventions

- Keep provider- or platform-specific code in its own folder.
- Avoid cross-dependencies between subfolders unless absolutely necessary.
- Prefer automation over manual steps—document everything.
