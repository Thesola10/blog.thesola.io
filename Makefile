include keys.mk

export IPFS_DEPLOY_CLOUDFLARE__ZONE 	= thesola.io
export IPFS_DEPLOY_CLOUDFLARE__RECORD 	= _dnslink.blog.thesola.io

HUGO := hugo
HUGOFLAGS :=

IPFS_DEPLOY := ipfs-deploy
IPFS_DEPLOY_FLAGS := -p pinata -d cloudflare -s blog.thesola.io

DEPLOY_DIR := public

site:
	$(HUGO) $(HUGOFLAGS)

test:
	$(HUGO) server

deploy: site
	$(IPFS_DEPLOY) $(IPFS_DEPLOY_FLAGS) $(DEPLOY_DIR)
