From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Probably bug detected with ip6tables ...
Date: Fri, 13 Oct 2017 22:05:53 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1710132201440.6854@blackhole.kfki.hu>
References: <1b6eda16c4c70db5c0bb1824a002c98a.1507888146@squirrel.mail> <alpine.DEB.2.11.1710131601520.2159@blackhole.kfki.hu> <59E0DDB6.5030300@mathemainzel.info>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:references
        :message-id:in-reply-to:from:from:date:date:received:received
        :received; s=20151130; t=1507925153; x=1509739554; bh=xYN+l6L1SM
        ftp0gWwSZp+8LSBYKCgt7i+MZQv7iymXs=; b=BGN8LqRm8gOX5sz90rv7DaQa37
        MNi1xNa1lasYXhViTVSOGoRGr/hU12ICnmiqTid2C7Rz262SV+1Yn31Qg26u76uh
        kDbGn22IzlU7ZycYF2ZsBsXqZc74I9fYXQGwY7SgbYl6j94+FuUfUVIdELTu+VIc
        3/rMGRC5lQXfPJv1o=
In-Reply-To: <59E0DDB6.5030300@mathemainzel.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Walter H." <Walter.H@mathemainzel.info>
Cc: netfilter@vger.kernel.org

On Fri, 13 Oct 2017, Walter H. wrote:

> On 13.10.2017 16:05, Jozsef Kadlecsik wrote:
> > On Fri, 13 Oct 2017, Walter H. wrote:
> > 
> > > I have a virtual server at a hoster, where I have a full /64-prefix, so
> > > I declared a few addeesses with special numbers ...
> > > 
> > > e.g.  pi = 3.141592653589 and the IPv6 address is
> > > [prefix:3:1415:9265:3589] there is also a special number below 1, the
> > > IPv6 [prefix:0:5772:1566:4901]
> > > 
> > > now the bug:
> > > 
> > > this works:
> > > -A INPUT -i eth0 -d prefix::5772:1566:4901 -m tcp -p tcp --dport 25 -m
> > > state --state NEW -j ACCEPT
> > > 
> > > but this not:
> > > -A INPUT -i eth0 -d prefix:0:5772:1566:4901 -m tcp -p tcp --dport 25 -m
> > > state --state NEW -j ACCEPT
> > An IPv6 address is represented as eight groups of four hexadecimal digits
> > and '::' can be used to shorten just 0 fields.
> I know ...
> > The first command works if the prefix contains four or less number of
> > groups.
> yes, it is a /64 prefix
> > The second command works only if the prefix contains exactly four number
> > of groups.
> better say, it should work, because it doesn't , even if the prefix contains
> exactly four number of groups

What does it exactly mean "doesn't work"?

The command fails with an error message? The rule does not match?

What it the kernel version? What is the version number of the iptables 
package?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
