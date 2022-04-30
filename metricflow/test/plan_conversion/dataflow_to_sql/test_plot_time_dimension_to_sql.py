from _pytest.fixtures import FixtureRequest

from metricflow.dataflow.dataflow_plan import PlotTimeDimensionTransformNode
from metricflow.dataset.data_source_adapter import DataSourceDataSet
from metricflow.plan_conversion.dataflow_to_sql import DataflowToSqlQueryPlanConverter
from metricflow.protocols.sql_client import SqlClient
from metricflow.specs import TimeDimensionReference
from metricflow.test.fixtures.model_fixtures import ConsistentIdObjectRepository
from metricflow.test.fixtures.setup_fixtures import MetricFlowTestSessionState
from metricflow.test.plan_conversion.test_dataflow_to_sql_plan import convert_and_check


def test_plot_time_dimension_transform_node_using_primary_time(  # noqa: D
    request: FixtureRequest,
    mf_test_session_state: MetricFlowTestSessionState,
    dataflow_to_sql_converter: DataflowToSqlQueryPlanConverter[DataSourceDataSet],
    consistent_id_object_repository: ConsistentIdObjectRepository,
    sql_client: SqlClient,
) -> None:
    """Tests converting a PlotTimeDimensionTransform node using the primary time dimension to SQL."""
    source_node = consistent_id_object_repository.simple_model_read_nodes["bookings_source"]
    plot_time_dimension_transform_node = PlotTimeDimensionTransformNode(
        parent_node=source_node, aggregation_time_dimension_reference=TimeDimensionReference(element_name="ds")
    )
    convert_and_check(
        request=request,
        mf_test_session_state=mf_test_session_state,
        dataflow_to_sql_converter=dataflow_to_sql_converter,
        sql_client=sql_client,
        node=plot_time_dimension_transform_node,
    )


def test_plot_time_dimension_transform_node_using_non_primary_time(  # noqa: D
    request: FixtureRequest,
    mf_test_session_state: MetricFlowTestSessionState,
    dataflow_to_sql_converter: DataflowToSqlQueryPlanConverter[DataSourceDataSet],
    consistent_id_object_repository: ConsistentIdObjectRepository,
    sql_client: SqlClient,
) -> None:
    """Tests converting a PlotTimeDimensionTransform node using a non-primary time dimension to SQL."""
    source_node = consistent_id_object_repository.simple_model_read_nodes["bookings_source"]
    plot_time_dimension_transform_node = PlotTimeDimensionTransformNode(
        parent_node=source_node,
        aggregation_time_dimension_reference=TimeDimensionReference(element_name="booking_paid_at"),
    )
    convert_and_check(
        request=request,
        mf_test_session_state=mf_test_session_state,
        dataflow_to_sql_converter=dataflow_to_sql_converter,
        sql_client=sql_client,
        node=plot_time_dimension_transform_node,
    )
