From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset -R
Date: Thu, 24 Feb 2011 12:18:39 +0000
Message-ID: <4D664C9F.3020701@googlemail.com>
References: <4D645BC7.7030306@googlemail.com>	<alpine.DEB.2.00.1102232009001.16917@blackhole.kfki.hu>	<4D659102.8090501@googlemail.com> <AANLkTi=06RAwFaiQzjiTMmJaoy+EgXSbq3UdOfonH4UQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=EWZzUa7c37aDiqwzkBn5CT2BH60mg560xkygabXj1jg=;
        b=XjDXxW/hCRHiYtTgUv1B9mzq/PsWCh7IH4prjzxC9B6Dbk8uW1ooUfdKr1CYNcHyp2
         Yve0p3DhHzuvSDqGdaTiDS14+SCzt1S6jAx+0pdQAtTikHp074Cg0l0zAOEmjGTjK66L
         Cn7w4qV3e2wNniVopBMbHA5McAJ/GP/qrfJbA=
In-Reply-To: <AANLkTi=06RAwFaiQzjiTMmJaoy+EgXSbq3UdOfonH4UQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pandu Poluan <pandu@poluan.info>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


> What if:
>
> -m set ! --match-set $WHITELIST src -m set --match-set $BLACKLIST src -j DROP
>   
Yeah, never thought of that before, thanks, though this would increase 
processing time as I have to include that extra 'whitelist' non-match in 
every iptables '--match-set' statement I have where my blacklist sets 
are involved (and I have quite a lot of them!). It would be better if I 
just delete the whitelist members permanently once at the beginning and 
just forget about it (though as Jozsef hinted yesterday that may not 
work in 5.x and 6 any more - see below).

The second statement (in both of your posts) won't be needed as I simply 
propagate the resulting non-match throughout the ip chain (the packets 
therefore could be dropped for a variety of other reasons regardless of 
whether they belong to the 'whitelist' or not, which is what I wanted to 
have in a first place).

Jozsef, you mentioned yesterday that ipset 5.x (and I presume 6.0+ also) 
does not implement ip range 'readjustment' any more. If so, what happens 
when I list the set below:

ipset -F test
ipset -A test 10.1.1.0/24
ipset -D test 10.1.1.12
ipset -L test

> -m set --match-set $WHITELIST src -j ACCEPT
>   
That won't be needed as I simply want the packet to be propagated down 
the ip chain as normal (the packet could be dropped for other reasons 
and the fact that it belongs to the whitelist won't matter - its sole 
purpose is for punching holes in my blacklist, then it should be treated 
as any other packet).

