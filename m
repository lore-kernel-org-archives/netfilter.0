From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: [PATCH 6/7] ipt_time compile fix for 2.6.21
Date: Sat, 7 Apr 2007 20:50:22 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704072050120.22181@yvahk01.tjqt.qr>
References: <8d158e1f0704070955x2bb50060ueb8d2c0b91acba00@mail.gmail.com>
	<Pine.LNX.4.61.0704072045320.22181@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0704072045320.22181@yvahk01.tjqt.qr>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


Fix compilation of ipt_time.

Signed-off-by: Jan Engelhardt <jengelh@gmx.de>

Index: linux-2.6.21-rc5/net/ipv4/netfilter/ipt_time.c
===================================================================
--- linux-2.6.21-rc5.orig/net/ipv4/netfilter/ipt_time.c
+++ linux-2.6.21-rc5/net/ipv4/netfilter/ipt_time.c
@@ -97,7 +97,6 @@ checkentry(const char *tablename,
             const struct xt_match *match,
 #endif
            void *matchinfo,
-           unsigned int matchsize,
            unsigned int hook_mask)
 {
 	struct ipt_time_info *info = matchinfo;   /* match info for rule */
@@ -127,9 +126,10 @@ checkentry(const char *tablename,
 	return 1;
 }
 
-static struct ipt_match time_match = {
+static struct xt_match time_match = {
 	.name		= "time",
 	.match		= &match,
+	.family		= AF_INET,
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
 	.matchsize      = sizeof(struct ipt_time_info),
 #endif
@@ -140,12 +140,12 @@ static struct ipt_match time_match = {
 static int __init init(void)
 {
 	printk("ipt_time loading\n");
-	return ipt_register_match(&time_match);
+	return xt_register_match(&time_match);
 }
 
 static void __exit fini(void)
 {
-	ipt_unregister_match(&time_match);
+	xt_unregister_match(&time_match);
 	printk("ipt_time unloaded\n");
 }
 

