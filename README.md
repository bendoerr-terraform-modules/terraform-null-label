<br/>
<p align="center">
  <a href="https://github.com/bendoerr-terraform-modules/terraform-null-label">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://github.com/bendoerr-terraform-modules/terraform-null-label/raw/main/docs/logo-dark.png">
      <img src="https://github.com/bendoerr-terraform-modules/terraform-null-label/raw/main/docs/logo-light.png" alt="Logo">
    </picture>
  </a>

<h3 align="center">Ben's Terraform Null Label Module</h3>

  <p align="center">
    This is how I do it.
    <br/>
    <br/>
    <a href="https://github.com/bendoerr-terraform-modules/terraform-null-label"><strong>Explore the docs »</strong></a>
    <br/>
    <br/>
    <a href="https://github.com/bendoerr-terraform-modules/terraform-null-label/issues">Report Bug</a>
    .
    <a href="https://github.com/bendoerr-terraform-modules/terraform-null-label/issues">Request Feature</a>
  </p>
</p>

[<img alt="GitHub contributors" src="https://img.shields.io/github/contributors/bendoerr-terraform-modules/terraform-null-label?logo=github">](https://github.com/bendoerr-terraform-modules/terraform-null-label/graphs/contributors)
[<img alt="GitHub issues" src="https://img.shields.io/github/issues/bendoerr-terraform-modules/terraform-null-label?logo=github">](https://github.com/bendoerr-terraform-modules/terraform-null-label/issues)
[<img alt="GitHub pull requests" src="https://img.shields.io/github/issues-pr/bendoerr-terraform-modules/terraform-null-label?logo=github">](https://github.com/bendoerr-terraform-modules/terraform-null-label/pulls)
[<img alt="GitHub workflow: Terratest" src="https://img.shields.io/github/actions/workflow/status/bendoerr-terraform-modules/terraform-null-label/test.yml?logo=githubactions&label=terratest">](https://github.com/bendoerr-terraform-modules/terraform-null-label/actions/workflows/test.yml)
[<img alt="GitHub workflow: Linting" src="https://img.shields.io/github/actions/workflow/status/bendoerr-terraform-modules/terraform-null-label/lint.yml?logo=githubactions&label=linting">](https://github.com/bendoerr-terraform-modules/terraform-null-label/actions/workflows/lint.yml)
[<img alt="GitHub tag (with filter)" src="https://img.shields.io/github/v/tag/bendoerr-terraform-modules/terraform-null-label?filter=v*&label=latest%20tag&logo=terraform">](https://registry.terraform.io/modules/bendoerr-terraform-modules/label/null/latest)
[<img alt="OSSF-Scorecard Score" src="https://img.shields.io/ossf-scorecard/github.com/bendoerr-terraform-modules/terraform-null-label?logo=securityscorecard&label=ossf%20scorecard&link=https%3A%2F%2Fsecurityscorecards.dev%2Fviewer%2F%3Furi%3Dgithub.com%2Fbendoerr-terraform-modules%2Fterraform-null-label">](https://securityscorecards.dev/viewer/?uri=github.com/bendoerr-terraform-modules/terraform-null-label)
[<img alt="GitHub License" src="https://img.shields.io/github/license/bendoerr-terraform-modules/terraform-null-label?logo=opensourceinitiative">](https://github.com/bendoerr-terraform-modules/terraform-null-label/blob/main/LICENSE.txt)

## About The Project

My opinionated label module.

This Terraform module consumes my `terraform-null-context` and produces
consistent names and tags for all of my resources. It implements a strict naming
and tagging convention that follows the format from
[cloudposse/terraform-null-label](https://github.com/cloudposse/terraform-null-label).

The Cloud Posse label module provides detailed documentation and reasoning
however by itself it has too many knobs and provides more options that I use.
This module configures the Cloud Posse label exactly how I like it while taking
advantage of my context module to carry standard part of the label around.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/bendoerr-terraform-modules/terraform-null-label/raw/main/docs/usage-dark.png">
  <img src="https://github.com/bendoerr-terraform-modules/terraform-null-label/raw/main/docs/usage-light.png" alt="Logo">
</picture>

## Usage

```terraform
module "context" {
  source    = "bendoerr-terraform-modules/context/null"
  version   = "xxx"
  namespace = "bd"
  role      = "production"
  region    = "us-east-1"
  project   = "example"
}

module "label" {
  source  = "bendoerr-terraform-modules/label/null"
  version = "xxx"
  context = module.context.shared
  name    = "function"
}

resource "aws_lambda_function" "function" {
  function_name = module.label.id   # bd-prd-ue1-example-function
  tags          = module.label.tags # { Name: bd-prd-ue1-example-function,
                                    #   Namespace: bd,
                                    #   Role: production,
                                    #   Region: us-east-1,
                                    #   Project: example,
                                    #   Environment: prod-ue1,
                                    # }
  ...
}

resource "aws_route53_record" "function" {
  name = "${module.label.dns_name}.${vars.zone_name}" # function.ue1.cloud.bendoerr.me
                                                      # assuming vars.zone_name = cloud.bendoerr.me
  ...
}
```

### Cost

<a href="https://dashboard.infracost.io/org/bendoerr/repos/fb5edc95-efa2-4943-824c-b9e8619a668a?tab=settings"><img src="https://img.shields.io/endpoint?url=https://dashboard.api.infracost.io/shields/json/6e706676-64ba-43db-97b9-bd92f9272474/repos/fb5edc95-efa2-4943-824c-b9e8619a668a/branch/808e8b2b-0fda-4c1a-8a3c-519c8c29edb2" alt="infracost"/></a>

```text
Project: bendoerr-terraform-modules/terraform-null-label

 Name  Monthly Qty  Unit  Monthly Cost

 OVERALL TOTAL                   $0.00
──────────────────────────────────
No cloud resources were detected
```

This module creates no resources and will not generate any cost against any
cloud provider you use.

<!-- BEGIN_TF_DOCS -->

### Requirements

| Name                                                                     | Version |
| ------------------------------------------------------------------------ | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 0.13 |

### Modules

| Name                                               | Source                | Version |
| -------------------------------------------------- | --------------------- | ------- |
| <a name="module_label"></a> [label](#module_label) | cloudposse/label/null | 0.25.0  |

### Inputs

| Name                                                   | Description                                                                 | Type                                                                                                                                                                                                                                                                                                                      | Default | Required |
| ------------------------------------------------------ | --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | :------: |
| <a name="input_context"></a> [context](#input_context) | Shared Context from Ben's terraform-null-label                              | <pre>object({<br> attributes = list(string)<br> dns_namespace = string<br> environment = string<br> instance = string<br> instance_short = string<br> namespace = string<br> region = string<br> region_short = string<br> role = string<br> role_short = string<br> project = string<br> tags = map(string)<br> })</pre> | n/a     |   yes    |
| <a name="input_name"></a> [name](#input_name)          | Name of this resource                                                       | `string`                                                                                                                                                                                                                                                                                                                  | n/a     |   yes    |
| <a name="input_project"></a> [project](#input_project) | Name of the project or application, this can override the context's project | `string`                                                                                                                                                                                                                                                                                                                  | `""`    |    no    |

### Outputs

| Name                                                                                            | Description                                                                    |
| ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| <a name="output_attributes"></a> [attributes](#output_attributes)                               | List of attributes                                                             |
| <a name="output_delimiter"></a> [delimiter](#output_delimiter)                                  | Delimiter between `namespace`, `environment`, `stage`, `name` and `attributes` |
| <a name="output_dns_name"></a> [dns_name](#output_dns_name)                                     | Normalized DNS Name                                                            |
| <a name="output_environment"></a> [environment](#output_environment)                            | Normalized environment                                                         |
| <a name="output_id"></a> [id](#output_id)                                                       | Disambiguated ID                                                               |
| <a name="output_label_order"></a> [label_order](#output_label_order)                            | The naming order of the id output and Name tag                                 |
| <a name="output_name"></a> [name](#output_name)                                                 | Normalized name                                                                |
| <a name="output_namespace"></a> [namespace](#output_namespace)                                  | Normalized namespace                                                           |
| <a name="output_project"></a> [project](#output_project)                                        | Normalized project                                                             |
| <a name="output_tags"></a> [tags](#output_tags)                                                 | Normalized Tag map                                                             |
| <a name="output_tags_as_list_of_maps"></a> [tags_as_list_of_maps](#output_tags_as_list_of_maps) | Additional tags as a list of maps, which can be used in several AWS resources  |

<!-- END_TF_DOCS -->

## Roadmap

[<img alt="GitHub issues" src="https://img.shields.io/github/issues/bendoerr-terraform-modules/terraform-null-label?logo=github">](https://github.com/bendoerr-terraform-modules/terraform-null-label/issues)

See the
[open issues](https://github.com/bendoerr-terraform-modules/terraform-null-label/issues)
for a list of proposed features (and known issues).

## Contributing

[<img alt="GitHub pull requests" src="https://img.shields.io/github/issues-pr/bendoerr-terraform-modules/terraform-null-label?logo=github">](https://github.com/bendoerr-terraform-modules/terraform-null-label/pulls)

Contributions are what make the open source community such an amazing place to
be learn, inspire, and create. Any contributions you make are **greatly
appreciated**.

- If you have suggestions for adding or removing projects, feel free to
  [open an issue](https://github.com/bendoerr-terraform-modules/terraform-null-label/issues/new)
  to discuss it, or directly create a pull request after you edit the
  _README.md_ file with necessary changes.
- Please make sure you check your spelling and grammar.
- Create individual PR for each suggestion.

### Creating A Pull Request

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

[<img alt="GitHub License" src="https://img.shields.io/github/license/bendoerr-terraform-modules/terraform-null-label?logo=opensourceinitiative">](https://github.com/bendoerr-terraform-modules/terraform-null-label/blob/main/LICENSE.txt)

Distributed under the MIT License. See
[LICENSE](https://github.com/bendoerr-terraform-modules/terraform-null-label/blob/main/LICENSE.txt)
for more information.

## Authors

[<img alt="GitHub contributors" src="https://img.shields.io/github/contributors/bendoerr-terraform-modules/terraform-null-label?logo=github">](https://github.com/bendoerr-terraform-modules/terraform-null-label/graphs/contributors)

- **Benjamin R. Doerr** - _Terraformer_ -
  [Benjamin R. Doerr](https://github.com/bendoerr/) - _Built Ben's Terraform
  Modules_

## Supported Versions

Only the latest tagged version is supported.

## Reporting a Vulnerability

See [SECURITY.md](SECURITY.md).

## Acknowledgements

- [ShaanCoding (ReadME Generator)](https://github.com/ShaanCoding/ReadME-Generator)
- [CloudPossie (Terraform Null Label - Inspiration)](https://github.com/cloudposse/terraform-null-label)
- [OpenSSF - Helping me follow best practices](https://openssf.org/)
- [StepSecurity - Helping me follow best practices](https://app.stepsecurity.io/)
- [Infracost - Better than AWS Calculator](https://www.infracost.io/)
