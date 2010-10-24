From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Blocking machines by both Mac Address and IP address
Date: Sun, 24 Oct 2010 16:22:21 +0200
Message-ID: <4CC4411D.4070701@plouf.fr.eu.org>
References: <AANLkTimE3DpKibaqKH53D9PEtt_AxSAimdaTiyTy1VZK@mail.gmail.com> <1287873234.1700.330.camel@andybev>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1287873234.1700.330.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Andrew Beverley a =E9crit :
>=20
> Set your default policy to drop:
>=20
> iptables -t mangle -P FORWARD DROP
>=20
> Then set up a rule for each client that matches both IP address and M=
AC:
>=20
> iptables -t mangle -A FORWARD -s 1.2.3.4 \
> 	-m mac --mac-source aa:aa:aa:aa:aa:aa -j ACCEPT

The 'mangle' table is not intended for filtering. The 'filter' table is=
=2E
