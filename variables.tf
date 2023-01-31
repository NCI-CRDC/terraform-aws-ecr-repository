variable "app" {
  type        = string
  description = "the name of the application expressed as an acronym"
  sensitive   = false
}

variable "env" {
  type        = string
  description = "the target tier ('dev', 'qa', 'stage', or 'prod'.)"
  sensitive   = false

  validation {
    condition     = contains(["dev", "qa", "stage", "prod", "nonprod"], var.env)
    error_message = "valid values are 'dev', 'qa', 'stage', 'prod', and 'nonprod'"
  }
}
variable "program" {
  type        = string
  description = "the program associated with the application"
  sensitive   = false

  validation {
    condition     = contains(["crdc", "ccdi", "ctos"], var.program)
    error_message = "valid values for program are 'crdc', 'ccdi', and 'ctos'"
  }
}

variable "force_delete" {
  type        = bool
  description = "force delete even when the repository is not empty"
  default     = false
}

variable "image_tag_mutability" {
  type        = string
  description = "whether to enforce tag immutability - valid values are 'MUTABLE' and 'IMMUTABLE'"
  default     = "IMMUTABLE"
}

variable "image_type" {
  type        = string
  description = "the type of images maintained in the repository (i.e. 'backend')"
}

variable "scan_on_push" {
  type        = bool
  description = "execute scans each time an image is pushed to the repository"
  default     = true
}
