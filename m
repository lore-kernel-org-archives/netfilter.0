From: "Scott Knake" <sknake@Apexsoftware.com>
Subject: RE: 2 NICs on same subnet
Date: Fri, 5 Nov 2004 08:00:11 -0500
Message-ID: <424BCB4EA242A1429A8AF0548E8CFF0E123964@apexexchange.ApexSoftware.Com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Well as far as outbound data that should be determined by your routing
table if I'm not mistaken. Maybe route -n will give you a clue but I
worked with someone on this same issue last night and never got to the
bottom of it. Be sure to post what you find :)

-Scott

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Sven
Schuster
Sent: Friday, November 05, 2004 7:39 AM
To: netfilter@lists.netfilter.org
Subject: 2 NICs on same subnet


Hi everybody,

I have a problem which I'm quite sure can be resolved easily, but
at the moment I'm lacking the "how" :-)
I have a machine (RH ES 3) with two Intel e1000 cards attached to
a gigabit switch, each interface is assigned an IP address on the
same subnet (say 1.2.3.4 on eth0 and 1.2.3.5 on eth1).
What's happening is that if a connection to either of these addresses
is made, it's always received via the same interface (eth1 most of the
time), and the replies go out via this interface, too. But what I'd
like is that packets to 1.2.3.4 come in via eth0 and packets to 1.2.3.5
come in via eth1 and that replies from 1.2.3.4 leave via eth0, from
1.2.3.5 via eth1.
I've already tried to resolve this issue with arptables, doing

arptables -N eth0
arptables -A eth0 -d 1.2.3.4 -j ACCEPT
arptables -A eth0 -j DROP
arptables -N eth1
arptables -A eth1 -d 1.2.3.5 -j ACCEPT
arptables -A eth1 -j DROP
arptables -A IN -i eth0 -j eth0
arptables -A IN -i eth1 -j eth1

and additionally limiting traffic in the same way by iptables, but
that doesn't work unfortunately.
Has anybody done this?? Is a solution to this problem known??


Thanks in advance!!

Sven

--=20
Linux zion 2.6.9-rc1-mm4 #1 Tue Sep 7 12:57:19 CEST 2004 i686 athlon
i386 GNU/Linux
 13:30:13 up 1 day, 16:58,  1 user,  load average: 0.08, 0.02, 0.01

