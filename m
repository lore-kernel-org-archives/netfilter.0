From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Understanding conntrack: Delete and manual readd of same entry
 possible?
Date: Thu, 24 Dec 2009 00:05:44 +0100
Message-ID: <4B32A248.9070403@netfilter.org>
References: <4AC9A668.3050009@ait.ac.at>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070509000004040600040909"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AC9A668.3050009@ait.ac.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Roman Fiedler <roman.fiedler@ait.ac.at>
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------070509000004040600040909
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Roman Fiedler wrote:
> Hi list,
> 
> The failure to conduct a simple test with conntrack makes me believe, 
> that I misunderstood some part of the concept.
> 
> The testcase:
> 
> * Create one forwarded tcp connection via iptables-firewall and leave it 
> open
> * Delete the conntrack entry of this connection
> * Readd the same conntrack entry with conntrack -I
> * Verify, that old and new entry looked the same (conntrack -L)
> * Send one more byte over the still open tcp connection
> 
> The expected result:
> * TCP flow continues without creating a new conntrack entry, using the 
> one added manually
> * ACCEPT via ESTABLISHED rule because of valid conntrack entry
> 
> The actual result:
> * Conntrack code seems to believe, that packets do not belong to 
> conntrack entry
> * Conntrack code does not create new conntrack entry
> * Conntrack code cannot update conntrack-entry even when packet is 
> accepted.
> 
> Can someone enlighten me, if manual entry creation is possible?

I seem to have overlooked this email, sorry. You need this patch in 
order to make it work, I'm going to apply it to git.netfilter.org now so 
it will be available in the next release.

--------------070509000004040600040909
Content-Type: text/x-patch;
 name="fix-tcp-manually.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="fix-tcp-manually.patch"

conntrack: fix manually created TCP entries with window tracking enabled

From: Pablo Neira Ayuso <pablo@netfilter.org>

With this patch, we allow to manually create TCP entries in the table.
Basically, we disable TCP window tracking for this entry to avoid
problems.

Reported-by: Roman Fiedler <roman.fiedler@ait.ac.at>
Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
---
 extensions/libct_proto_tcp.c |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/extensions/libct_proto_tcp.c b/extensions/libct_proto_tcp.c
index ac54ac7..f229aea 100644
--- a/extensions/libct_proto_tcp.c
+++ b/extensions/libct_proto_tcp.c
@@ -202,6 +202,22 @@ static void final_check(unsigned int flags,
 			break;
 		}
 	}
+	/* Disable TCP window tracking for manually created TCP entries,
+	 * otherwise this will not work.
+	 */
+	uint8_t tcp_flags = IP_CT_TCP_FLAG_BE_LIBERAL |
+			    IP_CT_TCP_FLAG_SACK_PERM;
+
+	/* This allows to reopen a new connection directly from TIME-WAIT
+	 * as RFC 1122 states. See nf_conntrack_proto_tcp.c for more info.
+	 */
+	if (nfct_get_attr_u8(ct, ATTR_TCP_STATE) >= TCP_CONNTRACK_TIME_WAIT)
+		tcp_flags |= IP_CT_TCP_FLAG_CLOSE_INIT;
+
+	nfct_set_attr_u8(ct, ATTR_TCP_FLAGS_ORIG, tcp_flags);
+	nfct_set_attr_u8(ct, ATTR_TCP_MASK_ORIG, tcp_flags);
+	nfct_set_attr_u8(ct, ATTR_TCP_FLAGS_REPL, tcp_flags);
+	nfct_set_attr_u8(ct, ATTR_TCP_MASK_REPL, tcp_flags);
 }
 
 static struct ctproto_handler tcp = {

--------------070509000004040600040909--
