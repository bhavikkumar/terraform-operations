data "aws_iam_policy_document" "alert_topic_policy" {
  statement {
    effect = "Allow"

    actions = [
      "sns:Publish"
    ]

    resources = [
      "${aws_sns_topic.alert.arn}"
    ]

    principals {
      type = "AWS"

      identifiers = [
        "${data.terraform_remote_state.master.master_account_id}",
        "${data.terraform_remote_state.master.identity_account_id}",
        "${data.terraform_remote_state.master.operations_account_id}",
        "${data.terraform_remote_state.master.development_account_id}",
        "${data.terraform_remote_state.master.production_account_id}"
      ]
    }
  }
}

resource "aws_sns_topic" "alert" {
  name              = "alerts"
  display_name      = "alert-topic"
  kms_master_key_id = "${data.terraform_remote_state.master.default_kms_key_arn}"
}

resource "aws_sns_topic_policy" "allow_accounts" {
  arn    = "${aws_sns_topic.alert.arn}"
  policy = "${data.aws_iam_policy_document.alert_topic_policy.json}"
}