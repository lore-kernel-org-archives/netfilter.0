From: Kostas Pelechrinis <kpele_ntua@yahoo.com>
Subject: Re: Redirecting flows among one machine's interfaces
Date: Tue, 9 Nov 2010 16:51:51 -0800 (PST)
Message-ID: <446996.78588.qm@web31608.mail.mud.yahoo.com>
References: <alpine.LNX.2.01.1011100033030.7017@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1289350311; bh=PSiAKHDAR6etJ/EyuDugtjVRnDTpW8ly9660Ey2iXD8=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=aBNmCQsQqjiynryRIuGJVQIFRjU/kIevDEmPNzc7DTLtaJzjXoaLz4BPKiYJOYmSGSZ6xj5qVhTXfyW/Hi5GjAarvoRTzYRPO8pqKVK6JtA2nIeMmSeuA3AbD+oRC12A4XrqvB01BpP3F8Dnzc8W4LHNOuWKMqpFit3HaDCyRgE=
In-Reply-To: <alpine.LNX.2.01.1011100033030.7017@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Thanks a lot.  I am checking iproute2 now but can you give any pointers=
/hints.

Thanks a lot,
Kostas

--- On Tue, 11/9/10, Jan Engelhardt <jengelh@medozas.de> wrote:

> From: Jan Engelhardt <jengelh@medozas.de>
> Subject: Re: Redirecting flows among one machine's interfaces
> To: "Kostas Pelechrinis" <kpele_ntua@yahoo.com>
> Cc: netfilter@vger.kernel.org
> Date: Tuesday, November 9, 2010, 6:33 PM
> On Tuesday 2010-11-09 23:59, Kostas
> Pelechrinis wrote:
>=20
> >Hi all,
> >
> >I am not very familiar with iptables, but what I am
> trying to achieve=20
> >is the following:
> >
> >I have a machine with two interfaces (let's say if1 --
> with ip address=20
> >a.b.c.d -- and if2 -- with ip address x.y.z.w) both
> connected to the=20
> >internet. One of the two interfaces is the default
> interface (e.g.,=20
> >if1).=A0 Whatever flow is initiated towards a
> destination in the Internet=20
> >is going out if1.=A0 I want to use iptables in order
> to redirect some of=20
> >the flows to if2.=A0 Is there a way to do this using
> iptables?
>=20
> Using -j MARK and iproute2 policy routing.
>=20
> >I have tried some rules (e.g., iptables -A FORWARD -d
> k.l.m.n -o if2 -j=20
> >ACCEPT // where k.l.m.n is the destination ip address
> of the flow I=20
> >want to redirect) but with no luck.
>=20
> Well guess why: it _tests_ whether the outgoing interface
> is (already)=20
> if2.
>=20


     =20
