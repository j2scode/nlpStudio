## ---- ValidatorNotEmpty
#==============================================================================#
#                             ValidatorNotEmpty                                 #
#==============================================================================#
#' ValidatorNotEmpty
#'
#'
#' \code{ValidatorNotEmpty} Class for validating string is not empty
#'
#' This class provide a methods for validating character string is not empty
#'
#' @docType class
#'
#' @section Methods:
#' \describe{
#'  \item{\code{new()}}{Creates an object of ValidatorNotEmpty class}
#'  \item{\code{validate(object)}}{Method for validating string}
#' }
#'
#' @return a logical TRUE if not empty, FALSE otherwise
#' @author John James, \email{jjames@@datasciencesalon.org}
#' @family Validation Classes
#' @export
ValidatorNotEmpty <- R6::R6Class(
  "ValidatorNotEmpty",
  inherit = Validator0,
  public = list(
    validate = function(class, method, fieldName, value, level, msg, expect = NULL) {

      if (length(value) == 0) {
        self$notify(class, method, fieldName, value, level, msg, expect)
        return(FALSE)
      } else if (length(value) == 1) {
        if (value == "") {
          self$notify(class, method, fieldName, value, level, msg, expect)
          return(FALSE)
        } else {
          return(TRUE)
        }
      } else {
        return(TRUE)
      }
    }
  )
)
