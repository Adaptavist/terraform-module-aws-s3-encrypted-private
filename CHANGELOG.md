## [3.0.1](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v3.0.0...v3.0.1) (2023-07-26)


### Bug Fixes

* variable type error: ([38a112a](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/38a112ad5a4dffa96d0c74fb9ce04f6e30c51479))

# [3.0.0](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v2.1.8...v3.0.0) (2023-07-26)


* fix!: upgrade & lock aws provider version to ~> 5.0 ([dd71a1f](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/dd71a1f3e9de06456b4113f7898104938283eed0))


### BREAKING CHANGES

* update deprecated configuration to aws_iam_policy_document

## [2.1.8](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v2.1.7...v2.1.8) (2023-07-26)


### Bug Fixes

* lock aws provider version to ~> 4.0 ([c7f9189](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/c7f9189ea019ac4a00d592390f6905cbae8af017))

## [2.1.7](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v2.1.6...v2.1.7) (2023-06-28)


### Bug Fixes

* set var.log_expiration_days default to 30 ([1d5442e](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/1d5442e4ff8f2d71ee3d2c829398acf4bcc58522))

## [2.1.6](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v2.1.5...v2.1.6) (2023-06-28)


### Bug Fixes

* add optional data expiration policy ([47e9b15](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/47e9b1578a702bc2146957cbfaea7553581364b2))
* updated README ([e0586b5](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/e0586b5bee7f36560791354fd3e68e0fae7ee0e3))

## [2.1.5](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v2.1.4...v2.1.5) (2023-06-14)


### Bug Fixes

* now using override_policy_documents for source_json ([7e2ed2a](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/7e2ed2a66da1182d30f043fbffeec066925d39ae))

## [2.1.4](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v2.1.3...v2.1.4) (2023-05-16)


### Bug Fixes

* delete versioned objects ([4741804](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/474180453197b0e36ea9912030244dbba13d43ed))
* set noncurrent_days for version deletion to be 1 day ([acc0d8f](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/acc0d8f65176b948a1eb495007a87f17a8f720ba))

## [2.1.3](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v2.1.2...v2.1.3) (2023-05-05)


### Bug Fixes

* removing bucket acl as no longer needed ([d9e922a](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/d9e922a52083ec626f3be4ba036c308b33029dd2))

## [2.1.2](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v2.1.1...v2.1.2) (2023-01-09)


### Bug Fixes

* trigger release ([4cb2079](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/4cb2079a10878a3d2c71fb8db1e37bce5701ff98))

## [2.1.1](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v2.1.0...v2.1.1) (2022-12-08)


### Bug Fixes

* trigger a new release ([3e565a2](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/3e565a2dcf29e6ffcadc95f054b3ebad4bac4564))

# [2.1.0](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v2.0.1...v2.1.0) (2022-05-04)


### Bug Fixes

* enabled the s3 bucket key config ([3d3ef73](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/3d3ef73e74a133a51dd342616e13ff48c460d404))


### Features

* using bucket key by default ([56c90da](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/56c90da773bdb3480c36a5152885408620f7b036))

## [2.0.1](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v2.0.0...v2.0.1) (2022-04-18)


### Bug Fixes

* correcting resource name ([055017a](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/055017af9b874c3c4a2090b9bc031d47ffb404a1))

# [2.0.0](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.7.1...v2.0.0) (2022-03-08)


