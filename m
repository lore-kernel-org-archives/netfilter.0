From: Kevin Darbyshire-Bryant <kevin@darbyshire-bryant.me.uk>
Subject: Advice please: de-masquerading from a qdisc?
Date: Thu, 30 Jun 2016 09:23:24 +0100
Message-ID: <5774D6FC.9030900@darbyshire-bryant.me.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darbyshire-bryant.me.uk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Wlc1Es316QwxvEJfqKoH2zbspQ8Sc6ciJc7XSRTsNtM=;
 b=f4mnzNgo16w5PyC4JGxqWTb6DfUn2RlyKoOvWjl6AsmQNQRHQu+CEHmCjl98qrDlgKm5QwTPoysa3KvYHDTLJPMPK+7/Ee1tdlqU2Hk8iZdOZDjrojn/mzgIdKp4kaWWNOqzfDi129iTYrId/nlsauds/zPukBuziSimj9nRqaE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello All,

First post and I'm very much in a position of not knowing what I don't 
know, so be relatively gentle if you can

So, the basic question first:  Is it possible to access the NAT tables 
to de-masquerade a packet from a qdisc?

Longer question/background:  I'm slightly involved in a qdisc AQM 
project (cake) that amongst other things has 'per host' flow grouping 
modes.  Typically 2 qdiscs are instantiated, one on the WAN interface 
for egress traffic and another on a WAN IFB interface for ingress.  This 
is all fine for IPv6, but in typical usage where IPv4 masquerading is 
involved, the only host the ingress qdisc sees is the router's public 
IPv4.  Similarly the egress qdisc doesn't see the internal LAN addresses 
as it's all post NAT.

All I have in the qdisc is the skb...and it looks like the pointer to 
the nfct structure can help me but.....I'm really at the starting end of 
a learning vertical cliff.  Where should I start reading? Can anyone 
offer any pointers?

Thanks for your time,

Kevin
