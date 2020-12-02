storage "file" {
  path    = "/root/vault-data"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 1
}

seal "awskms" {
   region = "ap-south-1"
   kms_key_id = "<PUT_AWS_KMS_ID>"
}

ui = "true"
