From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: High accuracy bandwidth accounting?
Date: Sat, 14 May 2011 11:48:27 +0200
Message-ID: <20110514114827.768b985d@catus>
References: <4DC7F632.9020105@wildgooses.com>
	<4DC8775D.1080007@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DC8775D.1080007@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ed W <lists@wildgooses.com>
Cc: Netfilter <netfilter@vger.kernel.org>

Hi,

Firstly I'd like to say you have an interesting use case.

>An example seems to be to cause a name lookup via dnsmasq. For whatever
>reason this does two simultaneous dns requests to both configured dns
>servers.  One reply comes back slightly quicker than the other and the
>slower reply appears to cause a local ICMP unreachable response to be
>generated.  Everything is logged *except* the data for the ICMP
>unreachable response?

You should consider disabling icmp responses:
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all

... and/or limiting/disabling unreachable responses:
echo 1 > /proc/sys/net/ipv4/icmp_ratelimit

Agressive ratelimiting will cause your router as a hop in traceroute to
show near 100% loss, but other then that you'll save bandwidth.

Best regards,
Marek Kierdelewicz
