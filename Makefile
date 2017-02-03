
release:
	@echo "Release v$(version)"
	@git checkout master
	@git pull
	@git checkout develop
	@git flow release start $(version)
	@sed "s/@VERSION@/$(version)/g" < JSONBuilder.podspec.dist > JSONBuilder.podspec
	@git add JSONBuilder.podspec
	@git commit -am "feat(pod): tag version"
	@git flow release finish $(version)
	@git push
	@git push --tags
	@git checkout master
	@git push
	@git checkout develop
	@pod trunk push JSONBuilder.podspec
