From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Probably bug detected with ip6tables ...
Date: Fri, 13 Oct 2017 16:05:35 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1710131601520.2159@blackhole.kfki.hu>
References: <1b6eda16c4c70db5c0bb1824a002c98a.1507888146@squirrel.mail>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:references
        :message-id:in-reply-to:from:from:date:date:received:received
        :received; s=20151130; t=1507903536; x=1509717937; bh=aSba3d1DB3
        wsuHB6AzcQ72ghnci+SEWq78X0sK+P6Lw=; b=BhJnu+4V8nNU4RA2egLo4LxsBs
        LKoTZ3l95XNvhCq4iOup9FlExFHJsHEnp8xvCZVUOt/0YVEfE1YCJWpf7QouhDgB
        qTOfGFoZb/cT2aiK6mw6AjNbQKAeSZfQ1UkQYerFYhGs1Ii8vsy1toWvxfc3j8W9
        /Jmh6U+ESoC0+oV3U=
In-Reply-To: <1b6eda16c4c70db5c0bb1824a002c98a.1507888146@squirrel.mail>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Walter H." <walter.h@mathemainzel.info>
Cc: netfilter@vger.kernel.org

On Fri, 13 Oct 2017, Walter H. wrote:

> I have a virtual server at a hoster, where I have a full /64-prefix, so 
> I declared a few addeesses with special numbers ...
> 
> e.g.  pi = 3.141592653589 and the IPv6 address is 
> [prefix:3:1415:9265:3589] there is also a special number below 1, the 
> IPv6 [prefix:0:5772:1566:4901]
> 
> now the bug:
> 
> this works:
> -A INPUT -i eth0 -d prefix::5772:1566:4901 -m tcp -p tcp --dport 25 -m
> state --state NEW -j ACCEPT
> 
> but this not:
> -A INPUT -i eth0 -d prefix:0:5772:1566:4901 -m tcp -p tcp --dport 25 -m
> state --state NEW -j ACCEPT

An IPv6 address is represented as eight groups of four hexadecimal digits 
and '::' can be used to shorten just 0 fields. 

The first command works if the prefix contains four or less number of 
groups.

The second command works only if the prefix contains exactly four number 
of groups.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
