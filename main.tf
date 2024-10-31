resource "aws_cloudwatch_log_metric_filter" "metric_filter" {
  log_group_name = var.cw_log_group_name
  name           = var.cw_metric_filter_name
  pattern        = "{ ($.eventSource = \"signin.amazonaws.com\") && ($.eventName = \"ConsoleLogin\") && ($.responseElements.ConsoleLogin = \"Failure\") }"

  metric_transformation {
    name      = var.cw_metric_filter_name
    namespace = var.cw_metric_filter_namespace
    value     = var.cw_metric_filter_value
  }
}

resource "aws_cloudwatch_metric_alarm" "metric_filter_alarm" {
  alarm_name          = var.cw_metric_filter_alarm_name
  comparison_operator = var.cw_metric_filter_alarm_comparison_operator
  evaluation_periods  = var.cw_metric_filter_alarm_evaluation_periods
  metric_name         = var.cw_metric_filter_name
  namespace           = var.cw_metric_filter_namespace
  period              = var.cw_metric_filter_alarm_period
  statistic           = var.cw_metric_filter_alarm_statistic
  threshold           = var.cw_metric_filter_alarm_threshold
  alarm_description   = var.cw_metric_filter_alarm_description
  alarm_actions       = var.cw_metric_filter_alarm_actions
}
