From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: NetFilter DMZ question...
Date: 25 May 2003 09:14:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053846889.1862.2.camel@kermit.spenneberg.de>
References: <sece223b.030@nwtel.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <sece223b.030@nwtel.ca>
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
To: Richard Whittaker <RWHITTAKER@nwtel.ca>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Fre, 2003-05-23 um 22.29 schrieb Richard Whittaker:
> Greetings:
>=20
> We have a webserver living in a DMZ, and I have the following rule
> setup to allow this:
>=20
> /usr/sbin/iptables -A PREROUTING -t nat -i eth1 -p tcp -d 199.85.228.1
> --dport 80 -j DNAT --to 192.168.70.3:80
>=20
> Unfortunately, the web server only sees the IP address of the
> interface, not the source IP address, which kinda messes with our
> statistical programs, since the only address the web server "sees" is
> the same one over, and over... Is there any way to present the web
> server with the "real" address, or should it be be already?....
Apparently you have an unqualified SNAT rule lying around, since DNAT
only changes the destination address. Look for your SNAT rules and tie
them to the external interface:
iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 199.85.228.1

Cheers,

Ralf
>=20
> Thanks,
> Richard...
>=20
>=20
> Richard Whittaker, CISSP
> System Manager
> NorthwesTel Inc.
> Whitehorse, YK
> (867) 393-7756
>=20
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                   =20
http://honeynet.spenneberg.org

