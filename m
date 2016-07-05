From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: iptables TCP DDoS filtering
Date: Tue, 5 Jul 2016 16:51:26 -0400
Message-ID: <20160705165126.7ecb9885@playground>
References: <loom.20160705T084958-392@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU u65KpTYX032636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
	t=1467751889; i=@wpi.edu;
	bh=cjO4PEJyd6laCD9bp/BYPjmlQ3YgyYEO+tIxXNtKBMA=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=Dj0+9g65a5WKuGVilMAxJ2hefXHALyFf8JynHn9MpFII9uJlEse/APvTfy/8tJArd
	 +UTKCUJZhiaGmZ6bUgVDu9hjgs+NTXr39D5qVeqLiVjWa4FTDlfWD+ebrCD+Bbr7fu
	 epxMv83R1q2DFcFXy61Vc7UGlKFFgyMwYTVVs3kk=
In-Reply-To: <loom.20160705T084958-392@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Tue, 5 Jul 2016 06:53:07 +0000 (UTC)
Josh Day <conna666@gmail.com> wrote:

> I'm curious if anyone of you has read this article 
> https://javapipe.com/iptables-ddos-protection and tried any of the 
> rules/settings. I read it today but I'm not sure what to make of it, so 
> thought you guys could maybe share your opinion.

The *first* rule in PREROUTING should drop INVALID packets (the rule should use '-I PREROUTING'). It makes no sense to waste one extra CPU cycle processing them. This should be standard on all firewalls.

In TCP, I think only a SYN packet can be NEW; all other TCP packets for non-established (or maybe non-seen) conns are supposed to be INVALID because they cannot be matched to a tracked conn.

Dropping all ICMP packets is wrong; ICMP is required for TCP/IP to work properly. And to drop only ICMP ECHO packets, it's better to use the kernel function that does that earlier: "echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all".

The rules to drop private, documentation, LL and mcast addresses are too inclusive as written. That is, they drop such packets from all interfaces; they should only drop packets from the internet-facing interface(s). Only the rule that handles 127/8 is reasonably right.

N
