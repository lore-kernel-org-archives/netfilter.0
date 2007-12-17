From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Captive portal and DNAT
Date: Mon, 17 Dec 2007 16:51:56 +0100
Message-ID: <47669B1C.3090605@plouf.fr.eu.org>
References: <47050bf90712170641h7cdcf7f5kfe352a999a60beb3@mail.gmail.com> <1197905123.19486.231.camel@grateful.d.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1197905123.19486.231.camel@grateful.d.umn.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Matt Zagrabelny a =E9crit :
>=20
> I had issues with tcp keepalives. I had to tweak the apache configs:
>=20
> KeepAlive Off

This is HTTP keep-alive, an option for permanent connections, allowing=20
multiple HTTP transactions in a single connection. It has nothing to do=
=20
with TCP keep-alive, which would not solve the problem.
