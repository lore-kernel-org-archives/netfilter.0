From: Landy Landy <landysaccount@yahoo.com>
Subject: Re: Forward ssh to an internal server not working
Date: Wed, 1 Dec 2010 19:27:40 -0800 (PST)
Message-ID: <728010.64913.qm@web62507.mail.re1.yahoo.com>
References: <alpine.LNX.2.01.1012020401560.29349@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1291260460; bh=PxaBRiQ4NAhIPLd4pvwnGD2lsujp6KrduvTtZMzrW/g=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=q1qkI60dVhxiNiH9JDwys/VtA//qcYde0jQj8np9GhhvH42PdafADXwoynml8IhWtflOatIL1PoLtAMGJIz9bh9JzfhmdqcK7EbdnQjTi+MwZcNZneKiePa5xj5QlNnjPjUAFyKCLlmr8nhee9gUG4k5euSoWXiEoFtO7aZcgig=
In-Reply-To: <alpine.LNX.2.01.1012020401560.29349@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org


--- On Wed, 12/1/10, Jan Engelhardt <jengelh@medozas.de> wrote:

> From: Jan Engelhardt <jengelh@medozas.de>
> Subject: Re: Forward ssh to an internal server not working
> To: "Landy Landy" <landysaccount@yahoo.com>
> Cc: netfilter@vger.kernel.org
> Date: Wednesday, December 1, 2010, 10:02 PM
> On Thursday 2010-12-02 03:35, Landy
> Landy wrote:
>=20
> >Hello.
> >
> >Can someone please tell me why I cannot access a
> machine inside my LAN from outside? These are my rules to
> try to accomplish that task:
> >
> >$iptables -t nat -A PREROUTING -i $EXT_IFACE -p tcp \
> >=A0 =A0 =A0 =A0 -s $UNIVERSE --sport
> $UNPRIVPORTS -d $EXT_IP --dport 22 \
> >=A0 =A0 =A0 =A0 -j DNAT --to-destination
> 172.16.0.200:22
> >
> >$iptables -A FORWARD -i $EXT_IFACE -o $LAN_IFACE -p tcp
> \
> >=A0 =A0 =A0 =A0 -s $UNIVERSE --sport
> $UNPRIVPORTS -d 172.16.0.200 --dport 22 \
> >=A0 =A0 =A0 =A0 -m state --state NEW -j
> ACCEPT
> >
> >$iptables -A FORWARD -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> >
> >What am I doing wrong?
> >
> >When I try to ssh from outside our network I can see it
> gets to the prerouting but, nothing gets forwared:
> >
> >Chain PREROUTING (policy ACCEPT 1223 packets, 93798
> bytes)
> > pkts bytes target=A0 =A0=A0=A0prot opt
> in=A0 =A0=A0=A0out=A0
> =A0=A0=A0source=A0 =A0 =A0 =A0 =A0
> =A0 =A0=A0=A0destination=A0 =A0 =A0
> =A0=A0=A0
> >=A0 374 19224 REDIRECT=A0=A0=A0tcp=A0
> --=A0 eth0=A0=A0=A0*=A0 =A0
> =A0=A0=A0172.16.0.0/16=A0 =A0 =A0 =A0
> 0.0.0.0/0=A0 =A0 =A0 =A0 =A0=A0=A0tcp
> spts:1024:65535 dpt:80 redir ports 3128=20
> >=A0 =A0 0=A0 =A0=A0=A00
> REDIRECT=A0=A0=A0tcp=A0 --=A0
> eth0=A0=A0=A0*=A0 =A0
> =A0=A0=A0172.16.0.0/16=A0 =A0 =A0 =A0
> 172.16.0.1=A0 =A0 =A0 =A0 =A0 tcp
> spts:1024:65535 dpt:8080 redir ports 80=20
> >=A0 =A0 0=A0 =A0=A0=A00
> REDIRECT=A0=A0=A0tcp=A0 --=A0
> eth1=A0=A0=A0*=A0 =A0
> =A0=A0=A00.0.0.0/0=A0 =A0 =A0 =A0
> =A0 =A0 190.80.4.42=A0 =A0 =A0
> =A0=A0=A0tcp spts:1024:65535 dpt:8080 redir ports
> 80=20
> >=A0 =A0 3=A0=A0=A0180 DNAT=A0 =A0
> =A0=A0=A0tcp=A0 --=A0
> eth1=A0=A0=A0*=A0 =A0
> =A0=A0=A00.0.0.0/0=A0 =A0 =A0 =A0
> =A0 =A0 190.80.4.42=A0 =A0 =A0
> =A0=A0=A0tcp spts:1024:65535 dpt:22
> to:172.16.0.200:22=20
>=20
> This spts thing. It's redundant and does not protect
> anything.
>=20

Even without --sport it doesn't work:


   1    60 DNAT       tcp  --  eth1   *       0.0.0.0/0            190.=
80.4.42         tcp dpt:22 to:172.16.0.200:22=20



     =20
