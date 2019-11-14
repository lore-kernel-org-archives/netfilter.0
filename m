From: =?UTF-8?Q?Kadlecsik_J=C3=B3zsef?= <kadlec@blackhole.kfki.hu>
Subject: Re: ipset bitmap:port question
Date: Thu, 14 Nov 2019 13:44:33 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1911141343070.7498@blackhole.kfki.hu>
References: <ba4fb013-93a0-3f63-0fd6-a4ee557893af@lechevalier.se>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:references
        :message-id:in-reply-to:from:from:date:date:received:received
        :received; s=20151130; t=1573735473; x=1575549874; bh=un05d1NgrO
        rmO1CFr8wiLVir7jI3gH65s+pkYNh5UfU=; b=Ro5ZJ2OTaC1YL04w0POiK+d495
        k9jrlll6YMccSwa/ytSEuZaT10ecvCbVqdL1XK0e+01LBFXlS3cGzFRlfe/fOpyk
        XokMLUilZT0OFGn/pdbiA6EEwJCZCDUCIH2UZxZC51lcBCQqQsvsAtREaED6+R6P
        Stocv1yFB+rbtuoRU=
In-Reply-To: <ba4fb013-93a0-3f63-0fd6-a4ee557893af@lechevalier.se>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: A L <mail@lechevalier.se>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

On Thu, 14 Nov 2019, A L wrote:

> I'm trying to understand if ipset "bitmap:port" should support protocol 
> or not. Based on the name"bitmap:port" it should only store one value 
> per row, and not tuple like "bitmap:ip,mac" does. However the examples 
> in the manual suggests it should?

It's a documentation bug, bitmap:port type does not support protocol. 
I'm going to fix the documentation, both in the help and the manpage.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
