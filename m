From: Andrew Beverley <andy@andybev.com>
Subject: Re: An Interface with alias
Date: Wed, 01 Feb 2012 19:08:03 +0000
Message-ID: <1328123283.1891.16.camel@andy-laptop>
References: <CAMTjHryLg65vvLBJUsDGsNt82P0iXQmFihV_8UTn=Pm8OzG0Dg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMTjHryLg65vvLBJUsDGsNt82P0iXQmFihV_8UTn=Pm8OzG0Dg@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1328123671;
	bh=Ho0c2sTNPHybeTtJg0ylJl4SWsZJh5wZyE0HkC3MIVk=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Mime-Version:Content-Transfer-Encoding;
	b=pjzcaPcDGKZU8L7Hq608RIeS/7dPLdcB9lKbC8SlWFqxA8WDkDVpv1KWajVEQrLfq
	 pTbnAvM4v26ghvKkK1h+YXw0rCkQrdnkm/PXwNkILRTHFApqrXfqHVdXk+HidFRV7B
	 Rg/NVd1MQ9Fc1vRetgx68fvCXgsQrDr5ztLKjI2U=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Usu=E1rio?= do Sistema <maiconlp@ig.com.br>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Fri, 2012-01-20 at 15:46 -0200, Usu=C3=A1rio do Sistema wrote:
> so... I wonder if is very bad or what can happen when I do alias on a
> interface for more the one network. for exemplo:
=2E..
> I wish drop any packages between theses network. any traffic between
> the network 172.16.30.0/30 and 172.16.30.4/30 must dropped by
> iptables.

That sounds a bit messy, and I don't even know if it's possible. Why no=
t
just use multiple physical network interfaces?

Even if you got it working, if the computers on the 2 separate networks
had their netmask incorrectly configured, then you'd get traffic passin=
g
directly between them without even going to the Linux box.

Andy


