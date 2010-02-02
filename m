From: akpm@linux-foundation.org
Subject: [patch 1/1] net/ipv4/netfilter/nf_nat_snmp_basic.c: correct the size argument to kzalloc
Date: Tue, 02 Feb 2010 14:44:35 -0800
Message-ID: <201002022244.o12MiZGL019252@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kaber@trash.net
Cc: netfilter@vger.kernel.org, akpm@linux-foundation.org, julia@diku.dk, davem@davemloft.net

From: Julia Lawall <julia@diku.dk>

obj has type struct snmp_object **, not struct snmp_object *.  But indeed
it is not even clear why kmalloc is needed.  The memory is freed by the
end of the function, so the local variable of pointer type should be
sufficient.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@disable sizeof_type_expr@
type T;
T **x;
@@

  x =
  <+...sizeof(
- T
+ *x
  )...+>
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
Cc: Patrick McHardy <kaber@trash.net>
Cc: "David S. Miller" <davem@davemloft.net>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 net/ipv4/netfilter/nf_nat_snmp_basic.c |   31 ++++++++---------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff -puN net/ipv4/netfilter/nf_nat_snmp_basic.c~net-ipv4-correct-the-size-argument-to-kzalloc net/ipv4/netfilter/nf_nat_snmp_basic.c
--- a/net/ipv4/netfilter/nf_nat_snmp_basic.c~net-ipv4-correct-the-size-argument-to-kzalloc
+++ a/net/ipv4/netfilter/nf_nat_snmp_basic.c
@@ -1038,7 +1038,7 @@ static int snmp_parse_mangle(unsigned ch
 	unsigned int cls, con, tag, vers, pdutype;
 	struct asn1_ctx ctx;
 	struct asn1_octstr comm;
-	struct snmp_object **obj;
+	struct snmp_object *obj;
 
 	if (debug > 1)
 		hex_dump(msg, len);
@@ -1148,43 +1148,34 @@ static int snmp_parse_mangle(unsigned ch
 	if (cls != ASN1_UNI || con != ASN1_CON || tag != ASN1_SEQ)
 		return 0;
 
-	obj = kmalloc(sizeof(struct snmp_object), GFP_ATOMIC);
-	if (obj == NULL) {
-		if (net_ratelimit())
-			printk(KERN_WARNING "OOM in bsalg(%d)\n", __LINE__);
-		return 0;
-	}
-
 	while (!asn1_eoc_decode(&ctx, eoc)) {
 		unsigned int i;
 
-		if (!snmp_object_decode(&ctx, obj)) {
-			if (*obj) {
-				kfree((*obj)->id);
-				kfree(*obj);
+		if (!snmp_object_decode(&ctx, &obj)) {
+			if (obj) {
+				kfree(obj->id);
+				kfree(obj);
 			}
-			kfree(obj);
 			return 0;
 		}
 
 		if (debug > 1) {
 			printk(KERN_DEBUG "bsalg: object: ");
-			for (i = 0; i < (*obj)->id_len; i++) {
+			for (i = 0; i < obj->id_len; i++) {
 				if (i > 0)
 					printk(".");
-				printk("%lu", (*obj)->id[i]);
+				printk("%lu", obj->id[i]);
 			}
-			printk(": type=%u\n", (*obj)->type);
+			printk(": type=%u\n", obj->type);
 
 		}
 
-		if ((*obj)->type == SNMP_IPADDR)
+		if (obj->type == SNMP_IPADDR)
 			mangle_address(ctx.begin, ctx.pointer - 4 , map, check);
 
-		kfree((*obj)->id);
-		kfree(*obj);
+		kfree(obj->id);
+		kfree(obj);
 	}
-	kfree(obj);
 
 	if (!asn1_eoc_decode(&ctx, eoc))
 		return 0;
_
