From: "moniacheli@tiscali.it" <moniacheli@tiscali.it>
Subject: packet filter rules updating
Date: Wed, 31 May 2006 17:56:07 +0200 (CEST)
Message-ID: <6770617.1149090967505.JavaMail.root@ps12>
Reply-To: "moniacheli@tiscali.it" <moniacheli@tiscali.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

This is my problem.
I have configured iptables for modifying ip source
of syslog packets outgoing from one of my router interfaces.
I have used these commands:
iptables -t mangle -A OUTPUT -p udp --dport 514 -j MARK --set-mark 13
iptables -t nat -A POSTROUTING -m mark --mark 13 -j SNAT --to-source=20
2.2.2.2

With the commands
iptables -t nat -L
iptables -t mangle -L
I can see that the previous rules have been correctly inserted and the=20
syslog=20
packets have the right ip source.
If I delete the previuos rules, I have no effect on syslog traffic and=20
also if I=20
give new iptables command with different ip source=20
(Es. iptables -t nat -A POSTROUTING -m mark --mark 13 -j SNAT --to-
source 3.3.3.3)
syslog pkt maintains the previous ip source (2.2.2.2) while no rule is=20
configured=20
with this ip.
Is there some iptables options that I have to give to force the rules=20
updating?
Thanks a lot for your collaboration!
Monia Cheli




=09=09
La gara pi=C3=B9 entusiasmante dell'anno!=20

Gioca e corri alla velocit=C3=A0 della luce sui 18 circuiti di Intel Speed =
Contest 2006!

I pi=C3=B9 bravi vincono Notebook Sony VAIO, iPod da 60 GB e altro ancora..=
.=20

Sfida gli amici!

http://intelspeedcontest2006.tiscali.it/=20
=09

