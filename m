From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: IPSET: programmatically implementing ip6tables snat rule including
 ipset matching
Date: Thu, 22 Sep 2016 11:36:05 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1609221130140.30187@blackhole.kfki.hu>
References: <45031426-e79d-d687-ddae-2e6f9219ff9e@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:references
        :message-id:in-reply-to:from:from:date:date:received:received
        :received; s=20151130; t=1474536965; x=1476351366; bh=dsGapG1IOo
        MKQMXv4eqBTeszfow1RLZRRdOAnT4qitg=; b=HUizOoRd3sb+mBjo6mTL3RIcW1
        TKqBrZtV2KORNoItgHLPmp3i9vaAWqqa4/m9nrT34+eNCKBa12Itdoz6Eej7wqKV
        CoZFMHlq5tEOYEzjs8x5UwMWqp1/sa8NCx0xo97xjWE5WF57N+7/TKMOD0CTdMQc
        4f7RHBw+ImhhfPzm0=
In-Reply-To: <45031426-e79d-d687-ddae-2e6f9219ff9e@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Khawar <shehzad.khawar@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, 21 Sep 2016, Khawar wrote:

> I want to implement following using C programming
> 
>     "ip6tables -t nat -j postrouting -d <ipv6-address-in-destination-field> -m
> set --match-set xyz -j snat --to-source <ipv6-address>"

I assumne by "implement following using C programming" you mean to call 
exec() from your code. If not, the stop in your project and rethink: 
libiptables from the iptables package was never meant to be used by third 
party projects, check out nftables.

> What should I take into account?

There's nothing fancy there:

- create the sets before you refer them in i[6]ptables rules
- use proper syntax (the flag parameter is missing from the set match)

> I have already installed the ipset userspace and kernel modules. I can 
> easily use ipset specific socket options etc which mean my compilation 
> and installation is somewhat ok.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
