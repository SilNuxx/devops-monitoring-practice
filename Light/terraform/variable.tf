variable "ENDPOINT" {
    sensitive = true
    type = string
}
variable "TOKEN_ID" {
    sensitive = false
    type = string
}
variable "TOKEN_SECRET" {
    sensitive = false
    type = string
}
variable "NODE_NAME" {
    sensitive = false
    type = string
}