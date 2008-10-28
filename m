From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH 7/7] netns ebtables: br_nf_pre_routing_finish() fixup
Date: Wed, 29 Oct 2008 00:02:28 +0300
Message-ID: <20081028210228.GI15660@x200.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:mime-version:content-type:content-disposition:user-agent;
        bh=wjGTXXQOlQB++ivBWsUGTy8vTIEwjNUao03+xl0Z9yc=;
        b=iTytJngjIOzkR8thuU0i60mQhIttrl2FGWlfTg2pAtq9eQK+vcVAYdtUUR50H0+j7/
         LjLgisYMX9OkPMpQKnivuD6/pzH+ArRcE72vE1tCACZKL9uSjvtBjhJ3H18ICkDRe/ON
         /NlI2+8c3vbMrBIddqxbeFle237LZPAPKVAQI=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kaber@trash.net
Cc: netfilter@vger.kernel.org, containers@osdl.org

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 net/bridge/br_netfilter.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/net/bridge/br_netfilter.c
+++ b/net/bridge/br_netfilter.c
@@ -357,7 +357,7 @@ static int br_nf_pre_routing_finish(struct sk_buff *skb)
 			if (err != -EHOSTUNREACH || !in_dev || IN_DEV_FORWARD(in_dev))
 				goto free_skb;
 
-			if (!ip_route_output_key(&init_net, &rt, &fl)) {
+			if (!ip_route_output_key(dev_net(dev), &rt, &fl)) {
 				/* - Bridged-and-DNAT'ed traffic doesn't
 				 *   require ip_forwarding. */
 				if (((struct dst_entry *)rt)->dev == dev) {
