
Example data for a starting point for NLP/ML and DataAnalytics

Jobs:
  This is data collected from domains that post job listings, such as linkedin 

  Objective -- Collect the data from job postings
               Post process the data to determine statistics and track trends

  There are a few different types of files.  Original idea was to not overwrite the 
               unprocessed, scraped data but to keep adding information in subsequent files.

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

   Statistics are in the Statistics subdirectory.
              For the job boards, the stats are in dated directories with the most recent
              (as of June 11th...) being Jun07
              The file that shows the 8 vectors is final-stats-keyterms-Jobs.txt
              The stats for the phrases are relatively meaningless, currently 

    ML Binary Classifier:  Is it a Job posting or is it not?

              The data for this tasks is in the Jobs subdirectory

              *_     -->  These are files that the crawler thought might be job postings
                          based on very basic checking techniques 
              *_no_good  --> These are files that the crawler either thought were NOT
                             job postings OR they were job postings that have nothing 
                             to do with Blockchain
              *_linkList --> These are documents that the crawler thought were lists
                             of job postings, as opposed to the unique job postings themselves 

               Notes:
                 -- The data is not completely generic.  We only scrape about a dozen or so
                    domains for job postings.  Every domain has a distinct structure and the documents
                    from any given domain should have somewhat consistent characteristics.
                 -- linkedIn and Monster would be good domains to start with
                    Here is an example of real job posting:
                         linkedin/01D7AA9FB97AE7EB027A0DD58F758B9B_
                    Here is an example of bad document:
                         linkedin/054492338C502E5711D1525A96C76137_

                  -- Jobs/crypto is a good set of data to study to see well defined characteristics
                     Try this:
                     grep Title *_ | grep -v Body | grep -e " at " | more
                     check a few of those documents against real data (this means to get the Url
                     out of the data file and load it into a browser).
                     Almost all of the documents that have titles that fall into the above
                     pattern are real job postings

                     Now try this:
                     grep Title *_ | grep -v Body | grep -e " in " | more
                     check a few of those documents.  You will see that almost none of the
                     documents that have a title that follows that pattern are real job postings 
                     So, w.r.t. labeling documents for supervised training, these would all be
                     in the "no" or "false" set
                   
