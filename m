From: "Jan Kaastrup" <jka@protego.dk>
Subject: RE: Routing a VPN.....confused
Date: Mon, 15 Dec 2003 09:48:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002701c3c2e8$41b68df0$2d64a8c0@pcjka>
References: <1071402624.1682.6.camel@kermit>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1071402624.1682.6.camel@kermit>
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
To: 'Ralf Spenneberg' <lists@spenneberg.org>, mbrei@carolina.rr.com
Cc: 'Netfilter' <netfilter@lists.netfilter.org>

Hi=20
I have had the same problem, and i found out that i forgot to put on
"leftnexthop" or "rightnexthop". Also be sure that the ipsec.conf files
are the same on both machines.

Another thing - if you are using %default route, this can also be the
problem.=20

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Ralf
Spenneberg
Sent: 14. december 2003 12:50
To: mbrei@carolina.rr.com
Cc: Netfilter
Subject: Re: Routing a VPN.....confused


Am Son, 2003-12-14 um 03.24 schrieb Matt Brei:
> Hi all,
>=20
> I'm trying to set up a VPN with my buddy back in Chicago.  We're both
> using iptables to nat our Internet connection to the rest of the LAN
and
> filter out all the naughtiness on the cable modem connection.  So far,
> we've tried FreeS/WAN on the iptables routers, but as soon as we start
> the ipsec service, it kills the Internet connection.=20
This sounds pretty much like a configuration issue using freeswan >=3D
2.0. FreeS/WAN enables opportunistic encryption (OE) by default. This
may interrupt your Internet connections since it tries to encrypt
everything by default. It uses policy groups for this. You probably have
to disable these policy groups.

Take a look at:
http://www.freeswan.org/freeswan_trees/freeswan-2.04/doc/policygroups.ht
ml#disable_policygroups

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: VPN mit Linux
Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:
http://honeynet.spenneberg.org



