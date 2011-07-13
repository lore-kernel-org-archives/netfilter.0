From: nany <naveen.sadanand@gmail.com>
Subject: Re: How to completely disable conntrack?
Date: Wed, 13 Jul 2011 07:24:04 +0000 (UTC)
Message-ID: <loom.20110713T092047-270@post.gmane.org>
References: <4D7785DC.8050904@centrum.cz> <AANLkTimkFarQO63ekSKJBL0PUqaMQV8QWWGLSQyQrDfq@mail.gmail.com> <4D7954EB.1050704@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Pascal Hambourg <pascal.mail <at> plouf.fr.eu.org> writes:

>=20
> Hello,
>=20
> Pandu Poluan a =C3=A9crit :
> > I'm sure there's a sysctl knob, but off the top of my head:
> >=20
> > -t raw -A PREROUTING -j NOTRACK
>=20
>=20
-t raw -A OUTPUT -j NOTRACK

hey man i applied above rules, its not working,=20

the connections shows in /proc/net/ip_conntrack

is any one can tell how to disable connection tracking completely,

please help me man




