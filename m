From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: target extension
Date: Thu, 22 Nov 2007 14:37:59 +0200
Message-ID: <1195735079.2317.17.camel@localhost.localdomain>
References: <47456E11.1090706@unipex.it>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47456E11.1090706@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Cc: netfilter@vger.kernel.org

Take a look at ipset, maybe it will do the job for you.

=F7 =FE=D4=D7, 22/11/2007 =D7 12:54 +0100, Michele Petrazzo - Unipex sr=
l =D0=C9=DB=C5=D4:
> Hi all,
> I'm looking for an extension that load the ip address from the proc f=
s,
> so there I can set the address that I want to match. Something like:
>=20
> iptables -A INPUT -m proc_ext --proc_ext_parms -j ACCEPT
> cat my_ip_host >> /proc/net/ipt_proc_ext/host
>=20
> (similar that I can do with the condition extension)
>=20
> Looking on the net, but found none.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

