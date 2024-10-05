## dbt GA4 Package for Empik UAT Environment

This dbt package is customized for the UAT environment at Empik. It connects to an exported GA4 dataset and provides useful transformations as well as report-ready dimensional models that can be used to build reports.

## Features
- Flattened models to access common events and event parameters such as page_view, session_start, and purchase.
- Conversion of sharded event tables into a single partitioned table.
- Incremental loading of GA4 data into your staging tables.
- Page, session, and user dimensional models with conversion counts.
- Last non-direct session attribution.
- Simple methods for accessing query parameters (like UTM params) or filtering query parameters (like click IDs).
- Support for custom event parameters & user properties.
- Mapping from source/medium to default channel grouping.
