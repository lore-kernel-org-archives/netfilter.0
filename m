From: "Philip Prindeville" <philipp@redfish-solutions.com>
Subject: [PATCH v1 1/1] geoip: cleanup intermediate files and run quieter
Date: Fri, 16 Feb 2018 15:15:05 -0700
Message-ID: <20180216221505.13354-1-philipp@redfish-solutions.com>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: Philip Prindeville <philipp@redfish-solutions.com>, Jan Engelhardt <jengelh@users.sourceforge.net>

From: Philip Prindeville <philipp@redfish-solutions.com>

Signed-off-by: Philip Prindeville <philipp@redfish-solutions.com>
---
 geoip/xt_geoip_dl | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/geoip/xt_geoip_dl b/geoip/xt_geoip_dl
index 50d3806ebe50a21fc102823868a91472d1dbde71..176832a0b9e88fb6f762fe33bdaa404dbfed5206 100755
--- a/geoip/xt_geoip_dl
+++ b/geoip/xt_geoip_dl
@@ -1,8 +1,9 @@
 #!/bin/sh
 
-rm -f GeoIPv6.csv GeoIPv6.csv.gz GeoIPCountryCSV.zip GeoIPCountryWhois.csv;
-wget \
+rm -f GeoIPv6.csv GeoIPv6.csv.gz GeoIPCountryCSV.zip GeoIPCountryWhois.csv
+wget -q \
 	http://geolite.maxmind.com/download/geoip/database/GeoIPv6.csv.gz \
-	http://geolite.maxmind.com/download/geoip/database/GeoIPCountryCSV.zip;
-gzip -d GeoIPv6.csv.gz;
-unzip GeoIPCountryCSV.zip;
+	http://geolite.maxmind.com/download/geoip/database/GeoIPCountryCSV.zip
+gzip -d GeoIPv6.csv.gz
+unzip -q GeoIPCountryCSV.zip
+rm -f GeoIPv6.csv.zip GeoIPCountryCSV.zip
-- 
2.13.6

