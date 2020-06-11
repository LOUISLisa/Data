
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


