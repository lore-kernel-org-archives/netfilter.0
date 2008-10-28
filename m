From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH] arptable_filter: merge forward hook
Date: Tue, 28 Oct 2008 23:54:06 +0300
Message-ID: <20081028205406.GB15660@x200.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:mime-version:content-type:content-disposition:user-agent;
        bh=yMmJujCx402G8cPXhA9K4OxnAQn4jk/2IukOd84PZu8=;
        b=Mi9qn2mTIO10eZwvIELOrAR5ifVR+hNuClFGcJ98bMdAG7siJlcf/V4uojda6iv/Rt
         GJ4ck69//64qBkSJRUwQgLBSYGkIHFICalrzs3uJjQPC3olX2MU4gqxMzb4mLOpCXvvv
         +V9DS5P1aKqRsD2vs8EKnvDxSGYHVKch33nUc=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kaber@trash.net
Cc: netfilter@vger.kernel.org, containters@osdl.org

It's identical to NF_ARP_IN hook.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 net/ipv4/netfilter/arptable_filter.c |   12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

--- a/net/ipv4/netfilter/arptable_filter.c
+++ b/net/ipv4/netfilter/arptable_filter.c
@@ -75,16 +75,6 @@ static unsigned int arpt_out_hook(unsigned int hook,
 			     dev_net(out)->ipv4.arptable_filter);
 }
 
-static unsigned int arpt_forward_hook(unsigned int hook,
-				      struct sk_buff *skb,
-				      const struct net_device *in,
-				      const struct net_device *out,
-				      int (*okfn)(struct sk_buff *))
-{
-	return arpt_do_table(skb, hook, in, out,
-			     dev_net(in)->ipv4.arptable_filter);
-}
-
 static struct nf_hook_ops arpt_ops[] __read_mostly = {
 	{
 		.hook		= arpt_in_hook,
@@ -101,7 +91,7 @@ static struct nf_hook_ops arpt_ops[] __read_mostly = {
 		.priority	= NF_IP_PRI_FILTER,
 	},
 	{
-		.hook		= arpt_forward_hook,
+		.hook		= arpt_in_hook,
 		.owner		= THIS_MODULE,
 		.pf		= NFPROTO_ARP,
 		.hooknum	= NF_ARP_FORWARD,
