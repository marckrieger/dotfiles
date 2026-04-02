#!/bin/bash

systemctl --user daemon-reload
systemctl --user enable chezmoi-update.service
