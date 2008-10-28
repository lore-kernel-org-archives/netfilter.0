From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH] netns-aware ipt_addrtype
Date: Tue, 28 Oct 2008 23:53:17 +0300
Message-ID: <20081028205317.GA15660@x200.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:mime-version:content-type:content-disposition:user-agent;
        bh=e+HZwOxWj1Trvk9EbijkEGUvVsa94s3C94XqCCH3m4Y=;
        b=sUsWTFX1ZztfWIcge9zhs/xrF5RADmOdQY3dw6M01K0343mi92raxAJd2DTJ8K5BO9
         v1PBEipvrS0FIQOmWj8N8vUEaNSA6z1BLw/4mByMFk3jyVgLJVQUXvi4EYG+G/mdprq5
         FT+htw/S5//mrCL81Ul/2bDSe0MEL3TmdyCVM=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kaber@trash.net
Cc: netfilter@vger.kernel.org, containters@osdl.org

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 net/ipv4/netfilter/ipt_addrtype.c |   16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

--- a/net/ipv4/netfilter/ipt_addrtype.c
+++ b/net/ipv4/netfilter/ipt_addrtype.c
@@ -23,24 +23,25 @@ MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Patrick McHardy <kaber@trash.net>");
 MODULE_DESCRIPTION("Xtables: address type match for IPv4");
 
-static inline bool match_type(const struct net_device *dev, __be32 addr,
-			      u_int16_t mask)
+static inline bool match_type(struct net *net, const struct net_device *dev,
+			      __be32 addr, u_int16_t mask)
 {
-	return !!(mask & (1 << inet_dev_addr_type(&init_net, dev, addr)));
+	return !!(mask & (1 << inet_dev_addr_type(net, dev, addr)));
 }
 
 static bool
 addrtype_mt_v0(const struct sk_buff *skb, const struct xt_match_param *par)
 {
+	struct net *net = dev_net(par->in ? par->in : par->out);
 	const struct ipt_addrtype_info *info = par->matchinfo;
 	const struct iphdr *iph = ip_hdr(skb);
 	bool ret = true;
 
 	if (info->source)
-		ret &= match_type(NULL, iph->saddr, info->source) ^
+		ret &= match_type(net, NULL, iph->saddr, info->source) ^
 		       info->invert_source;
 	if (info->dest)
-		ret &= match_type(NULL, iph->daddr, info->dest) ^
+		ret &= match_type(net, NULL, iph->daddr, info->dest) ^
 		       info->invert_dest;
 
 	return ret;
@@ -49,6 +50,7 @@ addrtype_mt_v0(const struct sk_buff *skb, const struct xt_match_param *par)
 static bool
 addrtype_mt_v1(const struct sk_buff *skb, const struct xt_match_param *par)
 {
+	struct net *net = dev_net(par->in ? par->in : par->out);
 	const struct ipt_addrtype_info_v1 *info = par->matchinfo;
 	const struct iphdr *iph = ip_hdr(skb);
 	const struct net_device *dev = NULL;
@@ -60,10 +62,10 @@ addrtype_mt_v1(const struct sk_buff *skb, const struct xt_match_param *par)
 		dev = par->out;
 
 	if (info->source)
-		ret &= match_type(dev, iph->saddr, info->source) ^
+		ret &= match_type(net, dev, iph->saddr, info->source) ^
 		       (info->flags & IPT_ADDRTYPE_INVERT_SOURCE);
 	if (ret && info->dest)
-		ret &= match_type(dev, iph->daddr, info->dest) ^
+		ret &= match_type(net, dev, iph->daddr, info->dest) ^
 		       !!(info->flags & IPT_ADDRTYPE_INVERT_DEST);
 	return ret;
 }
