module "dev" {
    source = "github.com/Devi-Sri03/terraform-devi/day-2-variables"
    ami = "ami-0614680123427b75e"
    type = "t2.micro"
    key = "darling"
}