From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: failover with iptables?
Date: Wed, 11 Sep 2002 14:10:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209111410.14005.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter mailinglist <netfilter@lists.netfilter.org>

hi

I currently have two identical servers I want to use in parallel with an=20
iptables gate in front of them, so if one chrashes, iptables just sorts o=
ut=20
and redirects to the other.

but

is it possible to make the below (as stolen from various cisco sketches) =
with=20
iptables?

If iptab_1 fails, iptab_2 should take over ip and (perhaps) mac address o=
f=20
iptab_1.=20

ps: I don't think I need connection tracking.=20

roy


         clients

     |               |       =20
     |               |
+----+----+     +----+----+
|         |     |         |
| iptab_1 |     | iptab_2 |
|         |     |         |
+----+----+     +----+----+
     |     \   /     |       =20
     |      \ /      |
     |       X       |       =20
     |      / \      |
     |     /   \     |
+----+----+     +----+----+
|         |     |         |
| server1 |     | server2 |
|         |     |         |
+---------+     +---------+
    =20
--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


