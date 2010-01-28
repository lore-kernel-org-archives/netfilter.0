From: Matt Hakim <thepigs@gmail.com>
Subject: Re: fwmark & iptables
Date: Fri, 29 Jan 2010 07:50:34 +1100
Message-ID: <fcfe0b071001281250u13539aa3o82520e8044dee59f@mail.gmail.com>
References: <fcfe0b071001280237w56be822fo5fb896071faacc3b@mail.gmail.com>
	 <4B6176A9.3030404@plouf.fr.eu.org>
	 <fcfe0b071001280526t75cdc774x8d3a91497e8af2cf@mail.gmail.com>
	 <4B619284.5030905@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type;
        bh=10Z9X0VtSYozlgOVC4zyFaS2o4md51qiuHNOXAVFYUw=;
        b=NQqvmV39tTfuNtbTHSxtX+lackuFNC7jOnA7HSfLMzmB9M/auKQw+YL7V9dQQpPBr4
         ApgeGMyA2jzxrELNvhye87YEuNSdOBVBV8co3a5S86bSZwBZ5Ikh/0/o394+eVg7wZQG
         cA1jkJUP203PW2UM5B7RVShnjS8GQYeySHZnQ=
In-Reply-To: <4B619284.5030905@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> Forgot about that, sorry. Make sure sysctl net.ipv4.conf.ppp0.rp_filter
> is set to 0 after ppp0 is created, otherwise the packet is discarded at
> the input routing decision stage. sysctl net.ipv4.conf.default.rp_filter
> contains the value that will be set for any new interface.

Didn't seem to help.

Currently I've got this:

sysctl net.ipv4.conf.default.rp_filter=0
pon VPN (rp_filter for ppp0 is 0 at this point)
iptables -t mangle -A OUTPUT -mowner --uid-owner rtorrent -j MARK --set-mark 1
ip rule add fwmark 1 lookup 200
ip route add default dev ppp0 table 200
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

I can see packets go out and replies come back and then get lost at
mangle PREROUTING. Maybe I need to mark the packets coming back in or
is it some connection tracking prob?

Thanks,
Matt
