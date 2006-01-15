From: =?ISO-8859-15?Q?J=F6rg_Sch=FCtter?= <netfilter@schuetter.org>
Subject: Problems w/ ipv6 and stateful inspection
Date: Sun, 15 Jan 2006 19:39:47 +0100
Message-ID: <20060115193947.799af1c4@pluto.priv.schuetter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi

after a brake of some month for ipv6 I tried it again (after
reading that steteful inspection is now in 2.6.15).
I'm using tun6to4 as my tunnel device and have problems setting
the access lists right.
OUTPUT
ACCEPT  all  *  tun6to4  ::/0  ::/0  state  NEW
never get's any hit, all traffic uses
ACCEPT  all  *  tun6to4  ::/0  ::/0
w/o any state parameter

And the same problem for the incomming traffic:
INPUT
DROP  all  tun6to4  *  ::/0  ::/0  state INVALID
had to be removed, otherwise no package was allowed to travel

LOG  all  tun6to4  *  ::/0  ::/0  state INVALID LOG flags 0 level 4
has a lot of hits, eg
IN=3Dtun6to4 OUT=3D MAC=3D... TUNNEL=3D192.88.99.1->...
SRC=3D2001:06b0:0001:00ea:0202:a5ff:fecd:13a6 DST=3D... LEN=3D104 TC=3D0
HOPLIMIT=3D54 FLOWLBL=3D0 PROTO=3DICMPv6 TYPE=3D129 CODE=3D0 ID=3D16439 SEQ=
=3D1
as the anwser to ping6 www.ipv6.org

Any idea what's wrong with my config?

I'm running 2.6.15-mm4 w/ iptables 1.2.9 on Debian unstable on a
machine behind a router (router is doing nat).


J=F6rg

--=20
J=F6rg Sch=FCtter                      http://www.schuetter.org/joerg
joerg@schuetter.org                http://www.lug-untermain.de/

