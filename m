From: Steven Cole <elenstev@mesatop.com>
Subject: [PATCH] 2.4.20-pre6, -pre5-ac4 Configure.help fix for
	CONFIG_IP_NF_MATCH_DSCP
Date: 11 Sep 2002 13:19:29 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1031771969.1984.364.camel@spc9.esa.lanl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Harald Welte <laforge@gnumonks.org>
Cc: netfilter@lists.netfilter.org, Marcelo Tosatti <marcelo@conectiva.com.br>, Alan Cox <alan@lxorguk.ukuu.org.uk>

Greetings,

In 2.4.20-pre6 and -pre5-ac4, there are two help texts in
Documentation/Configure.help for CONFIG_IP_NF_TARGET_DSCP and
there is currently no help text for CONFIG_IP_NF_MATCH_DSCP.

It looks like the first help text should really be for
CONFIG_IP_NF_MATCH_DSCP. 

The small patch at the end should fix this. The patch was made 
against 2.4.20-pre6, but will apply to 2.4.20-pre5-ac4 with 
a small offset (36 lines).

Steven 

First help text for CONFIG_IP_NF_TARGET_DSCP:

DSCP match support
CONFIG_IP_NF_TARGET_DSCP
  This option adds a `DSCP' match, which allows you to match against
  the IPv4 header DSCP field (DSCP codepoint).

  The DSCP codepoint can have any value between 0x0 and 0x4f.

  If you want to compile it as a module, say M here and read
  Documentation/modules.txt.  If unsure, say `N'.

----------------------------------------------------------------------
Second help text for CONFIG_IP_NF_TARGET_DSCP:

DSCP target support
CONFIG_IP_NF_TARGET_DSCP
  This option adds a `DSCP' target, which allows you to create rules in
  the iptables mangle table. The selected packet has the DSCP field set
  to the hex value provided on the command line; unlike the TOS target
  which will only set the legal values within ip.h.

  The DSCP field can be set to any value between 0x0 and 0x4f. It does
  take into account that bits 6 and 7 are used by ECN.

  If you want to compile it as a module, say M here and read
  Documentation/modules.txt.  If unsure, say `N'.


--- linux-2.4.20-pre6/Documentation/Configure.help.orig	Wed Sep 11 11:49:17 2002
+++ linux-2.4.20-pre6/Documentation/Configure.help	Wed Sep 11 11:49:56 2002
@@ -2588,7 +2588,7 @@
   Documentation/modules.txt.  If unsure, say `N'.
 
 DSCP match support
-CONFIG_IP_NF_TARGET_DSCP
+CONFIG_IP_NF_MATCH_DSCP
   This option adds a `DSCP' match, which allows you to match against
   the IPv4 header DSCP field (DSCP codepoint).
 




