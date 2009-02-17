From: Jarek Poplawski <jarkao2@gmail.com>
Subject: [PATCH v2] Re: problem with IPoA (CLIP),  NAT, and VLANS
Date: Tue, 17 Feb 2009 09:39:08 +0000
Message-ID: <20090217093908.GB5341@ff.dom.local>
References: <20090216232016.GA4803@ami.dom.local> <499A7D7D.1090607@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:references:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=QNTlS0K5dC55Z5c1IL3NLuVOxXVprs5jPItckO3Jed4=;
        b=NvtwGZZe1j1Or7FxmVocD0ah2nl1n9V5mqqXdyijTZQB0josBPBLkVxXk1ESHh7rfW
         ax84jCDxvjmYRr0KG68epHSoeBNSNglvH9S2Po06cjply6bFnCMPEJ1il0jXem+m/dmM
         uhxAMQQH7w1F6hQCD/ZapyYtumfGbS79zSBf8=
Content-Disposition: inline
In-Reply-To: <499A7D7D.1090607@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: Karl Hiramoto <karl@hiramoto.org>, netdev@vger.kernel.org, netfilter@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Miller <davem@davemloft.net>

Sorry:
-----------------> take 2: changelog fix only

vlan: Update skb->mac_header in __vlan_put_tag().

After moving mac addresses in __vlan_put_tag() skb->mac_header needs
to be updated.

Reported-by: Karl Hiramoto <karl@hiramoto.org>
Signed-off-by: Jarek Poplawski <jarkao2@gmail.com>
---

 include/linux/if_vlan.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/linux/if_vlan.h b/include/linux/if_vlan.h
index f8ff918..e1ff5b1 100644
--- a/include/linux/if_vlan.h
+++ b/include/linux/if_vlan.h
@@ -210,6 +210,7 @@ static inline struct sk_buff *__vlan_put_tag(struct sk_buff *skb, u16 vlan_tci)
 
 	/* Move the mac addresses to the beginning of the new header. */
 	memmove(skb->data, skb->data + VLAN_HLEN, 2 * VLAN_ETH_ALEN);
+	skb->mac_header -= VLAN_HLEN;
 
 	/* first, the ethernet type */
 	veth->h_vlan_proto = htons(ETH_P_8021Q);

