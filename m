From: "Philip Prindeville" <philipp@redfish-solutions.com>
Subject: [PATCH v1 1/1] update MaxMind URL's
Date: Sun, 19 Apr 2020 17:42:22 -0600
Message-ID: <20200419234222.9685-1-philipp@redfish-solutions.com>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: Philip Prindeville <philipp@redfish-solutions.com>

From: Philip Prindeville <philipp@redfish-solutions.com>

---
 geoip/xt_geoip_dl | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/geoip/xt_geoip_dl b/geoip/xt_geoip_dl
old mode 100755
new mode 100644
index 1de60442a8040f55d775d134d7a8ea707582d71e..e46e084160a244aadf0cb66b05e43e0a71009134
--- a/geoip/xt_geoip_dl
+++ b/geoip/xt_geoip_dl
@@ -1,7 +1,10 @@
 #!/bin/sh
 
+YOUR_LICENSE_KEY='your-license-key-here'
+
 rm -rf GeoLite2-Country-CSV_*
 
-wget -q http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country-CSV.zip
+wget -q "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-Country-CSV&license_key=${YOUR_LICENSE_KEY}&suffix=zip" -O GeoLite2-Country-CSV.zip
+
 unzip -q GeoLite2-Country-CSV.zip
 rm -f GeoLite2-Country-CSV.zip
-- 
2.17.2

