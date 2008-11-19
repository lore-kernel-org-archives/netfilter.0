From: "nfsnfs chen" <nfsnfs@gmail.com>
Subject: I write a module for Dynamic NAT, but it's not working
Date: Wed, 19 Nov 2008 13:35:20 +0800
Message-ID: <59c2e8110811182135u37521024t16bc738a4c45963d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=ChpP3nz8sbWGnmoGJBi8tAbN6Owt8HhqpcArv/qf594=;
        b=TC1YFs3OIxxGGgwEw1TLAeiG7e11RsN0u1aWki9kHmPq93pBuC5pxAe838HOPcsdhl
         HGP+LJDy7BbhRdY7+o1U1G/VeYR0EiA+HJb7RX3+F7of/j786WSpnup7MV0Pg+U8L1LP
         rRiF4p9W8muveYhgi2Bsnl8rLCytdlqBdGSbI=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi all,

I wrote a module for Dynamic NAT.
My modules are hooked in PREROUTING and POSTROUTING.
I try to modify the destination ip address in PREROUTING and the
source ip address in POSTROUTING.

for example,
// PREROUTING
if ( iph->saddr  == MY_DEFINE_IP)
    iph->daddr = MY_HOST1;

// POSTROUTING
if ( iph->daddr == MY_HOST1;
    iph->saddr = MY_LOCAL_IP;

But it seems not working.

First, in ip_forward, because of (skb->pkt_type != PACKET_HOST), the
packet will be dropped.
If I pass the check of skb->pkt_type, the packet do not send either.
Thanks for help!

-- 
Li-Han
nfsnfs@gmail.com
