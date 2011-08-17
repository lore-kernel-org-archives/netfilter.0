From: "Nikolay S." <nowhere@hakkenden.ath.cx>
Subject: RE: How to do NAT for an udp reply packet?
Date: Wed, 17 Aug 2011 23:46:26 +0400
Message-ID: <1313610386.27275.3.camel@hakkenden>
References: <3173206D0F5F6B418F76F5997B2AE75201F164B3@gatex01.CMLnet.peinet.peinc.com>
	 <alpine.LNX.2.01.1108172134000.14947@frira.zrqbmnf.qr>
	 <3173206D0F5F6B418F76F5997B2AE75201F164B6@gatex01.CMLnet.peinet.peinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3173206D0F5F6B418F76F5997B2AE75201F164B6@gatex01.CMLnet.peinet.peinc.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Calin Onofrei <Calin.Onofrei@cassidiancommunications.com>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

=D0=92 =D0=A1=D1=80=D0=B4, 17/08/2011 =D0=B2 15:38 -0400, Calin Onofrei=
 =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> I need to change the source port for the udp reply packet.

You can try act_pedit and "tc action" for that. I did not use it, but
looks like it can do exactly what you want without messing with
conntrack

>=20
>=20
>=20
> -----Original Message-----
> From: Jan Engelhardt [mailto:jengelh@medozas.de]=20
> Sent: August 17, 2011 15:36 PM
> To: Calin Onofrei
> Cc: netfilter@vger.kernel.org
> Subject: Re: How to do NAT for an udp reply packet?
>=20
> On Wednesday 2011-08-17 15:48, Calin Onofrei wrote:
>=20
> >Hi netfilter list,
> >I want to do NAT with specific rules for an udp reply packet.
>=20
> nf_nat works on entire NFCT connections only.
> It eludes me why you would want to merely change one reply packet, bu=
t=20
> you would need xt_RAW[S|D]NAT for that.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


