From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Subject: [PATCH] man: use https for wiki link
Date: Sun,  6 Aug 2017 21:02:43 -0400
Message-ID: <20170807010243.25408-1-dkg@fifthhorseman.net>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

https works for the wiki, and users should prefer it by default,
whether they are logging in (to protect their credentials) or whether
they're reading data (to protect the integrity of the content).

Signed-off-by: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
---
 doc/nft.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/nft.xml b/doc/nft.xml
index 4d03a3d..c9ef5e0 100644
--- a/doc/nft.xml
+++ b/doc/nft.xml
@@ -4488,7 +4488,7 @@ filter output oif wlan0
 			</simplelist>
 		</para>
 		<para>
-			There is an official wiki at: http://wiki.nftables.org
+			There is an official wiki at: https://wiki.nftables.org
 		</para>
 	</refsect1>
 
-- 
2.13.2

