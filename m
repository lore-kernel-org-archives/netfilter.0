From: Marco Padovan <evcz@evcz.tk>
Subject: Re: SYN Cookies vs ip_conntrack in SYN Flood conditions
Date: Wed, 06 Mar 2013 00:22:04 +0100
Message-ID: <51367E1C.30003@evcz.tk>
References: <27426969-529E-4D02-A526-39BB80C685D1@stevek.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=evcz.tk; s=google;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:x-enigmail-version:openpgp
         :content-type:content-transfer-encoding;
        bh=BnXodsmsURXz3hqX6YFwjK30yqHPeslSNR3BbsuXS68=;
        b=tTA1nOC6Zx67X7G+cJR+WeUJR287tyc6XkVXTnzHW6fxyHrgaunnbBbxkKSgxf5jeP
         up6KMNC32Ju0vSzYtrGxvyF/M/z52Tv7lMEAFTUdBCTTRm2Hzt2QE5rpicx64zemf+9d
         HCIhlYP1Fhr/s4p5kjVO5ZxXLBJXY0ACiHANs=
In-Reply-To: <27426969-529E-4D02-A526-39BB80C685D1@stevek.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Kann <stevek@stevek.com>
Cc: netfilter@vger.kernel.org

Having same kind of issues here... :D

btw syn cookies are not much useful (at least in my case) with decent
pps rates (>10k) :(

Il 28/02/2013 18.28, Steve Kann ha scritto:
> Netfilter-wizards,
>
> 	I've been playing around with using iptables and syncookies to try to harden a linux box against SYN Flood attacks, and I seem to have run into something which doesn't work the way I'd want it to.
>
> 	Ideally, I'd like to create a situation where there protected host could withstand very high volume SYN attacks (in the order of hundreds of thousands of forged SYN packets per second), as well as fairly significant legitimate traffic volumes (hundreds of megabits).
>
> 	From what I've observed, if you have a host which uses ip_conntrack to track connections, and that host is under SYN flood conditions and has begun to send SYN cookies, connection table entries are created for these embryonic connections.
>
> 	This seems counter to the design intent of syn cookies, in that ideally, we would like to keep no state at all for TCP connections until the TCP handshake is completed.
>
> It seems there's a couple of options:
> a)  Abandon ip_conntrack (and all stateful iptables rules):   This seems to work, but it limits the scope of available rules.   I've also read some concerns about performance implications here.
>
> b) (this is why I'm coming here):  Is there any way to defer ip_conntrack table population until the TCP initiator sends back their valid ACK packet with the SYN Cookie response?  This would seem to be the ideal solution, as it would retain the stateless intent of syncookies, but allow state tracking for more advanced iptables rules.
>
> This seems like something others would have run into before, so I hope I've come to the right place for advice.
>
> Thanks!
>
> -SteveK
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

