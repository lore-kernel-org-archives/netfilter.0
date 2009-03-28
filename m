From: Alex Riesen <fork0@users.sourceforge.net>
Subject: [PATCH] Fix selection of "LED" target in netfilter
Date: Sat, 28 Mar 2009 15:36:37 +0100
Message-ID: <20090328143637.GA8903@blimp.localdomain>
Reply-To: Alex Riesen <fork0@users.sourceforge.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: Adam Nielsen <a.nielsen@shikadi.net>, Subrata Modak <tosubrata@gmail.com>, netfilter@vger.kernel.org

It's plural, not LED_TRIGGERS.

Signed-off-by: Alex Riesen <raa@blimp.localhost>
---
 net/netfilter/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/netfilter/Kconfig b/net/netfilter/Kconfig
index 2c967e4..7c99d09 100644
--- a/net/netfilter/Kconfig
+++ b/net/netfilter/Kconfig
@@ -374,7 +374,7 @@ config NETFILTER_XT_TARGET_HL
 
 config NETFILTER_XT_TARGET_LED
 	tristate '"LED" target support'
-	depends on LEDS_CLASS && LED_TRIGGERS
+	depends on LEDS_CLASS && LEDS_TRIGGERS
 	depends on NETFILTER_ADVANCED
 	help
 	  This option adds a `LED' target, which allows you to blink LEDs in
-- 
1.6.2.1.336.g36e1

