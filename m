From: Antonio Di Bacco <antonio.dibacco@aruba.it>
Subject: PtP not working
Date: Sat, 20 May 2006 17:30:52 +0200
Message-ID: <200605201730.52334.antonio.dibacco@aruba.it>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Anyone could explain this?

Two linux systems connected:

System A =A0 =A0 <=3D=3D=3D=3D=3D=3D=3D=3D=3D> System B
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0eth0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0eth0

Each system ha the following config:

# routing enabled
net.ipv4.ip_forward=3D1

#ethernet with no address associated and NOARP set
eth0 =A0 =A0 =A0Link encap:Ethernet =A0HWaddr 08:00:3E:26:24:65
=A0 =A0 =A0 =A0 =A0 UP BROADCAST RUNNING NOARP MULTICAST =A0MTU:1500 =A0Met=
ric:1
=A0 =A0 =A0 =A0 =A0 RX packets:1306 errors:0 dropped:0 overruns:0 frame:0
=A0 =A0 =A0 =A0 =A0 TX packets:1325 errors:0 dropped:0 overruns:0 carrier:0
=A0 =A0 =A0 =A0 =A0 collisions:0 txqueuelen:1000
=A0 =A0 =A0 =A0 =A0 RX bytes:732864 (715.6 KiB) =A0TX bytes:61643 (60.1 KiB)
=A0 =A0 =A0 =A0 =A0 Base address:0x3c00

# Routing table
Kernel IP routing table
Destination =A0 =A0 Gateway =A0 =A0 =A0 =A0 Genmask =A0 =A0 =A0 =A0 Flags M=
etric Ref =A0 =A0Use Iface
10.10.10.10 =A0 =A0 * =A0 =A0 =A0 =A0 =A0 =A0 =A0 255.255.255.255 UH =A0 =
=A00 =A0 =A0 =A00 =A0 =A0 =A0 =A00 eth0


I'm on System A and try to ping 10.10.10.10 but no answer. Where is the=20
problem?

Bye,
Antonio.

