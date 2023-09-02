package test

import (
	"fmt"
	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/kr/pretty"
	"reflect"
	"testing"
)

func TestExamplesComplete(t *testing.T) {
	t.Parallel()

	rootFolder := "../"
	terraformFolderRelativeToRoot := "examples/complete"

	tempTestFolder := test_structure.CopyTerraformFolderToTemp(t, rootFolder, terraformFolderRelativeToRoot)

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: tempTestFolder,
		Upgrade:      true,
		VarFiles:     []string{"complete.tfvars"},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Test the Label ID
	idExpected := "ex-env-example-thing-attr1"
	idOutput := terraform.Output(t, terraformOptions, "label_id")
	if idExpected != idOutput {
		t.Fatal(makediff(idExpected, idOutput))
	}

	// Type for running tests
	id_tests := []struct {
		outputVar string
		labelId   string
		tags      map[string]string
	}{
		{
			outputVar: "label",
			labelId: "ex-env-example-thing-attr1",
			tags: map[string]string{
				"Attributes":  "attr1",
				"Environment": "env",
				"ExtraTag": "ExtraTagValue",
				"Instance": "demo",
				"Name": "ex-env-example-thing-attr1",
				"Namespace": "ex",
				"Project": "example",
				"Region": "us-west-2",
				"Role": "production",
				"Stage": "example",
				"Workspace": "default",
			},
		},
		{
			outputVar: "label_with_proj",
			labelId: "ex-env-test-thing-attr1",
			tags: map[string]string{
				"Attributes":  "attr1",
				"Environment": "env",
				"ExtraTag": "ExtraTagValue",
				"Instance": "demo",
				"Name": "ex-env-test-thing-attr1",
				"Namespace": "ex",
				"Project": "test",
				"Region": "us-west-2",
				"Role": "production",
				"Stage": "test",
				"Workspace": "default",
			},
		},
	}

	for _, tc := range id_tests {
		t.Run(tc.outputVar, func(tt *testing.T) {
			outputId := terraform.Output(tt, terraformOptions, tc.outputVar + "_id")
			if !reflect.DeepEqual(tc.labelId, outputId) {
				tt.Fatal(makediff(tc.labelId, outputId))
			}
			outputTags := terraform.OutputMap(tt, terraformOptions, tc.outputVar + "_tags")
			if !reflect.DeepEqual(tc.tags, outputTags) {
				tt.Fatal(makediff(tc.tags, outputTags))
			}
		})
	}

}

func makediff(want interface{}, got interface{}) string {
	s := fmt.Sprintf("\nwant: %# v", pretty.Formatter(want))
	s = fmt.Sprintf("%s\ngot: %# v", s, pretty.Formatter(got))
	diffs := pretty.Diff(want, got)
	s = fmt.Sprintf("%s\ndifferences: ", s)
	for _, d := range diffs {
		s = fmt.Sprintf("%s\n  - %s", s, d)
	}
	return s
}
