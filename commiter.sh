#!/bin/sh
git clone https://${GITHUB_TOKEN}@github.com/liehart/gitops.git
cd gitops
cat preview.yaml \
  | sed -e "s@{{.APP_ID}}@${APP_ID}@g" \
  | sed -e "s@{{.REPO}}@${REPO}@g" \
  | sed -e "s@{{.IMAGE_TAG}}@${IMAGE_TAG}@g" \
  | sed -e "s@{{.APP_ID}}@${APP_ID}@g" \
  | tee helm/templates/${APP_ID}.yml
git add .
git -c "user.name=${GITHUB_USERNAME}" -c "user.email=${GITHUB_EMAIL}" commit \
  -m "Updating application for: ${REPO} with image: ${IMAGE_TAG}"
git push origin master