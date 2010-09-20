From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Basic Routing
Date: Tue, 21 Sep 2010 01:41:37 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009210128170.14400@obet.zrqbmnf.qr>
References: <490DD23F.7060406@amfes.com> <49119087.5060307@thehaxbys.co.uk> <4911D85E.2080109@riverviewtech.net> <4C97D4B6.2000609@amfes.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C97D4B6.2000609@amfes.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Daniel L. Miller" <dmiller@amfes.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


On Monday 2010-09-20 23:40, Daniel L. Miller wrote:
>
> Given the specific architecture:
> Windows Workstation 192.168.5.100, default gateway 192.168.5.1
> Linux Gateway/Router/VPN node 192.168.7.2, 192.168.5.1, 192.168.0.90, default
> gateway 192.168.7.1
> DSL Modem 192.168.7.1
>
> Linux Server/Router/VPN server/Virtual Server 192.168.0.71, 192.168.56.1,
> default gateway 192.168.0.1
> Virtual Machine 192.168.56.20, default gateway 192.168.56.1

graph {
	windows -- lxgateway;
	lxgateway -- dsl;
	lxgateway -- vserver;
	vserser -- vm;
};

>
> What is the "easiest" way of "achieving routing" between the Windows
> Workstation and the Virtual Machine?  Is this an instance where NAT would make
> administration simpler instead of "pure" routing?  The cumbersome-but-working
> method I have employed at the moment includes;

NAT wouldn't fix anything.

> add 192.168.56.0/24 via 192.168.0.71 route to Workstation
> add 192.168.56.0/24 via 192.168.0.71 route to Linux Gateway
> add 192.168.5.0/24 via 192.168.0.90 route to Linux Server

That won't work because
- 192.168.0.71/32 is a nonexisting route on Workstation (at least I
  suppose that this is the case currently)
- 56.0/24 via 0.71 is redundant because you've got a default route
  through lxgateway anyway
- You don't really need the .0.0/24.

Do:

lxgateway:
- addr: 192.168.5.1/24 dev ethwork
- addr: 192.168.5.1/32 dev ethvserver
- route: 192.168.5.0/24 dev ethwork (automatic)
- route: 192.168.56.1/32 dev ethvserver
- route: 192.168.56.0/24 via 192.168.56.1
Workstation:
- addr: 192.168.5.X/24 dev eth0
- route: default via 192.168.5.1
vserver:
- addr: 192.168.56.1/24 dev ethvms
- addr: 192.168.56.1/32 dev ethmain
- route: 192.168.56.0/24 dev ethvms (automatic)
- route: 192.168.5.1/32 dev ethmain
- route: default via 192.168.5.1
vms:
- addr: 192.168.56.X/24 dev eth0
- route: default via 192.168.56.1

> I almost understand the need for the 192.168.5.0/24 entry on the
> Linux Server side - because otherwise the router doesn't know how
> to reply, and the same goes for the 192.168.56.0/24 entry on the
> Gateway side - otherwise the Gateway doesn't know how to reach that
> subnet in the first place. But, if the Gateway is defined as the
> default for the Workstation, why is a routing entry required for
> the Workstation?

It is in fact not required.
