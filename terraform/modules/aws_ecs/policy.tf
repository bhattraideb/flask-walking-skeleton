resource "aws_iam_policy" "task_execution_role_policy" {
  policy      = file("${path.module}/templates/ecs/task-exec-role.json")
  name        = "${var.prefix}-task-exec-role-policy"
  path        = "/"
  description = "Allow retrieving of image and adding to logs"
}

resource "aws_iam_role" "task_execution_role" {
  #  assume_role_policy = "${path.module}/templates/ecs/assume-role-policy.json"
  assume_role_policy = file("${path.module}/templates/ecs/assume-role-policy.json")
  name               = "${var.prefix}-task-exec-role"
}

resource "aws_iam_role_policy_attachment" "task_execution_role" {
  policy_arn = aws_iam_policy.task_execution_role_policy.arn
  role       = aws_iam_role.task_execution_role.name
}

resource "aws_iam_role" "app_iam_role" {
  assume_role_policy = file("${path.module}/templates/ecs/assume-role-policy.json")
  name               = "${var.prefix}-app-task"
}

#data "template_file" "ecs_s3_write_policy" {
#  template = file("./templates/ecs/s3-write-policy.json.tpl")
#
#  vars = {
#    bucket_arn = aws_s3_bucket.app_public_files.arn
#  }
#}
#
#resource "aws_iam_policy" "ecs_s3_access" {
#  policy      = data.template_file.ecs_s3_write_policy.rendered
#  name        = "${var.prefix}-AppS3AccessPolicy"
#  description = "Allow access to the app S3 bucket"
#  path        = "/"
#}
#
#resource "aws_iam_role_policy_attachment" "ecs_s3_access" {
#  role       = aws_iam_role.app_iam_role.name
#  policy_arn = aws_iam_policy.ecs_s3_access.arn
#}