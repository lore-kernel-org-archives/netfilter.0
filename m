From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: WARNING: "ipt_unregister_match"
Date: Sat, 7 Apr 2007 20:45:28 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704072045130.22181@yvahk01.tjqt.qr>
References: <8d158e1f0704070955x2bb50060ueb8d2c0b91acba00@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8d158e1f0704070955x2bb50060ueb8d2c0b91acba00@mail.gmail.com>
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
To: Patrick Ale <patrick.ale@gmail.com>
Cc: netfilter@lists.netfilter.org


On Apr 7 2007 18:55, Patrick Ale wrote:
> Hello! :)

> I am getting the following error when using linux-2.6.21 or any resent git
> tree:
> WARNING: "ipt_unregister_match" [net/ipv4/netfilter/ipt_connlimit.ko]
> undefined!
>
> I searched google a bit, and I see I am not the only one.
> Only problem is I can't really find someone smashing the hammer as of
> how I can fix this error :)
>
> Any help would be appriciated!

Index: linux-2.6.21-rc5/net/ipv4/netfilter/ipt_connlimit.c
===================================================================
--- linux-2.6.21-rc5.orig/net/ipv4/netfilter/ipt_connlimit.c
+++ linux-2.6.21-rc5/net/ipv4/netfilter/ipt_connlimit.c
@@ -291,8 +291,9 @@ static void destroy(
 	kfree(info->data);
 }
 
-static struct ipt_match connlimit_match = { 
+static struct xt_match connlimit_match = {
 	.name		= "connlimit",
+	.family		= AF_INET,
 	.match		= &match,
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
 	.matchsize	= sizeof(struct ipt_connlimit_info),
@@ -304,12 +305,12 @@ static struct ipt_match connlimit_match 
 
 static int __init init(void)
 {
-	return ipt_register_match(&connlimit_match);
+	return xt_register_match(&connlimit_match);
 }
 
 static void __exit fini(void)
 {
-	ipt_unregister_match(&connlimit_match);
+	xt_unregister_match(&connlimit_match);
 }
 
 module_init(init);

