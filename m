From: whiplash <whiplash@bofhland.org>
Subject: Re: Iptables and voip (sip) traffic
Date: Sat, 10 Apr 2010 20:01:23 +0200
Message-ID: <4BC0BCF3.5080302@bofhland.org>
References: <o2m596a60ad1004090653r8d00d435wfa96256b847dece8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <o2m596a60ad1004090653r8d00d435wfa96256b847dece8@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Indrek Paas ha scritto:
> Hi,
> 
> I have searched information about iptables and Sip protocol used for
> Voip calls. I remember that this particular protocol had problems
> passing firewalls which were configured to use NAT. 
[...]
> And voip service provider claims that the Linux router should be
> switched to their Thompson device. Because iptables "interferes with
> their service". So any help and information is greatly appreciated.

Linux kernel already has two modules for handling natting and conntracking
of SIP protocol, nf_nat_sip and nf_conntrack_sip; your VoIP service
provider is trying to sell you something you don't really need, possibly.

HTH.
