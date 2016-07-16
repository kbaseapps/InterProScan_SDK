/*
A KBase module: InterProScan_SDK
*/

module InterProScan_SDK {
    /*
        A binary boolean
    */
    typedef int bool;
    /*
        A string representing a Genome id.
    */
    typedef string genome_id;
    /*
        A string representing a workspace name.
    */
    typedef string workspace_name;
	/* 
        The workspace ID for a Report object
        @id ws KBaseReport.Report
    */
	typedef string Report_ref;

    typedef structure {
        string report_name;
        Report_ref report_ref;
    } StandardFunctionOutput;
    
    typedef structure {
        workspace_name workspace;
        workspace_name genome_workspace;
		genome_id genome_id;
		genome_id genome_output_id;
    } AnnotateGenomeWithInterproPipelineParams;
    
    funcdef annotate_genome_with_interpro_pipeline(AnnotateGenomeWithInterproPipelineParams params) returns (StandardFunctionOutput output)
        authentication required;
};