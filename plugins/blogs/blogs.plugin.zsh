# Convenience functions for blog actions

# Upload image to S3 and put the Markdown'd URL in the clipboard
ignoreimage() {
  aws s3api put-object --bucket assets2.nore.me --key posts/$1 --body $1 --profile blogs;
  echo "![alttext](http://assets2.nore.me/posts/$1)" | pbcopy;
}