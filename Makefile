# Makefile for deploying Flutter web to github Pages

# Update These Variables
BASE_HREF = '/nchuit_test_website/'
GITHUB_REPO = git@github.com:teddywang0824/nchuit_test_website.git
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

deploy-web:
	@echo "Clean existing repository..."
	flutter clean

	@echo "Getting packages..."
	flutter pub get 

	@echo "Building for Web..."
	flutter build web --base-href $(BASE_HREF) --release

	@echo "Deploying to git repository"
	cd build/web && \
	git init && \
	git add . && \
	git commit -m "Deploy Version $(BUILD_VERSION)" && \
	git branch -M main && \
	git remote add origin $(GITHUB_REPO) && \
	git push -u --force origin main

	cd ../..
	@echo "Finished Deploy"

.PHONY: deploy-web