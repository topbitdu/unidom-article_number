# Unidom Article Number Change Log 物品编码领域模型引擎变更日志

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
1. Improved the Marking model to add the .``mark`` method
2. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v0.9

## v1.1
1. As Barcode concern
2. As Marked concern
3. Improved the EAN-13 Barcode model to include the As Barcode concern
4. Improved the EAN-8 Barcode model to include the As Barcode concern
5. Improved the Marking model to add the .``mark!`` method
6. Improved the Marking model to deprecate the .``mark`` method

## v1.2
1. Improved the As Barcode concern to add the #``mark!`` method
2. Improved the As Marked concern to add the #``is_marked!`` method

## v1.2.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.0

## v1.3
1. As EAN-13 Marked concern
2. As EAN-8 Marked concern

## v1.4
1. Improved the As Barcode concern to add the #``mark?`` method
2. Improved the As Marked concern to add the #``is_marked?`` method

## v2.0
1. Removed the deprecated the methods

## v2.0.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v2.0.2
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7

## v2.1
1. Vehicle Identification Number validator

## v2.2
1. Vehicle Identification Number model & migration (20020111000000)

## v2.2.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.8
2. Improved the Engine class to include the Engine Extension

## v2.2.2
1. Improved the Vehicle Identification Number validator for the I, O, & Q

## v2.2.3
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.9
2. Improved the models to support the namespace neglecting

## v2.3
1. Models RSpec examples manifest
2. Types RSpec examples manifest
3. Validators RSpec examples manifest

## v2.3.1
1. Vehicle Identification Number Validator spec
2. Improved the Validators RSpec examples manifest to add the Vehicle Identification Number Validator spec

## v2.3.2
1. Moved the Vehicle Identification Number Validator spec from the Types RSpec examples manifest to the Validators RSpec examples manifest

## v2.3.3
1. Improved the Marking spec for the barcode_is scope

## v2.3.4
1. Improved the EAN-13 Barcode model for the validations on the #code attribute
2. Improved the EAN-13 Barcode spec for the validations on the #code attribute

## v2.3.5
1. Improve the EAN-8 Barcode model for the validations on the #code attribute
2. Improve the EAN-8 Barcode spec for the validations on the #code attribute

## v2.3.6
1. Improve the Marking spec for the barcode_is scope
2. Improve the Vehicle Identification Number spec for the validations on the #code attribute

## v2.3.7
1. As Barcode shared examples
2. RSpec shared examples manifest
3. Improve the EAN-13 Barcode spec for the As Barcode concern
4. Improve the EAN-8 Barcode spec for the As Barcode concern
5. Improve the Vehicle Identification Number spec for the As Barcode concern
