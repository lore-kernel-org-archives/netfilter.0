From: Delian Krustev <krustev@krustev.net>
Subject: MASQUERADE: Route sent us somewhere else
Date: Thu, 4 Mar 2004 22:11:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403042211.21740.krustev@krustev.net>
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
To: netfilter@lists.netfilter.org

Hi,

I've red the postings about similar messages in the syslog posted in the
mailing list. However my problem is quite different. Here's the setup:

                                 eth1
              eth0  +---------+ static ip=20
   *LAN* -----------|         |-------- \
                    |linux-box|           *INTERNET*
                    |         |-------- /
                    +---------+  eth2
                              dhcp configured


*mangle
-A FORWARD -j MARK --set-mark 0x1

*nat
-A POSTROUTING -o eth1 -j SNAT --to-source <eth1 ip>
-A POSTROUTING -o eth2 -j MASQUERADE

/sbin/ip ru add fwmark 0x1 lookup FW prio 40

The main table routes internet traffic via eth2 by default. I'me referenc=
ing
the FW table for forwarded traffic, which routes inet traffic via eth1.

However, the SNAT rule in the nat table is ignored(eth1 is not
correctly selected) and the MASQUERADE rule takes place. The packets
are not sent trough eth2 either, and here comes the syslog msg:

MASQUERADE: Route sent us somewhere else

I'm using similar setup for localy generated packets(

*mangle
-A OUTPUT -o eth2 -m owner --uid-owner dev -j MARK --set-mark 0x1

), which works just fine.

Currenly I'm able to workaround the problem by adding the following rule =
:

/sbin/ip ru add iif eth0 lookup FW prio 45   # [1]

I think there should be two routing decigions(RD) for forwarded packets:

-->PREROUTING-->RD1-->FORWARD-->RD2-->POSTROUTING

, right ?
At least it's that way for the OUTPUT chain. My additional rule [1],
makes both the RDs refer to the same table - FW. Without it the main
table is refered by RD1 and FW by RD2, which breaks the things down.

I'm running kernel 2.4.24 with all the submitted/pending patches from=20
p-o-m 20030912 applied.

Any ideas ?

Cheers,
Delian

p.s. please CC me when replying since I'm not subscribed to the list.

