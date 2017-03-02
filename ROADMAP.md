# Unidom Article Number Roadmap 物品编码领域模型引擎路线图

## v0.1
1. Marking model & migration (20020101000000)
2. EAN-13 Barcode model & migration (20020102000000)

## v0.2
1. Improved the Marking model to include the Model Extension concern
2. Improved the EAN-13 Barcode model to include the Model Extension concern

## v0.3
1. EAN-8 Barcode model & migration (20020103000000)
2. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v0.4

## v1.0
1. Improve the Marking model to add the .``mark`` method
2. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v0.9

## v1.1
1. As Barcode concern
2. As Marked concern
3. Improve the EAN-13 Barcode model to include the As Barcode concern
4. Improve the EAN-8 Barcode model to include the As Barcode concern
5. Improve the Marking model to add the .``mark!`` method
6. Improve the Marking model to deprecate the .``mark`` method

## v1.2
1. Improve the As Barcode concern to add the #``mark!`` method
2. Improve the As Marked concern to add the #``is_marked!`` method

## v1.2.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.0

## v1.3
1. As EAN-13 Marked concern
2. As EAN-8 Marked concern

## v1.4
1. Improve the As Barcode concern to add the #``mark?`` method
2. Improve the As Marked concern to add the #``is_marked?`` method

## v2.0
1. Remove the deprecated the methods

## v2.0.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v2.0.2
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7

## v2.1
1. Vehicle Identification Number validator

## v2.2
1. Vehicle Identification Number model & migration (20020111000000)

## v2.2.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.8
2. Improve the Engine class to include the Engine Extension

## v2.2.2
1. Improve the Vehicle Identification Number validator for the I, O, & Q

## v2.2.3
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.9
2. Improve the models to support the namespace neglecting

## v2.3
1. Models RSpec examples manifest
2. Types RSpec examples manifest
3. Validators RSpec examples manifest

## v2.3.1
1. Vehicle Identification Number Validator spec
2. Improve the Validators RSpec examples manifest to add the Vehicle Identification Number Validator spec

## v2.3.2
1. Move the Vehicle Identification Number Validator spec from the Types RSpec examples manifest to the Validators RSpec examples manifest

## v2.3.3
1. Improve the Marking spec for the barcode_is scope

## v2.3.4
1. Improve the EAN-13 Barcode model for the validations on the #code attribute
2. Improve the EAN-13 Barcode spec for the validations on the #code attribute
