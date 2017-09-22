-- run this to create missing tables in results schema
-- http://www.ohdsi.org/web/wiki/doku.php?id=documentation:software:webapi:multiple_datasets_configuration
CREATE TABLE omop_cdm_kudu.cohort_inclusion(
  cohort_definition_id int,
  rule_sequence int,
  name string,
  description string,
  PRIMARY KEY (cohort_definition_id)
)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU
TBLPROPERTIES (
  'kudu.master_addresses' = 'bottou04.sjc.cloudera.com'
)
;

CREATE TABLE omop_cdm_kudu.cohort_inclusion_result(
  cohort_definition_id int,
  inclusion_rule_mask bigint,
  person_count bigint,
  PRIMARY KEY (cohort_definition_id)
)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU
TBLPROPERTIES (
  'kudu.master_addresses' = 'bottou04.sjc.cloudera.com'
)
;

CREATE TABLE omop_cdm_kudu.cohort_inclusion_stats(
  cohort_definition_id int,
  rule_sequence int,
  person_count bigint,
  gain_count bigint,
  person_total bigint,
  PRIMARY KEY (cohort_definition_id)
)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU
TBLPROPERTIES (
  'kudu.master_addresses' = 'bottou04.sjc.cloudera.com'
)
;

CREATE TABLE omop_cdm_kudu.cohort_summary_stats(
  cohort_definition_id int,
  base_count bigint,
  final_count bigint,
  PRIMARY KEY (cohort_definition_id)
)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU
TBLPROPERTIES (
  'kudu.master_addresses' = 'bottou04.sjc.cloudera.com'
)
;

CREATE TABLE omop_cdm_kudu.feas_study_result(
  study_id int,
  inclusion_rule_mask bigint,
  person_count bigint,
  PRIMARY KEY (study_id)
)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU
TBLPROPERTIES (
  'kudu.master_addresses' = 'bottou04.sjc.cloudera.com'
)
;

CREATE TABLE omop_cdm_kudu.feas_study_index_stats(
  study_id int,
  person_count bigint,
  match_count bigint,
  PRIMARY KEY (study_id)
)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU
TBLPROPERTIES (
  'kudu.master_addresses' = 'bottou04.sjc.cloudera.com'
)
;

CREATE TABLE omop_cdm_kudu.feas_study_inclusion_stats(
  study_id int,
  rule_sequence int,
  name string,
  person_count bigint,
  gain_count bigint,
  person_total bigint,
  PRIMARY KEY (study_id)
)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU
TBLPROPERTIES (
  'kudu.master_addresses' = 'bottou04.sjc.cloudera.com'
)
;

create table omop_cdm_kudu.heracles_analysis
(
	analysis_id int,
	analysis_name string,
	stratum_1_name string,
	stratum_2_name string,
	stratum_3_name string,
	stratum_4_name string,
	stratum_5_name string,
	analysis_type string,
  PRIMARY KEY (analysis_id)
)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU
TBLPROPERTIES (
  'kudu.master_addresses' = 'bottou04.sjc.cloudera.com'
)
;
CREATE TABLE omop_cdm_kudu.HERACLES_HEEL_results
(
cohort_definition_id int,
analysis_id INT,
HERACLES_HEEL_warning string,
  PRIMARY KEY (cohort_definition_id)
)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU
TBLPROPERTIES (
  'kudu.master_addresses' = 'bottou04.sjc.cloudera.com'
)
;

create table omop_cdm_kudu.heracles_results
(
	cohort_definition_id int,
	analysis_id int,
	stratum_1 string,
	stratum_2 string,
	stratum_3 string,
	stratum_4 string,
	stratum_5 string,
	count_value bigint,
	last_update_time timestamp, -- DEFAULT (now())
  PRIMARY KEY (cohort_definition_id)
)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU
TBLPROPERTIES (
  'kudu.master_addresses' = 'bottou04.sjc.cloudera.com'
)
;


create table omop_cdm_kudu.heracles_results_dist
(
	cohort_definition_id int,
	analysis_id int,
	stratum_1 string,
	stratum_2 string,
	stratum_3 string,
	stratum_4 string,
	stratum_5 string,
	count_value bigint,
	min_value float,
	max_value float,
	avg_value float,
	stdev_value float,
	median_value float,
	p10_value float,
	p25_value float,
	p75_value float,
	p90_value float,
	last_update_time timestamp, -- DEFAULT (now())
  PRIMARY KEY (cohort_definition_id)
)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU
TBLPROPERTIES (
  'kudu.master_addresses' = 'bottou04.sjc.cloudera.com'
)
;

CREATE TABLE omop_cdm_kudu.ir_analysis_dist (
  analysis_id int,
  target_id int,
  outcome_id int,
  strata_sequence INT,
  dist_type int,
  total bigint,
  avg_value float,
  std_dev float,
  min_value int,
  p10_value int,
  p25_value int,
  median_value int,
  p75_value int,
  p90_value int,
  max_value int,
  PRIMARY KEY (analysis_id)
)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU
TBLPROPERTIES (
  'kudu.master_addresses' = 'bottou04.sjc.cloudera.com'
)
;

CREATE TABLE omop_cdm_kudu.ir_strata(
  analysis_id int,
  strata_sequence int,
  name string,
  description string,
  PRIMARY KEY (analysis_id)
)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU
TBLPROPERTIES (
  'kudu.master_addresses' = 'bottou04.sjc.cloudera.com'
)
;

CREATE TABLE omop_cdm_kudu.ir_analysis_result(
  analysis_id int,
  target_id int,
  outcome_id int,
  strata_mask bigint,
  person_count bigint,
  time_at_risk bigint,
  cases bigint,
  PRIMARY KEY (analysis_id)
)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU
TBLPROPERTIES (
  'kudu.master_addresses' = 'bottou04.sjc.cloudera.com'
)
;

CREATE TABLE omop_cdm_kudu.ir_analysis_strata_stats(
  analysis_id int,
  target_id int,
  outcome_id int,
  strata_sequence int,
  person_count bigint,
  time_at_risk bigint,
  cases bigint,
  PRIMARY KEY (analysis_id)
)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU
TBLPROPERTIES (
  'kudu.master_addresses' = 'bottou04.sjc.cloudera.com'
)
;
