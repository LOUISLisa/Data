
Example data for a starting point for NLP/ML and DataAnalytics

Jobs:
  This is data collected from domains that post job listings, such as linkedin 

  Objective -- Collect the data from job postings
               Post process the data to determine statistics and track trends

  Four flavors of files.  Original idea was to not overwrite the original data
               But to keep adding information in subsequent files.

               All data is in Json format

               *_    These are the files produced by the Data Collector (crawler)
               *_basic_extra_fields    These are files that contain extracted and/or extrapolated
                                       fields, such as "Posted" and KeyTerms
               *_index   These are the files that contain All information -- both the raw, scraped
                         data and the extracted/extrapolated/processed fields.  The _index
                         is in reference to the notion of indexing into Elastic Search.
               *_no_good    These files indicate pages that were scraped but they did not contain
                            the basic information to make us think it was a real job posting.
               *_linkList   Files named linkList are meant to indicate that current (limited)
                            NLP rules classified this document as linkList as opposed to 
                            a unique job posting


   ML Classifier (Lu):  Does the page contain a full, unique job posting?

   Similarity Detector or Other (Parul):  Can we extract Just the relevant text out of the body 
                   of the document and discard header/repeated/meaningless text?

   NLP (Leon) : 
       Named Entity Recognition or other (Stanford Core NLP) to extract
         * CompanyName
         * Location (Remote or Named Location).  If Remote, can we figure out the Company Location?
         * Salary information
         * Verify Data Posted 
         * Other date related meta data?  (Heidle Time)
       StopWords, Stemming

    NLP / DataAnalytics (Leon, Nikhil)
        Synonyms
        Term Frequencies
        Phrase Frequencies
        Tracking trends?
        Other

    (Ensure the data is statistically accurate [All?])
 
    Data Analytics / Data Science (Nikhil):
        What questions can the data answer?
        How can we use the data to provide insights into the Blockchain space?
        The data is N dimensional.  8 Dimensions currently, but may add a
            few more after Leon incorporates the addional NER.
        Job Postings

        Is there any way to automate the process of identifying opportunities
        that would be beneficial for Building Blocks to pursue? 

        https://www.displayr.com/alternatives-word-cloud/


        WebSites
        WhitePapers
