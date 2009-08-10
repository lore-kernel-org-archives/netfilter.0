From: jacob@internet24.de
Subject: Re: types of NAT with netfilter
Date: Mon, 10 Aug 2009 10:04:14 +0200
Message-ID: <20090810100414.tvzzocw9cc8gk8os@webmail.config-server.de>
References: <cfeab66d0908070422i40b6efb9x901d3d839a6fee03@mail.gmail.com>
	<1249647001.29388.25.camel@enterprise.ims-firmen.de>
	<cfeab66d0908070819p66d977beo7ae1a0276c1487ff@mail.gmail.com>
	<20090809115700.GA4861@internet24.de>
	<cfeab66d0908092339t79159d12m446dbffa4ec025ac@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d0908092339t79159d12m446dbffa4ec025ac@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

Quoting ratheesh k <ratheesh.ksz@gmail.com>:

> Thomas ,
>  Thanks a ton for ur quick response .
>
> windows stunc show its is a port restricted nat ......Is it correct
> ???? How do i know if its a portrestricted or symmetric ........???

Harald Welte also answered this question some years back:

http://lists.netfilter.org/pipermail/netfilter-devel/2005-October/021956.html

And he should know ;)

I don't know what Windows STUNC is, but presumably it includes
some sort of NAT type detection, which might simply not work
correctly in all cases. Not being able to correctly classify iptables
NATs might be a bit of a drawback though, as it is the core
of so many consumer router boxes.

