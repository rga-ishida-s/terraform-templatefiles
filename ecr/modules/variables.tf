variable ENV {
  type = string
  description = "環境(prod/dev)"
  default = "dev"
}

variable REGION {
  type = string
  description = "開発で使用するregion"
  default = "us-east-2"
}

variable FILE_PATH {
  type = string
  description = "Policyなどの情報を格納したJSON、YAMLのPATH"
  default = "../../modules/"
}