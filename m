From: "Rafael David Tinoco" <rafaeldtinoco@ubuntu.com>
Subject: Re: NFULNL_CFG_F_CONNTRACK and IPv6
Date: Tue, 12 Jan 2021 18:33:17 -0300
Message-ID: <c5e18f0f-05fd-4092-8e58-de5a190a90d5@www.fastmail.com>
References: <57c4adaf-69c0-4135-a89c-095ed4785d22@www.fastmail.com>
 <20210112165713.GE19605@breakpoint.cc>
 <f91bd38d-efc6-450b-9cbc-7968a731158f@www.fastmail.com>
 <20210112174158.GF19605@breakpoint.cc>
 <329975d1-91a4-4db9-aa6b-ff1244b08e26@www.fastmail.com>
 <20210112183603.GG19605@breakpoint.cc>
 <836936e3-b1ba-4605-a405-89152edfd7e2@www.fastmail.com>
 <20210112192650.GH19605@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20210112192650.GH19605@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org, Ken-ichirou MATSUZAWA <chamaken@gmail.com>, Pablo Neira Ayuso <pablo@netfilter.org>

> > which kernel are you running Florian?
> 
> 5.10.5 stable.  I can check Fedora tomorrow, I don't have classic
> iptables there at the moment.
>

NM Florian,

My code was returning -1 on a callback function, disabling the polling for the netlink socket file descriptor. I had it fixed:

 TCPv6 [  0] src = fe80::5054:ff:fecc:767d (port=1024) to dst = fe80::5054:ff:fecc:767d (port=22) (confirmed)
        table: raw, chain: PREROUTING, type: rule, position: 1

and it is working fine now.

Thanks a lot for your support today, checking things for me, really appreciate!

Best,

-rafaeldtinoco
