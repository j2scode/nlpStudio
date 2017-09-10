#==============================================================================#
#                                 StateServer                                  #
#==============================================================================#
#' StateServer
#'
#' \code{StateServer} Class for storing and retrieving the most recent state
#' of NLPStudio package objects.
#'
#' \strong{StateServer Class Overview:}
#' The StateServer class object takes an object and the object's state id as
#' parameters from the object of the StateManager class and executes a save or
#' restore request on the object with the designated state id.
#'
#' \strong{State Class Family  Overview:}
#' The State family of classes is responsible for managing object persistence
#' and an archive / restore capability within the NLPStudio objects.
#'
#' \strong(State Class Family Participants:)
#' The participants of the family are as follows:
#' \itemize{
#'  \item StateManager: This class accepts save / restore requests from object
#'  methods, logs the request and dispatches requests to the StateServer, and,
#'  if the client requests that files be saved or restored, the StateArchiver
#'  class.
#'  \item StateServer: This class is responsible for saving and restoring
#'  objects from and to existing objects.
#'  \item StateArchiver: This class is responsible for archiving and
#'  restoring any files associated with an object being saved or restored.
#'  }
#'
#' @section Methods:
#' The methods for the StateServer class are as follows:
#' \describe{
#'  \item{\code{loadState(stateId = NULL)}}{Loads an object with state, designated by the stateId parameter, from file and returns the object to the StateManager object. If the stateId is not provided, the default is to load the most current versions of all objects and return a list of the objects to the StateManager object.}
#'  \item{\code{saveState(object, stateId)}}{Saves an object to disk with the designated stateId.  Both parameters, object and stateId are required.  The method returns the object saved to the StateManager object.}
#' }
#'
#' @param object The object to be loaded or saved.
#' @param stateId The unique identifier for the object and state.
#'
#' @return object(s) List of one or several objects loaded or saved.
#'
#' @docType class
#' @author John James, \email{jjames@@datasciencesalon.org}
#' @family State Classes
#' @export
StateServer <- R6::R6Class(
  classname = "StateServer",
  lock_objects = FALSE,
  private = list(
    ..stateFile = "./NLPStudio/.State.Rdata"
  ),
  public = list(

    loadState = function(stateId = NULL) {

      load(file = private$..stateFile)

      if (is.null(stateId)) {
        states <- lapply(seq_along(state), function(s) { state[[s]] })
      } else {
        states <- states[[stateId]]
      }
      return(states)
    },

    saveState = function(object, stateId) {

      # Validation
      if (missing(object)) {
        v <- Validate0$new()
        v$notify(cls = "StateServer", method = "saveState",
                 fieldName = "object", value = "", level = "Error",
                 msg = paste("Object is missing with no default.",
                             "See ?StateServer for further assistance."),
                 expect = TRUE)
        stop()
      }

      if (missing(stateId)) {
        v <- Validate0$new()
        v$notify(cls = "StateServer", method = "saveState",
                 fieldName = "stateId", value = "", level = "Error",
                 msg = paste("StateId parameter is missing with no default.",
                             "See ?StateServer for further assistance."),
                 expect = TRUE)
        stop()
      }

      # Validate object class
      v <- ValidateClass$new()
      if (v$validate(cls = "StateServer", method = "saveState",
                     fieldName = "object", value = object, level = "Error",
                     msg = paste("Object is not a valid 'R6' object",
                                 "See ?StateServer for further assistance."),
                     expect = "R6") == FALSE) {
        stop()
      }

      # Retrieve current list of saved objects, append the list, and save
      states <- self$loadState()
      states[[stateId]] <- object
      save(states, file = private$..stateFile)
      invisible(object)
    }
  )
)