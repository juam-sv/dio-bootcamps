provider "google" {
  project = "devops-iac"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = "${file("serviceaccount.yaml")}"
}

resource "google_folder" "Budget" {
  display_name = "Budget"
  parent       = "organizations/082937309604"
}

resource "google_folder" "SalesForce" {
  display_name = "SalesForce"
  parent       = google_folder.Budget.name
}

resource "google_folder" "Dev" {
  display_name = "Dev"
  parent       = google_folder.SalesForce.name
}

resource "google_folder" "Prod" {
  display_name = "Prod"
  parent       = google_folder.SalesForce.name
}

resource "google_project" "barberosa2-salesforce-dev" {
  name       = "SalesForce-Dev"
  project_id = "devops-salesforce-dev"
  folder_id  = google_folder.Dev.name
  auto_create_network=false
  billing_account = "453963-H5640F-65H9I2"

}