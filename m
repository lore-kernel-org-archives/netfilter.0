From: "=?UTF-8?B?ZGF2b3Iga3JhYsWhZQ==?=" <davork@email.si>
Subject: Ipsec-l2tp-Iptables trouble
Date: Sun,  7 Nov 2004 02:21:17 +0100
Message-ID: <200411070121.iA71LHaW023909@www2.email.si>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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


Hi,

I have read some posts on that list about my problem, but I do not now how =
to=20
solve it. I have the following configuration:

    winXp L2TP Client(Internet) ---> Linux FW --> WIn2K Server[RAS](Lan)

If I disable ipsec on xp, on Linux FW and on RAS Server, I can succesfuly=
=20
connect from xp to RAS server over L2TP using only this:

 iptables -t nat -A PREROUTING -i eth1 -p udp --dport 1701 -j DNAT --to=20
192.168.0.111:1701

where eth1 is Internet nic in Linux FW.=20
If I enable ipsec on xp and on Linux (openswan, kernel 2.4.27), while RAS s=
till=20
accepts only unencrypted packets, xp and Linux FW connects over ipsec with =
no=20
problem. The problem is, unencrypted packets don't destinate to RAS server.=
=20
AFAIK, I get unencrypted packets on ipsec0 device, so I just transform the=
=20
previous rule into:

iptables -t nat -A PREROUTING -i ipsec0 -p udp --dport 1701 -j DNAT --to=20
192.168.0.111:1701.

But it does not work. Ipsec session is between xp and Linux is established,=
 but=20
RAS server timeouts. I suspect that my prerouting rule is causing me troubl=
es...


Can anyone help?


Regards, Davor



____________________
http://www.email.si/

