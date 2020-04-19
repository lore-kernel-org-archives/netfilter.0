From: "Philip Prindeville" <philipp@redfish-solutions.com>
Subject: [PATCH v1 1/1] Simplify unpacking start/end tuples from database
Date: Sun, 19 Apr 2020 17:17:14 -0600
Message-ID: <20200419231714.9083-1-philipp@redfish-solutions.com>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: Philip Prindeville <philipp@redfish-solutions.com>

From: Philip Prindeville <philipp@redfish-solutions.com>

Use unpack() to separate start/end instead of substr().

Signed-off-by: Philip Prindeville <philipp@redfish-solutions.com>
---
 geoip/xt_geoip_fetch | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/geoip/xt_geoip_fetch b/geoip/xt_geoip_fetch
index 4a35760b77c9509347a3846f37eeb9574aeb9883..06245195fb5166ac005b5021fa0f811e5e511c78 100755
--- a/geoip/xt_geoip_fetch
+++ b/geoip/xt_geoip_fetch
@@ -53,8 +53,9 @@ foreach my $cc (@ARGV) {
 		binmode($fh);
 
 		while (($bytes = read($fh, $buffer, AF_INET_SIZE * 2)) == AF_INET_SIZE * 2) {
-			my $start = inet_ntop(AF_INET, substr($buffer, 0, AF_INET_SIZE));
-			my $end = inet_ntop(AF_INET, substr($buffer, AF_INET_SIZE));
+			my ($start, $end) = unpack('a4a4', $buffer);
+			$start = inet_ntop(AF_INET, $start);
+			$end = inet_ntop(AF_INET, $end);
 			print $start, '-', $end, "\n";
 		}
 		close($fh);
@@ -75,8 +76,9 @@ foreach my $cc (@ARGV) {
 		binmode($fh);
 
 		while (($bytes = read($fh, $buffer, AF_INET6_SIZE * 2)) == AF_INET6_SIZE * 2) {
-			my $start = inet_ntop(AF_INET6, substr($buffer, 0, AF_INET6_SIZE));
-			my $end = inet_ntop(AF_INET6, substr($buffer, AF_INET6_SIZE));
+			my ($start, $end) = unpack('a16a16', $buffer);
+			$start = inet_ntop(AF_INET6, $start);
+			$end = inet_ntop(AF_INET6, $end);
 			print $start, '-', $end, "\n";
 		}
 		close($fh);
-- 
2.17.2

