From: Andreas Kretschmer <andreas_kretschmer@despammed.com>
Subject: Re: [despammed] port based filtering and IPsec 2.6
Date: Sat, 17 Jan 2004 14:45:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040117134519.GA4911@kaufbach.delug.de>
References: <20040114162623.GR4106@openoffice.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040114162623.GR4106@openoffice.nl>
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

am  Wed, dem 14.01.2004, um 17:26:23 +0100 mailte Valentijn Sessink folgend=
es:
> Now there seems a solution that is a bit of a hack, but it does work. Sim=
ply
> use a *tunnel* between the two hosts, and define the subnets to be
> "tunneled" to be the hosts themselves, like so:
>=20
> Now you'll find double logs from each packet, like so:

Okay, but you can't filtering packets. It's not possible to filter, for
instance, all traffic from/to telnet-port and enable all traffic to/from
ssh-port. For this reasen there are the ipsecX-interface in FreeSwan. On
the ethX you see only the crypted traffic, and on ipsecX the plain
traffic. So you can filtering, you can enable only ah/esp on ethX and
enable only ssh on ipsecX.
I miss this option in Kernel 2.6.


Andreas, and sorry about my english...
--=20
Diese Message wurde erstellt mit freundlicher Unterst=FCtzung eines freilau-
fenden Pinguins aus artgerechter Freilandhaltung.   Er ist garantiert frei
von Micro$oft'schen Viren. (#97922 http://counter.li.org)     GPG 7F4584DA
Was, Sie wissen nicht, wo Kaufbach ist? Hier: N 51.05082=B0, E 13.56889=B0 =
;-)

