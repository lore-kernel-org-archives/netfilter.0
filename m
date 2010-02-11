From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Conntrackd and UDP
Date: Thu, 11 Feb 2010 12:01:40 +0100
Message-ID: <4B73E394.6010405@netfilter.org>
References: <1235464670.9964.13.camel@menhir.cc.uniud.it> <49A3FA77.2090305@netfilter.org> <20100211072218.GA28517@tkeitel002.bln.innominate.local>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000001030300080206060401"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100211072218.GA28517@tkeitel002.bln.innominate.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Tino Keitel <tkeitel@innominate.com>
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------000001030300080206060401
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Tino Keitel wrote:
> On Tue, Feb 24, 2009 at 14:47:35 +0100, Pablo Neira Ayuso wrote:
> 
> [...]
> 
>> It depends on the UDP traffic and your rule-set, for example, I
>> don't synchronize UDP DNS traffic but you may want to do it for
>> long-standing UDP flows for real-time communications. With regards
> 
> Hi,
> 
> that sounds like other UDP traffic can be synced. However, it looks
> like conntrackd does not support UDP at all. Are there plans to support
> it in upcoming releases?

Ops, it seems that I broken UDP filtering during 0.9.14. This patch
should fix it. Does it resolve the UDP support or am I missing anything
else?

--------------000001030300080206060401
Content-Type: text/x-patch;
 name="udp.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="udp.patch"

conntrackd: fix UDP filtering in configuration file

From: Pablo Neira Ayuso <pablo@netfilter.org>

UDP filtering was broken during the addition of the UDP-based
synchronization protocol that was introduced in 0.9.14. This
patch fixes the problem.

Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
---
 doc/sync/ftfw/conntrackd.conf |    1 +
 src/read_config_yy.y          |   19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/doc/sync/ftfw/conntrackd.conf b/doc/sync/ftfw/conntrackd.conf
index df10aca..877ed68 100644
--- a/doc/sync/ftfw/conntrackd.conf
+++ b/doc/sync/ftfw/conntrackd.conf
@@ -357,6 +357,7 @@ General {
 			TCP
 			SCTP
 			DCCP
+			# UDP
 			# ICMP # This requires a Linux kernel >= 2.6.31
 		}
 
diff --git a/src/read_config_yy.y b/src/read_config_yy.y
index 6dfca98..5f4e6be 100644
--- a/src/read_config_yy.y
+++ b/src/read_config_yy.y
@@ -1221,6 +1221,25 @@ filter_protocol_item : T_TCP
 				 pent->p_proto);
 };
 
+filter_protocol_item : T_UDP
+{
+	struct protoent *pent;
+
+	pent = getprotobyname("udp");
+	if (pent == NULL) {
+		print_err(CTD_CFG_WARN, "getprotobyname() cannot find "
+					"protocol `udp' in /etc/protocols");
+		break;
+	}
+	ct_filter_add_proto(STATE(us_filter), pent->p_proto);
+
+	__kernel_filter_start();
+
+	nfct_filter_add_attr_u32(STATE(filter),
+				 NFCT_FILTER_L4PROTO,
+				 pent->p_proto);
+};
+
 filter_item : T_ADDRESS T_ACCEPT '{' filter_address_list '}'
 {
 	ct_filter_set_logic(STATE(us_filter),

--------------000001030300080206060401--
