From: "Philip Prindeville" <philipp@redfish-solutions.com>
Subject: [PATCH v1 1/1] Update download script for DBIP database
Date: Sun, 19 Apr 2020 18:09:41 -0600
Message-ID: <20200420000941.10550-1-philipp@redfish-solutions.com>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: Philip Prindeville <philipp@redfish-solutions.com>

From: Philip Prindeville <philipp@redfish-solutions.com>

Signed-off-by: Philip Prindeville <philipp@redfish-solutions.com>
---
 geoip/xt_geoip_dl | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/geoip/xt_geoip_dl b/geoip/xt_geoip_dl
old mode 100755
new mode 100644
index 1de60442a8040f55d775d134d7a8ea707582d71e..91aa95b650a968fb8cd989ac5b08ec890a45f008
--- a/geoip/xt_geoip_dl
+++ b/geoip/xt_geoip_dl
@@ -1,7 +1,11 @@
 #!/bin/sh
 
-rm -rf GeoLite2-Country-CSV_*
+timestamp=$(date "+%Y-%m")
 
-wget -q http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country-CSV.zip
-unzip -q GeoLite2-Country-CSV.zip
-rm -f GeoLite2-Country-CSV.zip
+wget -q "https://download.db-ip.com/free/dbip-country-lite-${timestamp}.csv.gz"
+
+zcat dbip-country-lite-${timestamp}.csv.gz > dbip-country-lite.csv
+
+rm -f dbip-country-lite-${timestamp}.csv.gz
+
+exit 0
-- 
2.17.2

