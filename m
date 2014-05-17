From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: randomly SNATed devices after reboot
Date: Sat, 17 May 2014 15:09:48 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1405171507460.2664@aurora.sdinet.de>
References: <20140515104238.26ce6626@pulsar> <53759AB5.6050101@atc.tcs.com> <537660A1.9060907@plouf.fr.eu.org> <20140516165931.274ae0c2@pulsar> <53767426.8080003@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-2027346802-1400332190=:2664"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <53767426.8080003@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: "Ethy H. Brito" <ethy.brito@inexo.com.br>, netfilter <netfilter@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2027346802-1400332190=:2664
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 16 May 2014, Pascal Hambourg wrote:

> Ethy H. Brito a =E9crit :
> > This is what I see, please correct me if I'm wrong:
> > =091) IP stack is in place during boot=20
> > =092) network parameters are configured (ip addrs, routes, etc)
> > =093) nf modules are loaded (/etc/modules.d??)
> > =094) conntrack modules are loaded (also /etc/modules.d)
> > =095) user scripts are loaded (iptables snat or FORWARD rules included)
>=20
> The order is sysadmin-dependent. You decide. My iptables initscript is
> run before the network is configured and activated.

And if you are unable for whatever reasons to do it correctly you can=20
use the "conntrack" tool after iptables rule setup to flush/delete all=20
conntrack connections existing at that time.

c'ya
sven-haegar

--=20
Three may keep a secret, if two of them are dead.
- Ben F.
--8323328-2027346802-1400332190=:2664--
