From: Patrick Petermair <captain.nuke@gmx.at>
Subject: Url not found ....
Date: Sat, 6 Jul 2002 22:58:42 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207062258.42170.captain.nuke@gmx.at>
Reply-To: captain.nuke@gmx.at
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi!

I've installed a firewall/gateway with RedHat 7.3 and iptables. I've set =
up=20
masquerading for my internal lan and some basic firewall rules.
Everything works fine (icq, ftp, http,...) but there is ONE homepage whic=
h I=20
cannot acces (a friend of mine can).

http://stud4.tuwien.ac.at/-e9625216/html/projects.html

When I try to access this page with client in my lan all I get is "not fo=
und -=20
The requested URL [...] was not found on this server."
After taking a look in my firewall log I found this entry:

Jul  6 22:45:11 wormhole kernel: IN=3Dppp0 OUT=3D MAC=3D SRC=3D193.170.75=
=2E21=20
DST=3D213.225.44.140 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D57 ID=3D46360 =
DF PROTO=3DTCP=20
SPT=3D80 DPT=3D36827 WINDOW=3D32768 RES=3D0x00 ACK FIN URGP=3D0

And if you try to ping stu4.tuwien.ac.at you'll find out, that the IP is=20
193.170.75.21 - so the answer from the server gets dropped at my firewall=
=2E

So the big question is WHY? All homepages I tried so far are working, but=
 not=20
this one, so I doubt that it's a problem with the firewall rules.....

Any hints/comments?

Regards,
Patrick

--=20
http://www.petermair.com




