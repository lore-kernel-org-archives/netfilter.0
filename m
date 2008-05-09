From: Cloves Pereira Costa Jr <cloves.costa@m2sys.com.br>
Subject: Re: DNAT routing problem
Date: Fri, 09 May 2008 10:04:03 -0300
Message-ID: <1210338243.4992.31.camel@wtprit0036.m2sys.com.br>
References: <3598a5460805081117i7f519321y9ad85f084ba0f484@mail.gmail.com>
	 <3598a5460805090348w526f46c9v3f1fd0f0874c84db@mail.gmail.com>
Reply-To: cloves.costa@m2sys.com.br
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3598a5460805090348w526f46c9v3f1fd0f0874c84db@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Netfilter ML <netfilter@vger.kernel.org>

Hi Andrea,

Could you show us some example?

[]s

Cloves

Em Sex, 2008-05-09 =C3=A0s 12:48 +0200, Andrea Ranieri escreveu:
> On 5/8/08, Grant Taylor wrote:
>=20
> > NAT rules are applied to the first packet in a connection and then =
the
> > same action is auto-magically applied to all other packets in the
> > connection with out passing them through the NAT table.
> >
> > So what you are seeing is probably very likely based on existing ve=
rses
> > new connections.
>=20
> Thanks for your reply, but it seems I didn't explain my problem clear=
ly.
> I have a connectionless flow of ipv4 packets. No TCP, UDP or any L4
> payload at all.
> So my question now is: does netfilter (with D/SNAT or NETMAP target)
> provide basic natting features without having a L4 payload, or a
> connection oriented flow is required for natting?
>=20
> Thanks again
> Andrea
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
--=20
Antes de imprimir, pense em sua responsabilidade com o Meio Ambiente!!!

Cloves Pereira Costa Jr
M2Sys Tecnologia e Servi=C3=A7os S/A

+55 41 3271-4461
+55 41 8413-6740
Skype: clovespcjr
cloves.costa@m2sys.com.br

