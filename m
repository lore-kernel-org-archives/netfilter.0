From: "Mario Ohnewald" <mario.Ohnewald@gmx.de>
Subject: /sbin/iptables -vnxL OUTPUT
Date: Tue, 2 Mar 2004 17:47:03 +0100 (MET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <12247.1078246023@www57.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
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
To: netfilter@lists.netfilter.org

Hello!
I have got a iptables firewall running and i want to monitor my traffic,
therefore i played arund with the following command:   /sbin/iptables -vnxL
OUTPUT | grep "Chain OUTPUT"
It worked fine, although, after a while it kept getting the result:
Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
I reloaded the filter rules, still the same.


Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source              =

destination
       9     2051 ACCEPT     all  --  *      lo      0.0.0.0/0          =20
0.0.0.0/0
       0        0 ACCEPT     icmp --  *      *       0.0.0.0/0          =20
0.0.0.0/0           icmp type 11
       2      132 ACCEPT     icmp --  *      *       0.0.0.0/0          =20
0.0.0.0/0           icmp type 3 code 3
       0        0 DROP       icmp --  *      *       0.0.0.0/0          =20
0.0.0.0/0           icmp type 3
    9535  2685876 ACCEPT     all  --  *      *       0.0.0.0/0          =20
0.0.0.0/0           state NEW,RELATED,ESTABLISHED
       0        0 LOG        all  --  *      *       0.0.0.0/0          =20
0.0.0.0/0           LOG flags 6 level 4 prefix `SuSE-FW-OUTPUT-ERROR '

dory:/home/sts/# /sbin/iptables -vnxL OUTPUT
Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source              =

destination
       9     2051 ACCEPT     all  --  *      lo      0.0.0.0/0          =20
0.0.0.0/0
   10140  2866335 ACCEPT     all  --  *      *       0.0.0.0/0          =20
0.0.0.0/0           state NEW,RELATED,ESTABLISHED
       0        0 LOG        all  --  *      *       0.0.0.0/0          =20
0.0.0.0/0           LOG flags 6 level 4 prefix `SuSE-FW-OUTPUT-ERROR '

dory:/home/sts/# /sbin/iptables -vnxL OUTPUT
Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source              =

destination
       9     2051 ACCEPT     all  --  *      lo      0.0.0.0/0          =20
0.0.0.0/0
       0        0 ACCEPT     icmp --  *      *       0.0.0.0/0          =20
0.0.0.0/0           icmp type 11
   12236  3394902 ACCEPT     all  --  *      *       0.0.0.0/0          =20
0.0.0.0/0           state NEW,RELATED,ESTABLISHED
       0        0 LOG        all  --  *      *       0.0.0.0/0          =20
0.0.0.0/0           LOG flags 6 level 4 prefix `SuSE-FW-OUTPUT-ERROR '



How come it wont count up the Accepted packaged and Bytes?
If you need any more infos, please tell me!


Thanks, Mario!

--=20
+++ NEU bei GMX und erstmalig in Deutschland: T=DCV-gepr=FCfter Virenschutz=
 +++
100% Virenerkennung nach Wildlist. Infos: http://www.gmx.net/virenschutz


