From: Jarek Poplawski <jarkao2@gmail.com>
Subject: Re: problem with IPoA (CLIP),  NAT, and VLANS
Date: Wed, 18 Feb 2009 00:12:55 +0100
Message-ID: <20090217231255.GA3389@ami.dom.local>
References: <499AB345.3070904@hiramoto.org>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=hPhsHmJKiNjYf9+ajtswC6G1mrUtxRNK+FRaWIvCPmQ=;
        b=YomZi89pfSbGHXi/oMoOcB7yAuVPR0Nx0aGsZbJhsORRZNeN4ViqaUuw9A5eGz10w0
         RicHtDGZ/iLmr1S9W8aTHc5xWIW0eBByyhmRTXBOppyndNKURDwM2CuiEh27B9HwFE3F
         EcQBQg1gYyBNcEEFbq9oG7feBmtzDmJN1d9+E=
Content-Disposition: inline
In-Reply-To: <499AB345.3070904@hiramoto.org>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karl Hiramoto <karl@hiramoto.org>
Cc: netdev@vger.kernel.org, netfilter@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Karl Hiramoto wrote, On 02/17/2009 01:53 PM:

> Jarek Poplawski wrote:
>> On Tue, Feb 17, 2009 at 12:49:07PM +0100, Karl Hiramoto wrote:
>> ...
>>   
>>> A side note:  so far the original patch i sent works in all cases i have
>>> tested, but fails with tcpdump.   I suspect its because the skb gets cloned.
>>>     
>> If there is something readable from this tcpdump, it should be helpful
>> to see a packet for working and non-working case during such ping
>> (with -nXX option).
>> Jarek P.
>>   
> 
> Note:  I have the patches i sent applied,  plus the  "skb->mac_header -=
> VLAN_HLEN;"   patch from Jarek on 2.6.28.4
> 
> Doing a tcpdump simultaneously  on the atm and eth0.1 on the linux router.

Nice job. Since tcpdump sees corrupted data, and we don't know if it's
before or after hitting the driver I'd suggest to try full skb_copy()
yet. So could you try if with your patch + the patch below tcpdump
still breaks these things?

BTW, I wonder what IXP400 config options do you use (especially
CONFIG_IXP400_ETH_SKB_RECYCLE)?

Jarek P.

--- patch #3 (for debugging only)

 net/core/dev.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index a17e006..b822a5d 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -1346,7 +1346,7 @@ static void dev_queue_xmit_nit(struct sk_buff *skb, struct net_device *dev)
 		if ((ptype->dev == dev || !ptype->dev) &&
 		    (ptype->af_packet_priv == NULL ||
 		     (struct sock *)ptype->af_packet_priv != skb->sk)) {
-			struct sk_buff *skb2= skb_clone(skb, GFP_ATOMIC);
+			struct sk_buff *skb2= skb_copy(skb, GFP_ATOMIC);
 			if (!skb2)
 				break;
 
