require "fileinto";
if header :contains "X-Spam-Flag" "YES" {
  fileinto "Junk";
}
if header :contains "X-Spam-Level" "**********" {
  discard;
  stop;
}
