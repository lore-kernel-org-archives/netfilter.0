From: Tao Gong <gongtao0607@gmail.com>
Subject: Re: conntrackd inverted NAT address, endianness issue?
Date: Wed, 21 Apr 2021 09:28:42 -0700
Message-ID: <CAOAu+x+mHmTPi0Q9dND7WOaCNTBP0_VvJqTv=8eZOcthv-Lwhg@mail.gmail.com>
References: <CAOAu+xL2ao_r-FK=XYFR3PORvE-E7zLOx0giRGjbB1E5cpUhrw@mail.gmail.com>
 <20210420091853.GA23774@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zJEGe9FciEr5p/3dpcaMymnFX5CRmgADRl7XKgXshDg=;
        b=QnHFV6ssO7JRpPsmeifIAGcr1IqdLAcnS/z7Dxe+7AmLCyHLeewX2dgsDIdFwQ2/4g
         jTcIIFbJZM8TXYhOsidiJ/tlfMqisha2FIcB6hgerlk+kei+DqCi3AnBqbCVbIVCk2sQ
         NSYSmxJ9ei1fXSt+e01AcOeG0xbN3o383wDAkJj1yeNORD2XNWpqpjOzEruU81xY8nSw
         hWafASyTw4FzDGhyqDAnBqiqfgCoebGXzKVUiPO6Vw8t/n3OVV4PKJyecDslVXGENtF7
         i6dtcHsLG+5PtuctDEkqOZ3EDBWBmsnJZKFAZiD+cAYK/p4ToF0rr/j1f13fpzRglRHB
         p3YQ==
In-Reply-To: <20210420091853.GA23774@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo,

Thanks. Just had it tested (x64 -> mips and x64 -> x64). Failover is
working now. Awesome!

On Tue, Apr 20, 2021 at 2:19 AM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> *Message sent from a system outside of UConn.*
>
>
> Hi,
>
> On Mon, Apr 19, 2021 at 01:03:47PM -0700, Tao Gong wrote:
> > Hi,
> >
> > I'm using conntrackd for firewall failovers. When I examine the
> > conntrack table, I found the second firewall (the rule it is syncing
> > to) has inverted natdst (or reply_dst) addresses:
> >
> > Firewall1:
> > ```
> > root@OpenWrt:~# conntrackd -i |grep "66.x.25.6"
> > udp      17 src=172.25.100.137 dst=66.x.25.6 sport=53093 dport=443
> > src=66.x.25.6 dst=76.y.1.128 sport=443 dport=53093 [ASSURED] [active
> > since 7128s]
> > tcp      6 ESTABLISHED src=172.25.100.137 dst=66.x.25.6 sport=58033
> > dport=443 src=66.x.25.6 dst=76.y.1.128 sport=443 dport=58033 [ASSURED]
> > [active since 7129s]
> > ```
> >
> > Firewall2:
> > ```
> > root@OpenWrt2:~# conntrackd -e |grep "66.x.25.6"
> > tcp      6 ESTABLISHED src=172.25.100.137 dst=66.x.25.6 sport=58033
> > dport=443 [ASSURED] [active since 7234s]
> > udp      17 src=172.25.100.137 dst=66.x.25.6 sport=53093 dport=443
> > [ASSURED] [active since 7233s]
> > root@OpenWrt2:~# conntrackd -c
> > root@OpenWrt2:~# conntrackd -i |grep "66.x.25.6"
> > tcp      6 ESTABLISHED src=172.25.100.137 dst=66.x.25.6 sport=58033
> > dport=443 src=66.x.25.6 dst=128.1.y.76 sport=443 dport=58033 [ASSURED]
> > mark=0 [active since 5s]
> > udp      17 src=172.25.100.137 dst=66.x.25.6 sport=53093 dport=443
> > src=66.x.25.6 dst=128.1.y.76 sport=443 dport=53093 [ASSURED] mark=0
> > [active since 5s]
> > ```
> >
> > Note how the second dst (natdst) is inverted. Surely the traffic isn't
> > going through on a failover.
> > Is this an endianness bug in encoding/decoding?
> >
> > Setup: (Yes I'm mixing big and little endians)
> > Firewall1: OpenWrt on a x86_64 (little endian), kernel 4.14.180
> > Firewall2: OpenWrt on a MIPS (big endian), kernel 4.14.209
> > conntrack-tools 1.4.5 for both
>
> It's a bug. Could you try this patch that I'm attaching?



-- 
Best regards,
Tao
