From: Ulrich Weber <uw@xyne.com>
Subject: [PATCH] ulogd: make NFCT packet counter/length 64 bit
Date: Wed, 9 Oct 2013 12:00:01 +0200
Message-ID: <20131009100001.GA6222@gir>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: eric@regit.org
Cc: netfilter@vger.kernel.org

Kernel and libnetfilter_conntrack counters are 64bit,
so use 64bit too in ulogd instead of 32bit.

Worked fine on little endian systems but big endian systems
had zero counter...

Didn't test ipfix output, but RFC allows template with
either 32 or 64 counters, so should be safe.

Signed-off-by: Ulrich Weber <uw@xyne.com>
---
 input/flow/ulogd_inpflow_NFCT.c | 24 ++++++++++++------------
 output/ulogd_output_NACCT.c     | 16 ++++++++--------
 util/printflow.c                | 16 ++++++++--------
 3 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/input/flow/ulogd_inpflow_NFCT.c b/input/flow/ulogd_inpflow_NFCT.c
index afb6c18..ab2bc10 100644
--- a/input/flow/ulogd_inpflow_NFCT.c
+++ b/input/flow/ulogd_inpflow_NFCT.c
@@ -240,7 +240,7 @@ static struct ulogd_key nfct_okeys[] = {
 		},
 	},
 	{
-		.type	= ULOGD_RET_UINT32,
+		.type	= ULOGD_RET_UINT64,
 		.flags	= ULOGD_RETF_NONE,
 		.name	= "orig.raw.pktlen",
 		.ipfix	= {
@@ -250,7 +250,7 @@ static struct ulogd_key nfct_okeys[] = {
 		},
 	},
 	{
-		.type	= ULOGD_RET_UINT32,
+		.type	= ULOGD_RET_UINT64,
 		.flags	= ULOGD_RETF_NONE,
 		.name	= "orig.raw.pktcount",
 		.ipfix	= {
@@ -305,7 +305,7 @@ static struct ulogd_key nfct_okeys[] = {
 		},
 	},
 	{
-		.type	= ULOGD_RET_UINT32,
+		.type	= ULOGD_RET_UINT64,
 		.flags	= ULOGD_RETF_NONE,
 		.name	= "reply.raw.pktlen",
 		.ipfix	= {
@@ -315,7 +315,7 @@ static struct ulogd_key nfct_okeys[] = {
 		},
 	},
 	{
-		.type	= ULOGD_RET_UINT32,
+		.type	= ULOGD_RET_UINT64,
 		.flags	= ULOGD_RETF_NONE,
 		.name	= "reply.raw.pktcount",
 		.ipfix	= {
@@ -561,14 +561,14 @@ static int propagate_ct(struct ulogd_pluginstance *main_upi,
 			     htons(nfct_get_attr_u16(ct, ATTR_REPL_PORT_DST)));
 	}
 
-	okey_set_u32(&ret[NFCT_ORIG_RAW_PKTLEN],
-		     nfct_get_attr_u32(ct, ATTR_ORIG_COUNTER_BYTES));
-	okey_set_u32(&ret[NFCT_ORIG_RAW_PKTCOUNT],
-		     nfct_get_attr_u32(ct, ATTR_ORIG_COUNTER_PACKETS));
-	okey_set_u32(&ret[NFCT_REPLY_RAW_PKTLEN],
-		     nfct_get_attr_u32(ct, ATTR_REPL_COUNTER_BYTES));
-	okey_set_u32(&ret[NFCT_REPLY_RAW_PKTCOUNT],
-		     nfct_get_attr_u32(ct, ATTR_REPL_COUNTER_PACKETS));
+	okey_set_u64(&ret[NFCT_ORIG_RAW_PKTLEN],
+		     nfct_get_attr_u64(ct, ATTR_ORIG_COUNTER_BYTES));
+	okey_set_u64(&ret[NFCT_ORIG_RAW_PKTCOUNT],
+		     nfct_get_attr_u64(ct, ATTR_ORIG_COUNTER_PACKETS));
+	okey_set_u64(&ret[NFCT_REPLY_RAW_PKTLEN],
+		     nfct_get_attr_u64(ct, ATTR_REPL_COUNTER_BYTES));
+	okey_set_u64(&ret[NFCT_REPLY_RAW_PKTCOUNT],
+		     nfct_get_attr_u64(ct, ATTR_REPL_COUNTER_PACKETS));
 
 	okey_set_u32(&ret[NFCT_CT_MARK], nfct_get_attr_u32(ct, ATTR_MARK));
 	okey_set_u32(&ret[NFCT_CT_ID], nfct_get_attr_u32(ct, ATTR_ID));
diff --git a/output/ulogd_output_NACCT.c b/output/ulogd_output_NACCT.c
index 04c5ab1..e989f92 100644
--- a/output/ulogd_output_NACCT.c
+++ b/output/ulogd_output_NACCT.c
@@ -80,12 +80,12 @@ static struct ulogd_key nacct_inp[] = {
 	},
 	/* Assume we're interested more in download than upload */
 	[KEY_RAW_PKTLEN] = {
-		.type	= ULOGD_RET_UINT32,
+		.type	= ULOGD_RET_UINT64,
 		.flags	= ULOGD_RETF_NONE,
 		.name	= "reply.raw.pktlen",
 	},
 	[KEY_RAW_PKTCNT] = {
-		.type	= ULOGD_RET_UINT32,
+		.type	= ULOGD_RET_UINT64,
 		.flags	= ULOGD_RETF_NONE,
 		.name	= "reply.raw.pktcount",
 	},
@@ -127,26 +127,26 @@ nacct_interp(struct ulogd_pluginstance *pi)
 	   'timestamp' value use 'flow.end.sec' */
 	if (ikey_get_u8(&inp[KEY_IP_PROTO]) == IPPROTO_ICMP) {
 		snprintf(buf, sizeof(buf),
-				 "%u\t%u\t%s\t%u\t%s\t%u\t%u\t%u",
+				 "%u\t%u\t%s\t%u\t%s\t%u\t%llu\t%llu",
 				 ikey_get_u32(&inp[KEY_FLOW_END]),
 				 ikey_get_u8(&inp[KEY_IP_PROTO]),
 				 (char *) ikey_get_ptr(&inp[KEY_IP_SADDR]),
 				 ikey_get_u8(&inp[KEY_ICMP_TYPE]),
 				 (char *) ikey_get_ptr(&inp[KEY_IP_DADDR]),
 				 ikey_get_u8(&inp[KEY_ICMP_CODE]),
-				 ikey_get_u32(&inp[KEY_RAW_PKTCNT]),
-				 ikey_get_u32(&inp[KEY_RAW_PKTLEN]));
+				 ikey_get_u64(&inp[KEY_RAW_PKTCNT]),
+				 ikey_get_u64(&inp[KEY_RAW_PKTLEN]));
 	} else {
 		snprintf(buf, sizeof(buf),
-				 "%u\t%u\t%s\t%u\t%s\t%u\t%u\t%u",
+				 "%u\t%u\t%s\t%u\t%s\t%u\t%llu\t%llu",
 				 ikey_get_u32(&inp[KEY_FLOW_END]),
 				 ikey_get_u8(&inp[KEY_IP_PROTO]),
 				 (char *) ikey_get_ptr(&inp[KEY_IP_SADDR]),
 				 ikey_get_u16(&inp[KEY_L4_SPORT]),
 				 (char *) ikey_get_ptr(&inp[KEY_IP_DADDR]),
 				 ikey_get_u16(&inp[KEY_L4_DPORT]),
-				 ikey_get_u32(&inp[KEY_RAW_PKTCNT]),
-				 ikey_get_u32(&inp[KEY_RAW_PKTLEN]));
+				 ikey_get_u64(&inp[KEY_RAW_PKTCNT]),
+				 ikey_get_u64(&inp[KEY_RAW_PKTLEN]));
 	}
 
 	fprintf(priv->of, "%s\n", buf);
diff --git a/util/printflow.c b/util/printflow.c
index 30e622c..7702063 100644
--- a/util/printflow.c
+++ b/util/printflow.c
@@ -73,12 +73,12 @@ struct ulogd_key printflow_keys[FLOW_IDS] = {
 		.name = "orig.l4.dport",
 	},
 	{
-		.type = ULOGD_RET_UINT32,
+		.type = ULOGD_RET_UINT64,
 		.flags = ULOGD_RETF_NONE,
 		.name = "orig.raw.pktlen",
 	},
 	{
-		.type = ULOGD_RET_UINT32,
+		.type = ULOGD_RET_UINT64,
 		.flags = ULOGD_RETF_NONE,
 		.name = "orig.raw.pktcount",
 	},
@@ -108,12 +108,12 @@ struct ulogd_key printflow_keys[FLOW_IDS] = {
 		.name = "reply.l4.dport",
 	},
 	{
-		.type = ULOGD_RET_UINT32,
+		.type = ULOGD_RET_UINT64,
 		.flags = ULOGD_RETF_NONE,
 		.name = "reply.raw.pktlen",
 	},
 	{
-		.type = ULOGD_RET_UINT32,
+		.type = ULOGD_RET_UINT64,
 		.flags = ULOGD_RETF_NONE,
 		.name = "reply.raw.pktcount",
 	},
@@ -205,8 +205,8 @@ int printflow_print(struct ulogd_key *res, char *buf)
 	}
 
 orig_out:
-	pp_print(buf_cur, "PKTS", res, PRINTFLOW_ORIG_RAW_PKTCOUNT, u32);
-	pp_print(buf_cur, "BYTES", res, PRINTFLOW_ORIG_RAW_PKTLEN, u32);
+	pp_print(buf_cur, "PKTS", res, PRINTFLOW_ORIG_RAW_PKTCOUNT, u64);
+	pp_print(buf_cur, "BYTES", res, PRINTFLOW_ORIG_RAW_PKTLEN, u64);
 
 	buf_cur += sprintf(buf_cur, ", REPLY: ");
 
@@ -256,8 +256,8 @@ orig_out:
 	}
 
 reply_out:
-	pp_print(buf_cur, "PKTS", res, PRINTFLOW_REPLY_RAW_PKTCOUNT, u32);
-	pp_print(buf_cur, "BYTES", res, PRINTFLOW_REPLY_RAW_PKTLEN, u32);
+	pp_print(buf_cur, "PKTS", res, PRINTFLOW_REPLY_RAW_PKTCOUNT, u64);
+	pp_print(buf_cur, "BYTES", res, PRINTFLOW_REPLY_RAW_PKTLEN, u64);
 
 	strcat(buf_cur, "\n");
 	return 0;
-- 
1.8.1.2

