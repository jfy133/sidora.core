% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataprep_lookup_in_meta_tables.R
\name{entity_type_to_table_name}
\alias{entity_type_to_table_name}
\alias{table_name_to_entity_type}
\alias{namecol_for_entity_type}
\alias{idcol_for_entity_type}
\alias{col_name_has_aux}
\alias{sidora_col_name_has_aux}
\title{Conversion and lookup functions}
\usage{
entity_type_to_table_name(entity_type)

table_name_to_entity_type(table_name)

namecol_for_entity_type(entity_type)

idcol_for_entity_type(entity_type)

col_name_has_aux(entity_type, col_name)

sidora_col_name_has_aux(sidora_col_name)
}
\arguments{
\item{entity_type}{character. An entity type (e.g. site, sample, individual etc.)}

\item{table_name}{character. A table name (e.g. TAB_Site, TAB_Sample etc.)}

\item{col_name}{character. A pandora table column name (e.g. Full_Site_Id, Id, etc.)}

\item{sidora_col_name}{character. A sidora table column name that includes the entity_type
(e.g. site.Full_Site_Id, batch.Id, etc.)}
}
\description{
These functions convert names and allow to look up specific columns.
}
