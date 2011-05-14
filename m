From: Andrew Beverley <andy@andybev.com>
Subject: Re: High accuracy bandwidth accounting?
Date: Sat, 14 May 2011 17:29:03 +0100
Message-ID: <1305390543.1921.705.camel@andybev-desktop>
References: <4DC7F632.9020105@wildgooses.com>
	 <4DC8775D.1080007@wildgooses.com>
	 <1305365024.1921.475.camel@andybev-desktop>
	 <4DCE8540.4060909@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1305390543; bh=xIxdES9gQM9i2V453o8HV5UeHzU0sr4BHOhbx
	OoaeL8=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=rnPis6ej
	r8gf6JvJzNnQf0ePLA6A/4Xb6mwsFiSlEQHk0yDynDipQzuTJ3qY0EGqH2/ksYr3qaU
	f18aSyFVv00ShmZhr6Y8E7/V5seiiiaYjJp36MpuuBrvOtKvTt26DB3fJ3hH66RnzLz
	1Zcb4KApmtBOY4BTWbO6uAnh62U3U=
In-Reply-To: <4DCE8540.4060909@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ed W <lists@wildgooses.com>
Cc: Netfilter <netfilter@vger.kernel.org>

On Sat, 2011-05-14 at 14:36 +0100, Ed W wrote:
> >>
> >> So tcpdump gives me (note sizes are payload, add 28 to compare with conntrack):
> >>
> >> 22:23:41.014217 IP 10.141.36.76 > 8.8.8.8: ICMP 10.141.36.76 udp port 25630 unreachable, length 214
> >>
> >>
> > 
> > Have you tried investigating whether the ICMP packets in question are
> > making it into any of the conntrack system? Maybe by using the userspace
> > program, or my using the conntrack match extension in iptables?
> 
> I think that these UDP packets are completely missing the entire
> conntrack system?
> 

Okay, I've played around with this myself using a similar scenario. It
looks to me like the packets *are* making it into the conntrack system.

I tried setting a LOG target to match those packets with a ctstate of
RELATED:

iptables -A INPUT -p ICMP -m conntrack --ctstate RELATED -j LOG

And they were indeed logged. But there was no visibility of them using
the conntrack userspace program. This says to me that conntrack does
know about them, but it doesn't do anything with them, as the packets
are basically saying "no thanks" to a connection request.

I guess you could argue that the packet counters should be updated
regardless, although bear in mind that the ICMP packets are related to
the original UDP connection, so any update should happen to that
connection. You wouldn't see them as a separate connection.

> 
> I am using ulogd2 to dump all the connections and the ones above are all
> that I see.  Therefore either there is a bug in ulogd2 which isn't
> spitting out this connection or conntrack completely misses this packet?
> (arguably whether should it be applied to this connection or not mind?)

Your last comment there is the key. The ICMP packets are coming in,
RELATED to the UDP connection, but are not being applied to it, arguably
because of what they are saying.

> 
> I think you are leaning towards confirming this is unexpected and could
> be reported as a "bug"?

I wouldn't like to say whether it is a bug really...

>   I wrote up the above on the -devel list but
> didn't attract any comments so far

It might be worth trying again with a different question, along the
lines of "can conntrack be changed to count ICMP unreachable packets
related to an existing connection". If you're feeling brave, you could
have a poke around in the source code.

Andy


