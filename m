From: JinHyung Park <jinhyung@gmail.com>
Subject: I wanna make a new target like SNAT..
Date: Thu, 14 Jul 2005 07:24:28 +0900
Message-ID: <9b2a1cff05071315243f973f68@mail.gmail.com>
Reply-To: JinHyung Park <jinhyung@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

hi..
 i want to make a new target that works like SNAT, but M:N SNAT..
 i mean, there are 50 computers and each has a private ip like 192.168.0.x.=
.
 10 computers need a specific ip of my 50 real ip.
 so, i want that computers to give given range IPs, and another computers=
=20
follow anoter iptables rule.
 for example, i have 1.1.1.1~1.1.1.50 ip, and 1.1.1.1~1.1.1.10 is special=
=20
IPs..
 and my 50 computers has a private network, 192.168.0.1~192.168.0.50,
 some computer that need specific IP assign ( range 1.1.1.1~1.1.1.10 ) and=
=20
another 40 computers just follow other iptables rule..
 (like,
iptables -t nat -A POSTROUTING -d 192.168.0.1-192.168.0.50 -j NEWTARGET --t=
o=20
1.1.1.1-1.1.1.10
 and, if all 1.1.1.1-1.1.1.10 are used, other private computer follow=20
another rule.. )
 i checked ipt_NETMAP.c, just my thought, make a newtarget likes NETMAP wit=
h=20
idea like ip pool, but i don know how to pass the next rule if all=20
1.1.1.1-1.1.1.10 are used. if there is no IP, just return NF_ACCEPT ? ;;=20
 does I make a sense?
 please help me...

--=20
-----------------------------
+82-10-3161-0419 (Korea,South)
jinhyung@gmail.com
-----------------------------
