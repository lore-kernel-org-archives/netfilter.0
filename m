From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Using a remote internet connection.
Date: 08 Oct 2003 11:45:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065606321.1671.99.camel@kermit>
References: <20031004003050.57956.qmail@web12701.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031004003050.57956.qmail@web12701.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Pete Zieba <pete_1024@yahoo.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Sam, 2003-10-04 um 02.30 schrieb Pete Zieba:
> I then do the following:
> I reconfig my workstation to use his ISP's nameserver.
> I can now ping domains (yahoo, etc.)
> I CANNOT get to MOST websites. (msn.com is one of my
> few successes)
>=20
> *Note that everything works fine if I try to get to
> websites using "links" as a browser in the console of
> my linux box. It is only machines on my LAN side that
> have problems.
You might have some problems with the PMTU-Discovery since you probably
have several different MTUs on the Path and firewalling in between.
Either get the firewalls to allow ICMP-frag-needed through or you might
want to try the=20
TCPMSS target to confine TCP-packet to a maximum size, like:
-j TCPMSS --set-mss 1300 or -j TCPMSS --clamp-mss-to-pmtu
I do not know if 1300 would be the best value but at least it should get
the connection working if thats the problem.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

