From: "Oscar N" <oscar@linnea.net>
Subject: Re: Using iptables for configuring VRF
Date: Mon, 1 Dec 2008 13:23:14 +0100 (CET)
Message-ID: <49087.78.69.147.241.1228134194.squirrel@mh.linnea.com>
References: <ABDEBDCB7615474A9DFC1D52A19A6B6301D29383@GRPGEPWMX0011.grptop.net>
Reply-To: oscar@linnea.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ABDEBDCB7615474A9DFC1D52A19A6B6301D29383@GRPGEPWMX0011.grptop.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I've not looked into any vrf-patch but you can use use multiple routing
tables in linux. And in iptables you can specify incoming and outgoing
interfaces so what you want to do is possible but maybe not exactly as
easy to configure as a cisco router.

/Regards Oscar

> Hi,
> I would like to know if extensions for VRF (Virtual Router Forwarding )
> are available in any iptables release.
> I gave a look in netfilter site but I was not able to find out anything
> related.
> Really applying a vrf-patch to a kernel Linux 2.6-18, a new file
> /net/ipv4/netfilter/ipt_vrf.c has been added, that's why I supposed that
> a
> New iptables extension could be available to configure this feature.
>
> Can anyone help me?
>
> Thanks in advance.
>
> Monia
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


