From: "k bah" <kbah@linuxmail.org>
Subject: UDP packets are not being forwarded to pc on the local net.
Date: Thu, 17 May 2007 07:14:36 +0800
Message-ID: <20070516231436.19B8CCA0A4@ws5-11.us4.outblaze.com>
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



 My machine is the network router, and a friend is using Winxp, her ip addr=
ess is 10.1.1.15. My machine is 10.1.1.1.
 Ip forwarding is set correctly, that and other machines can browse the web=
, use IM clients, etc.

 eth0 is internet
 eth1 is local network

 My main problem is that udp packets are not being sent to 10.1.1.15. She c=
an connect to the ed2k server, www.amule.org/testport.php shows a Success m=
essage when I try it from 10.1.1.1 or 10.1.1.15 with port 41001.

 TCP ed2k port for 10.1.1.15 is 41001, udp are 10.1.1.2 and 10.1.1.4. When =
I sniff the network, no udp is showing, and the big problem: *no downloads =
or uploads*, even with highid. Some of these rules are redundant, but I'm t=
esting so don't mind if things are "being said" on the rules twice.

 What's wrong:(?)
-------
*raw
:PREROUTING ACCEPT [3135966:1535838293]
:OUTPUT ACCEPT [2940578:1198730628]
COMMIT
*mangle
:PREROUTING ACCEPT [3135989:1535842939]
:INPUT ACCEPT [2997535:1491703469]
:FORWARD ACCEPT [138406:44126734]
:OUTPUT ACCEPT [2940592:1198731862]
:POSTROUTING ACCEPT [3078998:1242858596]
COMMIT
*filter
:INPUT ACCEPT [2709921:1398713255]
:FORWARD ACCEPT [138406:44126734]
:OUTPUT ACCEPT [2940578:1198730628]
-A INPUT -i eth0 -p icmp -j ACCEPT=20
-A INPUT -p tcp -m state --state RELATED -j ACCEPT=20
-A INPUT -p udp -j ACCEPT=20
-A INPUT -i eth0 -p tcp -m tcp --dport 41001 -m state --state NEW,RELATED,E=
STABLISHED -j ACCEPT=20
-A INPUT -i eth0 -p udp -m udp --dport 41002 -m state --state NEW,RELATED,E=
STABLISHED -j ACCEPT=20
-A INPUT -i eth0 -p udp -m udp --dport 41004 -m state --state NEW,RELATED,E=
STABLISHED -j ACCEPT=20
-A INPUT -i eth0 -p udp -m udp --dport 41004 -m state --state NEW,RELATED,E=
STABLISHED -j ACCEPT=20
-A INPUT -i eth0 -p udp -m udp --dport 41004 -j ACCEPT=20
-A INPUT -i eth0 -p udp -m udp --dport 41002 -j ACCEPT=20
COMMIT
*nat
:PREROUTING ACCEPT [56355:4155510]
:POSTROUTING ACCEPT [427517:15872653]
:OUTPUT ACCEPT [427469:15869989]
-A PREROUTING -i eth0 -p udp -m udp --dport 41002 -j DNAT --to-destination =
10.1.1.15:41002=20
-A PREROUTING -i eth0 -p tcp -m tcp --dport 41001 -j DNAT --to-destination =
10.1.1.15:41001=20
-A PREROUTING -i eth0 -p udp -m udp --dport 41002 -j DNAT --to-destination =
10.1.1.15:41002=20
-A PREROUTING -i eth0 -p udp -m udp --dport 41004 -j DNAT --to-destination =
10.1.1.15:41004=20
-A POSTROUTING -s 10.1.1.0/255.255.255.0 -o eth0 -j MASQUERADE=20
COMMIT
-------

 thanks,

 kbah

=3D


--=20
Powered by Outblaze

