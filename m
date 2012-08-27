From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: ssh configuration issue / doubt
Date: Mon, 27 Aug 2012 22:43:37 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1208272238410.17244@aurora.sdinet.de>
References: <CAP7y58OmPxEPRR=73BFwChc2t=08VFuqNffTJzmqnON4yRoajQ@mail.gmail.com> <CAJygYd3GoRsBcnsaFF5zetwap+fRyU=O+bUwuPr=6mcj7KNsqw@mail.gmail.com> <CAP7y58NdZtxxce_QW4VmMYi8v7hYfYANFjutW9VuJ2a23DW8Kw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAP7y58NdZtxxce_QW4VmMYi8v7hYfYANFjutW9VuJ2a23DW8Kw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Net Warrior <netwarrior863@gmail.com>
Cc: =?GB2312?B?0rbT6rfJ?= <sunyucong@gmail.com>, netfilter@vger.kernel.org

On Mon, 27 Aug 2012, Net Warrior wrote:

> This is what I-ve got
> 
> Chain INPUT (policy DROP)
> target     prot opt source               destination
> ACCEPT     all  --  127.0.0.1            0.0.0.0/0
> ACCEPT     icmp --  0.0.0.0/0            xxx        icmp type 8 state
> NEW,RELATED,ESTABLISHED
> ACCEPT     icmp --  0.0.0.0/0            xxx        icmp type 0 state
> RELATED,ESTABLISHED
> ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
> spts:1024:65535 dpt:22 state NEW,RELATED,ESTABLISHED
> ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
> spts:1024:65535 dpts:2370:2371 state NEW,RELATED,ESTABLISHED
> ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
> spts:1024:65535 dpt:1521 state NEW,RELATED,ESTABLISHED
> ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
> spts:1024:65535 dpt:5901 state NEW,RELATED,ESTABLISHED
> ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
> spts:1024:65535 dpts:9006:9007 state NEW,RELATED,ESTABLISHED
> ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
> spts:1024:65535 dpt:21 state NEW,RELATED,ESTABLISHED
> ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
> spts:1024:65535 dpt:20 state NEW,RELATED,ESTABLISHED
> ACCEPT     udp  --  0.0.0.0/0            xxx        udp
> spts:1024:65535 dpts:67:68
> ACCEPT     udp  --  0.0.0.0/0            xxx        udp spt:53 dpts:1024:65535
> ACCEPT     udp  --  0.0.0.0/0            xxx        udp spt:53 dpt:53

You are missing a rule allowing answers to outgoing connections back in.

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

as the first rule.

(You have something like this, but only for icmp type 0)

Then you should also be able to remove the last two --sport 53 udp 
rules, which I think you're using for dns answers.

> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     all  --  127.0.0.1            0.0.0.0/0
> ACCEPT     icmp --  xxx         0.0.0.0/0           icmp type 0 state
> RELATED,ESTABLISHED
> ACCEPT     icmp --  xxx         0.0.0.0/0           icmp type 8 state
> NEW,RELATED,ESTABLISHED
> ACCEPT     udp  --  xxx         0.0.0.0/0           udp spts:1024:65535 dpt:53
> ACCEPT     udp  --  xxx         0.0.0.0/0           udp spt:53 dpt:53

As OUTPUT is policy ACCEPT you don't need any of these rules.

If you want to make it explicit use something like

iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

as the first rule.

c'ya
sven-haegar

-- 
Three may keep a secret, if two of them are dead.
- Ben F.
