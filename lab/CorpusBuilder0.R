#==============================================================================#
#                              CorpusBuilder0                                  #
#==============================================================================#
#' CorpusBuilder0
#'
#' \code{CorpusBuilder0} Abstract builder class of the CorpusBuilder set of
#' classes
#'
#' \strong{CorpusBuilder0 Class Overview:}
#'
#' The CorpusBuilder0 family of classes is an implementation of the builder
#' pattern documented in the book "Design Patterns: Elements of Reusable
#' Object-Oriented Software" by Erich Gamma, Richard Helm, Ralph Johnson
#' and John Vlissides (hence Gang of Four). This pattern allows for different
#' representations of a corpus to be constructed, independent of the
#' components that comprise the corpus. Corpora are constructed to  support
#' various stages of analysis from raw, preprocessed, clean, cross-validation
#' and language modeling.
#'
#' @section CorpusBuilder Class Participants:
#' The participants of the CorpusBuilder
#' class are:
#' \enumerate{
#'  \item CorpusBuilder0: Specifies an abstract interface for creating parts
#'  of the composite Document0 Class object.
#'  \item CorpusDirector: Constructs the objects using the CorpusBuilder0
#'  interface.
#'  \item CorpusBuilderRaw: Constructs a raw corpus originating from a range
#'  of sources including web and directory sources.
#'  \item CorpusBuilderPreprocessor: Constructs a preprocessed corpus
#'  from the raw corpus. This will include basic encoding fixes and tokenization.
#'  \item CorpusBuilderClean: Constructs a clean corpus. Interacts with the
#'  CorpusDesigner0 and CorpusProcessor0 classes to design and render the
#'  clean corpus.
#'  \item CorpusBuilderPilot. Constructs a representative sample of the
#'  clean corpus for exploratory data analysis, modeling and evaluation. This
#'  method interfaces with the CorpusAnalyzer0, CorpusDesigner0, and
#'  CorpusProcessor0 classes to analyze the originating corpus, design
#'  the pilot corpus and process.
#'  \item CorpusBuilderValidationSets. Constructs training, validation
#'  and test sets.  Interacts with the CorpusAnalyzer0, CorpusDesigner0,
#'  and CorpusProcessor0 classes to analyze, design, and render the
#'  training, validation, and test set objects.
#'  }
#'
#' @section CorpusBuilder Generic Interface:
#' The abstract interface in the CorpusBuilder0 class outlines "generic"
#' algorithm common to all concrete builder classes. The core methods are
#' defined as follows:
#' \enumerate{
#'  \item initialize: Instantiates an object of a concrete CorpusBuilder
#'   classes.
#'  \item buildCollection: Constructs an object of the DocumentCollection
#'  class. This is a composite class containing other DocumentCollection
#'  objects or individual objects of the Document class.
#'  \item buildDocuments: Constructs an object of the Document class. This
#'  method requires the designation of file names as a required parameter.
#'  \item sourceCorpus: Obtains the originator corpus from sources such
#'  as web sites or directories, and stores it to disk.
#'  \item analyzeCorpus: Analyzes the corpus via the CorpusAnalyzer0
#'  interface, an implementation of the strategy pattern.  Data quality,
#'  word frequency, and semantic analyses are a few of the types of analyses
#'  supported.
#'  \item designCorpus: Interacts with the CorpusDesigner0 interface,
#'  allowing the client to design a corpus based upon features to be
#'  included/excluded, sample sizes, etc...
#'  \item processCorpus: Constructs the corpus using the CorpusProcessor0
#'  interface.
#'  \item evaluateCorpus: Interfaces with the CorpusAnalyzer0 class to
#'  confirm that the corpus conforms to designated design features.
#' }
#'
#' @section CorpusBuilder Collaborations:
#' The sourcing, analysis, design, and processing steps are implemented using
#' various strategy patterns. The following behavioral methods have been
#' devised to select concrete implementations of the strategy classes and are
#' summarized as follows:
#' \itemize{
#'  \item getCorpusSource: Method for selecting the corpus source method.
#'  \item setCorpusSource:  Method for setting the corpus source methods.
#'  \item getAnalyzer: Method for selecting the analysis methods
#'  \item setAnalyzer: Method for setting the analysis methods.
#'  \item getDesigner: Method for selecting the corpus designer method.
#'  \item setDesigner: Method for setting the corpus designer methods.
#'  \item getProcessor: Method for selecting the corpus processor method.
#'  \item setProcessor: Method for setting the corpus processor methods.
#' }
#'
#' @param corpusName String containing the name of the corpus to be built.
#' @param corpusDesc String containing the dscription of the corpus to be built.
#' @param documentNames Character vector listing the names of the documents in the corpus.
#' @param documentFileNames Character vector listing the file names for the documents in the corpus.
#' @param corpusSource Object of class CorpusSource, indicating the methods for sourcing the corpus.
#' @param analyzer Object of class Analyzer that conducts an analysis on the obtained corpus.
#' @param designer Object of class Designer that designates the features of the corpus.
#' @param processor Object of class Processor that renders the corpus.
#'
#' @return This abstract class is not implemented.
#'
#' @docType class
#' @author John James, \email{jjames@@datasciencesalon.org}
#' @family CorpusBuilder Classes
#' @export
CorpusBuilder0 <- R6::R6Class(
  classname = "CorpusBuilder0",
  lock_objects = FALSE,
  lock_class = FALSE,

  private = list(
    ..name = character(0),
    ..corpusName = character(0),
    ..corpusPath = character(0),
    ..corpus = character(0),
    ..analyzer = character(0),
    ..designer = character(0),
    ..processor = character(0),
    ..created = character(0),
    ..modified = character(0),

    ..downloadDir = "download",
    ..rawDir = "raw",

    getLabPath = function()  {
      lab <- nlpStudio$currentLab
      lab <- lab$getLab()
      lab$name
    }
  ),

  active = list(
    corpusSource = function(value) stop("Method is not available from CorpusBuilder0, an abstract class!"),
    analyzer = function(value) stop("Method is not available from CorpusBuilder0, an abstract class!"),
    designer = function(value) stop("Method is not available from CorpusBuilder0, an abstract class!"),
    processor = function(value) stop("Method is not available from CorpusBuilder0, an abstract class!")
  ),

  public = list(
    initialize = function(name, desc = NULL) stop("Method is not available from CorpusBuilder0, an abstract class!"),
    getBuilder = function() stop("Method is not available from CorpusBuilder0, an abstract class!"),
    buildCollection = function() stop("Method is not available from CorpusBuilder0, an abstract class!"),
    buildDocuments = function() stop("Method is not available from CorpusBuilder0, an abstract class!"),
    addDocuments = function() stop("Method is not available from CorpusBuilder0, an abstract class!"),
    obtainCorpus = function() stop("Method is not available from CorpusBuilder0, an abstract class!"),
    analyzeCorpus = function() stop("Method is not available from CorpusBuilder0, an abstract class!"),
    designCorpus = function() stop("Method is not available from CorpusBuilder0, an abstract class!"),
    processCorpus = function() stop("Method is not available from CorpusBuilder0, an abstract class!"),
    getCorpus = function() stop("Method is not available from CorpusBuilder0, an abstract class!")
  )
)
