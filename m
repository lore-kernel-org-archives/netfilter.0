From: my mail <amfpg@yahoo.com>
Subject: Thanks for Help ::: question about table filter, nat and mangle with chain default policy
Date: Sun, 12 Apr 2009 16:32:04 -0700 (PDT)
Message-ID: <830514.62790.qm@web46114.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1239579124; bh=ePmSzFoEIB9J2LqLKAbbrLa80WgVz2pWApUCD5pIxhU=; h=Message-ID:Received:X-Mailer:Date:From:Subject:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding; b=Kl29BcJl74zjnHjKdibZBavSV889mqIiOKzfkGKPjPv1Z16oiGj1lsoq1NERnowd31HbaoTHasmiEJan6h9GjTfNhJH2RdAesvOFIOIYt/Llud5ghGjdvSAGlKjff3lvQgUVfJA2cHjpE7EN+P0itlA36opKZkhO0Y3leFtjWjc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Amos Jeffries <squid3@treenet.co.nz>
Cc: netfilter@vger.kernel.org


--- On Sun, 4/12/09, Amos Jeffries <squid3@treenet.co.nz> wrote:

=46rom: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: question about table filter, nat and mangle with chain def=
ault policy
To: "my mail" <amfpg@yahoo.com>
Cc: netfilter@vger.kernel.org
Date: Sunday, April 12, 2009, 11:40 AM

>=20
>
> The packet flows diagram can explain a lot more than any amount of te=
xt:
> http://l7-filter.sourceforge.net/PacketFlow.png

> ... now imagine that the boxes labled mangle::PREROUTING=A0 and  nat:=
:PREROUTING had a DROP for all packets.

> Which is configured like this:
>  $IPT -t mangle --policy PREROUTING DROP
>  $IPT -t nat --policy PREROUTING DROP

>=20
> AYJ


ah i see, very2 thanks Amos for link into the diagram, i understand now=
 about packet flow in iptables/netfilter. Link you give to me very2 hel=
pful for me

thanks again Amos...

best regards


     =20