* Merged in aws_upgrade (pull request #16) ([49eb0be](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/49eb0be1f7ae7c2e434aeb8835c3099cd1782b75)), closes [#16](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/issue/16)


### Features

* label module change ([f5a365c](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/f5a365c6c77fe4e86d4844815873178988c1ab71))


### BREAKING CHANGES

* acl and versioning resources

Approved-by: Lilly Holden
Approved-by: Dominic Martino
Approved-by: Ashok Singh

## [1.7.1](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.7.0...v1.7.1) (2021-09-20)


### Bug Fixes

* adding optional base kms policy ([0f0fa14](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/0f0fa144a20a117f6cb325c3adae8cdd0c53217e))

# [1.7.0](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.6.0...v1.7.0) (2021-09-02)


### Features

* allowing AWS services user/admin access to KMS key ([49a79ba](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/49a79baf11b99f2b2ba3590a18d77dafed662657))

# [1.6.0](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.5.1...v1.6.0) (2021-09-01)


### Features

* added key id output ([de23915](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/de23915fa44668d99702bfafcfbf93b367f31454))

## [1.5.1](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.5.0...v1.5.1) (2021-08-10)


### Bug Fixes

* bucket policy fix ([4630f3e](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/4630f3e6ab2c3d91b0dd882e066baa1aa8749a25))

# [1.5.0](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.4.0...v1.5.0) (2021-08-10)


### Features

* triggering release of allowing base bucket policy ([a54856b](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/a54856bf117032e8ae8f6d66b89efaf5508d208a))

# [1.4.0](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.3.0...v1.4.0) (2021-08-10)


### Features

* triggering release of allowing base bucket policy ([1f88e8b](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/1f88e8b07d42f3a2fbeabd547a0f910fe761d8dd))

# [1.3.0](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.2.0...v1.3.0) (2021-08-06)


### Features

* labels version bump ([57f4571](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/57f45712bf79eef0f7d3fe6548b063178e61fb82))

# [1.2.0](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.1.12...v1.2.0) (2021-06-07)


### Features

* making kms admin role optional ([1152c46](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/1152c464f60a31cf074fc5b25b45d629827795f8))

## [1.1.12](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.1.11...v1.1.12) (2021-05-26)


### Bug Fixes

* corrected github url ([9f584dd](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/9f584dd8a14103ab8b65529f727a9e7db1ab9e98))

## [1.1.11](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.1.10...v1.1.11) (2021-05-20)


### Bug Fixes

* added checkov and semantic release image ([cf8b454](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/cf8b454c81458da3cbb37eb34d5c4a79c30a3158))

## [1.1.10](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.1.9...v1.1.10) (2021-02-01)


### Bug Fixes

* added missing param ([4d89054](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/4d89054d8c4706fb96b392eadeb43c96f6417924))

## [1.1.9](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.1.8...v1.1.9) (2021-02-01)


### Bug Fixes

* typo ([caa111c](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/caa111cadaee0254c987c6300ae5ef563e0c327b))

## [1.1.8](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.1.7...v1.1.8) (2021-02-01)


### Bug Fixes

* optional enforcement of the server side encryption header ([c418fc6](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/c418fc691e6ec941ac2db102f8923808e2f5232d))

## [1.1.7](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.1.6...v1.1.7) (2021-01-29)


### Bug Fixes

* added star to GetObject for write policy ([3dd06dd](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/3dd06dd45ccbee8b409d2c9ce0e6d58890d88bde))

## [1.1.6](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.1.5...v1.1.6) (2021-01-28)


### Bug Fixes

* corrected bucket write permissions ([7453ee7](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/7453ee739a3f815311d2e839574f91b5e2e1d5c2))

## [1.1.5](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.1.4...v1.1.5) (2021-01-28)


### Bug Fixes

* corrected bucket name output ([2ab2e02](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/2ab2e021325f603ded6cdb6cac7182d9569d5630))

## [1.1.4](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.1.3...v1.1.4) (2021-01-27)


### Bug Fixes

* added option to bypass the labels module ([9c91e26](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/9c91e2674a0cf3e2885ba3cacc1438f81e442b70))

## [1.1.3](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.1.2...v1.1.3) (2021-01-20)


### Bug Fixes

* updated labels module version ([de35842](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/de35842a8f375a611c87d0579df5e02c105ca0b4))

## [1.1.2](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.1.1...v1.1.2) (2021-01-20)


### Bug Fixes

* updated labels module version ([b729e43](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/b729e435f8593bc9b68f2a18335a8dec30eb3d3d))

## [1.1.1](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.1.0...v1.1.1) (2020-08-04)


### Bug Fixes

* forcing release ([f57ee29](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/f57ee299df6296292101de67317cc794732af6f0))

# [1.1.0](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.0.5...v1.1.0) (2020-07-29)


### Features

* forcing new release ([1ee49f5](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/1ee49f5fe53a3860dbeaac4063899eea352a3275))

## [1.0.5](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.0.4...v1.0.5) (2020-07-24)


### Bug Fixes

* corrected list bucket access ([62e95c0](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/62e95c0187bd79eee59f5e3653e6e9fd4e66be33))

## [1.0.4](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.0.3...v1.0.4) (2020-07-20)


### Bug Fixes

* added listObject* actions ([650d566](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/650d56622e54764b16ec600b253ce4453628832c))

## [1.0.3](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.0.2...v1.0.3) (2020-07-14)


### Bug Fixes

* using terraform registry ([c759875](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/c759875f240c5874605f6c4aa833072e90787971))

## [1.0.2](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.0.1...v1.0.2) (2020-07-02)


### Bug Fixes

* added s3 publishing ([cf32249](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/cf322493947418cf668a60d5d36ffe5307f43e95))

## [1.0.1](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/compare/v1.0.0...v1.0.1) (2020-06-25)


### Bug Fixes

* corrected the test name ([b8e718d](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/b8e718dfdf8f62c05cdbdd274ca8c9c6b4055d3b))

# 1.0.0 (2020-06-24)


### Bug Fixes

* added aws creds to the pipeline definition ([07dea6a](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/07dea6a6ff3ca47f8b2644d2f5201f95e991259d))
* added region to the aws config (go test) ([ff23e8c](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/ff23e8c3ba3f6b2a07bb5bb9a7b44d0647218599))
* fixing the release pipeline ([82f77cc](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/82f77ccc0f14b95cc6b1e0f89bed07b59bffd50a))
* fixing the release pipeline ([dee298d](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/dee298dd9a04ceb4c86aeba0b6ea5fcc8db0f894))


### Features

* S3 bucket module ([a36b2f1](http://bitbucket.org/adaptavistlabs/module-aws-s3-encrypted-private/commits/a36b2f14b548b085d60170afc5a452bb701bdb3d))
