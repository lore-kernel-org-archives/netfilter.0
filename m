From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: newbie problem
Date: 17 Feb 2003 10:00:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045472411.2235.82.camel@kermit.spenneberg.de>
References: <1045467799.20801.22.camel@billybob.back2front.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1045467799.20801.22.camel@billybob.back2front.homelinux.org>
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
To: netfilter@lists.netfilter.org

Am Mon, 2003-02-17 um 08.43 schrieb Chris Barnes:
> hi people i'm new to the list.
>=20
> anyway, I have a very simple firewall on a web server. I want to deny
> access to everything except the web server (port 80)
>=20
> i have set the poilcy on all chains to drop and i have added a rule to
> the input chain which says
>=20
> iptables -A INPUT -p tcp --sport 80 -j ACCEPT
>=20
It is --dport 80 if you want to allow packet with the destination port
80 to reach your webserver.

By the way, i hope you have not set PREROUTING and POSTROUTING to DROP,
do you?


Cheers,

Ralf
=20
--=20
Ralf Spenneberg
UNIX/Linux Trainer and Consultant, RHCE, RHCX
Waldring 34				48565 Steinfurt		Germany
Fon: +49(0)2552 638 755			Fax: +49(0)2552 638 757
Mobil: +49(0)177 567 27 40	=09

Markt+Technik Buch:                     Intrusion Detection f=FCr Linux
Server
IPsec/PPTP Kernels for Red Hat Linux: =20
http://www.spenneberg.com/.net/.org/.de
Honeynet Project Mirror:                http://honeynet.spenneberg.org
Snort Mirror:                           http://snort.spenneberg.org
--=20
Ralf Spenneberg
RHCE, RHCX

IPsec/PPTP Kernels for Red Hat Linux: =20
http://www.spenneberg.com/.net/.org/.de
Honeynet Project Mirror:                http://honeynet.spenneberg.org
Snort Mirror:                           http://snort.spenneberg.org

