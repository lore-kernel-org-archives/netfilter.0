From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Cloning Traffic had having it processed by two different hosts
 - TEE
Date: Wed, 23 Apr 2008 17:07:11 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804231643000.13697@fbirervta.pbzchgretzou.qr>
References: <480F2A96.3020603@rz.uni-karlsruhe.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480F2A96.3020603@rz.uni-karlsruhe.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjoern Weiland <bjoern.weiland@rz.uni-karlsruhe.de>
Cc: netfilter@vger.kernel.org


On Wednesday 2008-04-23 14:24, Bjoern Weiland wrote:

> Hey list,
>
> here's what I need to do: Our central routers all export cisco
> netflow data. This data is being sent to HOST A where it is
> processed. Now for some researching, I also need this data on HOST
> B for another kind of processing. So what I want to do is to clone
> the traffic arriving at HOST A. One copy should be processed by
> HOST A as usual and the copy needs to be sent to HOST B. As we do
> not only want to passively monitor this traffic, but really work
> with it, the copied traffic also needs to be rewritten with HOST
> B's IP address in the netflow data's Headers.

Use the RAW(S|D)NAT target for rewriting the address. It is available
in the RAWNAT branch of the git repo.

The teed packet however does not cross iptables on the machine it is
teed due to ... limitations in ip_tables, not because there could 
possible be some infinite recursion, so you would need to RAWNAT on a 
different machine.

> No here's the question: How do I best do this? I read and tried to
> work with the tee target of patch-o-matic-ng's extra repository,
> but apparently it is not working any longer on recent kernels.

I don't see any tee target in pom (= dead horse) anyway.

> Also
> I do have massive problems getting xtables-addons to compile on my
> Debian (I actually tried more than one machine and different gcc's
> and kernels) and there seems to be no documentation or mailinglist.
> Has anyone tried xtables-addons at Debian? If yes, which gcc,
> kernel, xtables version?

Mh, I used 2.6.18.0 for compile testing; there is a patch in 2.6.18.5 
that changed ip_route_me_harder :-/
Will fix.
