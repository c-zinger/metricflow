-- Read Elements From Data Source 'bookings_source'
SELECT
  1 AS bookings
  , CASE WHEN is_instant THEN 1 ELSE 0 END AS instant_bookings
  , bookings_source_src_10000.booking_value
  , bookings_source_src_10000.booking_value AS max_booking_value
  , bookings_source_src_10000.booking_value AS min_booking_value
  , bookings_source_src_10000.guest_id AS bookers
  , bookings_source_src_10000.booking_value AS average_booking_value
  , bookings_source_src_10000.is_instant
  , bookings_source_src_10000.ds
  , DATE_TRUNC(bookings_source_src_10000.ds, isoweek) AS ds__week
  , DATE_TRUNC(bookings_source_src_10000.ds, month) AS ds__month
  , DATE_TRUNC(bookings_source_src_10000.ds, quarter) AS ds__quarter
  , DATE_TRUNC(bookings_source_src_10000.ds, isoyear) AS ds__year
  , bookings_source_src_10000.ds_partitioned
  , DATE_TRUNC(bookings_source_src_10000.ds_partitioned, isoweek) AS ds_partitioned__week
  , DATE_TRUNC(bookings_source_src_10000.ds_partitioned, month) AS ds_partitioned__month
  , DATE_TRUNC(bookings_source_src_10000.ds_partitioned, quarter) AS ds_partitioned__quarter
  , DATE_TRUNC(bookings_source_src_10000.ds_partitioned, isoyear) AS ds_partitioned__year
  , bookings_source_src_10000.is_instant AS create_a_cycle_in_the_join_graph__is_instant
  , bookings_source_src_10000.ds AS create_a_cycle_in_the_join_graph__ds
  , DATE_TRUNC(bookings_source_src_10000.ds, isoweek) AS create_a_cycle_in_the_join_graph__ds__week
  , DATE_TRUNC(bookings_source_src_10000.ds, month) AS create_a_cycle_in_the_join_graph__ds__month
  , DATE_TRUNC(bookings_source_src_10000.ds, quarter) AS create_a_cycle_in_the_join_graph__ds__quarter
  , DATE_TRUNC(bookings_source_src_10000.ds, isoyear) AS create_a_cycle_in_the_join_graph__ds__year
  , bookings_source_src_10000.ds_partitioned AS create_a_cycle_in_the_join_graph__ds_partitioned
  , DATE_TRUNC(bookings_source_src_10000.ds_partitioned, isoweek) AS create_a_cycle_in_the_join_graph__ds_partitioned__week
  , DATE_TRUNC(bookings_source_src_10000.ds_partitioned, month) AS create_a_cycle_in_the_join_graph__ds_partitioned__month
  , DATE_TRUNC(bookings_source_src_10000.ds_partitioned, quarter) AS create_a_cycle_in_the_join_graph__ds_partitioned__quarter
  , DATE_TRUNC(bookings_source_src_10000.ds_partitioned, isoyear) AS create_a_cycle_in_the_join_graph__ds_partitioned__year
  , bookings_source_src_10000.listing_id AS listing
  , bookings_source_src_10000.guest_id AS guest
  , bookings_source_src_10000.host_id AS host
  , bookings_source_src_10000.guest_id AS create_a_cycle_in_the_join_graph
  , bookings_source_src_10000.listing_id AS create_a_cycle_in_the_join_graph__listing
  , bookings_source_src_10000.guest_id AS create_a_cycle_in_the_join_graph__guest
  , bookings_source_src_10000.host_id AS create_a_cycle_in_the_join_graph__host
FROM (
  -- User Defined SQL Query
  SELECT * FROM ***************************.fct_bookings
) bookings_source_src_10000
