From: "PAUL WILLIAMSON" <pwilliamson@mandtbank.com>
Subject: netfilter/iptables/NAT/DNS problems
Date: Mon, 13 May 2002 23:30:54 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <sce04cc0.024@mandtbank.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

Help!!  I have no hair left! =20

I have been over the HOWTO, most exampes I can find=20
and I still can't get things working entirely correct.=20

I've looked in the archives, and that's gotten me=20
about 95% of the way.  But that last 5% is killing=20
me.

external net-----firewall/dns-----internal net

I'd like anything sourced from inside to be able to get outside. =20
I'd like nothing outside to be able to get in, other=20
that traffic that originated from inside.
I'd like ssh to be accepted from only internal=20
connections.
I want all my internal network machines to use the=20
DNS on the firewall.  The DNS on the firewall is=20
pointing to a "real" internet DNS server.
I want all my machines to be NAT'ed going through the=20
firewall out to the internet.

I have a cable modem with a dynamically assigned IP=20
address, and depending on what range I get assigned=20
to, I may end up with different DNS servers.  I'd=20
like my internal machines to use the firewall as the=20
DNS server, and have the firewall actually do the=20
requesting out to the internet.
I can surf the internet from the linux=20
firewall/dns box.

I can get as far as being able to ping real ip=20
addresses on the internet from any internal machine,=20
but I can't ping DNS names of those same sites. =20
Obviously, I don't quite have things set up=20
correctly.

Also, I can't get ssh to be accepted, PuTTy gives me=20
an error that "Software caused connection abort." =20

BTW, most internal machines are Windoze2000 or XP.
There are one or two crazy people that run linux=20
on their desktop (me included...)  But I'm not too=20
concerned, because I think the problem is in how the=20
iptable rules are accepting requests on port 53,=20
right?=20

Please help!

Thanks,
Paul

