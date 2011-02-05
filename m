From: Andrew Beverley <andy@andybev.com>
Subject: Re: How can I test my tc script?
Date: Sat, 05 Feb 2011 12:27:05 +0000
Message-ID: <1296908825.1695.8.camel@andybev>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <1296761916.7587.29.camel@andybev>
	 <1296873898.3644.4.camel@debian-laptop.OptimumWireless>
	 <1296886030.4568.6.camel@debian-laptop.OptimumWireless>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1296908829; bh=bQPiKnZGSw3oGwj64ahe3cFHu8JxjMv4QPAJV
	9agIBg=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=WOlOya1Z
	Lb2FshT7lxeN5rYfqpyqa3xgN3JD9enL9uqnl0u1ZBMHhE1ob88I+hLTy172HFwGOb6
	K2VH9KSujPJAWaGkq17zwHZZ3TgjvTfTpbEkAt/TNZBX67QHQ5D5VtfM2VRHK3GcSmN
	k6bCBd0mHEPXf65XraXk7iXXnvaGg=
In-Reply-To: <1296886030.4568.6.camel@debian-laptop.OptimumWireless>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wilson@optimumwireless.com
Cc: netfilter@vger.kernel.org

On Sat, 2011-02-05 at 02:07 -0400, Optimum Wireless Services wrote:
> Now, for the upload I cant get it shape with squid running in the
> middle. If I remove squid then, traffic shaping works ok.
> 

If you are doing egress shaping on the internet facing interface for the
upload (which I assume you are - you can't use HTB on ingress), then it
will not work for Squid. That's because Squid's traffic leaving the
server is coming from the server's IP address, not from the client's IP
address (Squid is generating the traffic, not the client). Therefore,
your filter will never match the traffic. Normal traffic from a client
is forwarded and retains its source IP address.

One way to shape Squid traffic per client source IP address would be to
mark the packets that are coming in from the local network (as you were
doing before) and then use Squid's mark preservation feature to retain
the packet's mark. However, you can't use U32 classifiers - you'll have
to go back to marking packets.

> Andy recommended to use ifb but, I don't know where to get the download
> from. Is supposed to be on kernel 2.26.20 and up and I'm running a
> kernel that "qualifies" but, cant really get ifb to do anything.

No need for IFB in your case. That's only if you want to shape multiple
interfaces within one qdisc.

Andy


