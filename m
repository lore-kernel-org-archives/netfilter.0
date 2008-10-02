From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: ULOG/NFLOG on a non-forwarding machine
Date: Thu, 02 Oct 2008 11:44:37 +0300
Message-ID: <1222937077.4203.2.camel@casper.meteor.dp.ua>
References: <m38wtjur74.fsf@ursa.amorsen.dk> <48DC3036.1010103@snapgear.com>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48DC3036.1010103@snapgear.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Philip Craig <philipc@snapgear.com>
Cc: Benny Amorsen <benny+usenet@amorsen.dk>, netfilter@vger.kernel.org

=F7 =F0=D4=CE, 26/09/2008 =D7 10:43 +1000, Philip Craig =D0=C9=DB=C5=D4=
:
> Benny Amorsen wrote:
> > Is there a way to catch incoming traffic which is neither INPUT nor
> > FORWARD with netfilter?
>=20
> Have you tried PREROUTING?

Also, have you tried putting interface in "promiscous mode". This way i=
t
will receive all packets including those not addessed to the host
itself. They would be dropped later, but you still can grab them.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

