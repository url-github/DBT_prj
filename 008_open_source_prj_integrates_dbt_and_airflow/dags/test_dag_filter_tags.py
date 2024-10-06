from datetime import datetime
from pathlib import Path

from airflow import DAG
from airflow.operators.dummy import DummyOperator

from dbt_airflow.core.config import DbtAirflowConfig, DbtProjectConfig, DbtProfileConfig
from dbt_airflow.core.task_group import DbtTaskGroup
from dbt_airflow.operators.execution import ExecutionOperator

with DAG(
    dag_id='test_dag_filter_tags',
    start_date=datetime(2021, 1, 1),
    catchup=False,
    tags=['example'],
) as dag:
    t1 = DummyOperator(task_id='dummy_1')
    t2 = DummyOperator(task_id='dummy_2')

	# zamiana example_dbt_project => 008_open_source_prj_integrates_dbt_and_airflow

    tg = DbtTaskGroup(
        group_id='dbt-company',
        dbt_project_config=DbtProjectConfig(
            project_path=Path('/opt/airflow/008_open_source_prj_integrates_dbt_and_airflow/'),
            manifest_path=Path('008_open_source_prj_integrates_dbt_and_airflow/target/manifest.json'),
        ),
        dbt_profile_config=DbtProfileConfig(
            profiles_path=Path('/opt/airflow/008_open_source_prj_integrates_dbt_and_airflow/profiles'),
            target='dev',
        ),
        dbt_airflow_config=DbtAirflowConfig(
            execution_operator=ExecutionOperator.BASH,
            include_tags=['finance'],
            exclude_tags=['exclude_from_hourly'],
        ),
    )

    t1 >> tg >> t2
