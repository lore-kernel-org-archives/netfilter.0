From: xchris <lyra@fastwebnet.it>
Subject: Strange question
Date: Fri, 25 Apr 2003 09:52:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304250952.52030.lyra@fastwebnet.it>
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

I have a strange question.
Maybe i'm a little bit OT... but i think that here is the only place wher=
e i=20
can find the solution.

Here is my net



eth0      Link encap:Ethernet  HWaddr 00:08:74:4F:59:90
          inet addr:1.17.192.121  Bcast:1.17.192.255  Mask:255.255.255.0
          inet6 addr: fe80::208:74ff:fe4f:5990/10 Scope:Link
          UP BROADCAST NOTRAILERS RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:13434 errors:0 dropped:0 overruns:0 frame:0
          TX packets:10258 errors:0 dropped:0 overruns:0 carrier:0
          collisions:3472 txqueuelen:100
          RX bytes:12774051 (12.1 Mb)  TX bytes:1425533 (1.3 Mb)
          Interrupt:24 Base address:0xdcc0 Memory:ff6e0000-0

ppp0      Link encap:Point-to-Point Protocol
          inet addr:62.98.28.48  P-t-P:212.245.47.230  Mask:255.255.255.2=
55
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
          RX packets:42 errors:1 dropped:0 overruns:0 frame:0
          TX packets:8 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3
          RX bytes:1235 (1.2 Kb)  TX bytes:205 (205.0 b)


I disabled lo for testing.

Let say i want to contact 62.98.28.48 passing through eth0 and not direct=
ly=20
(that's why i disabled lo .... without success)

lyra:/etc/ppp # ip route show

62.98.28.48 dev eth0  scope link
192.168.0.0/24 dev vmnet8  proto kernel  scope link  src 192.168.0.1
192.168.0.0/24 dev vmnet1  proto kernel  scope link  src 192.168.0.1
1.17.192.0/24 dev eth0  proto kernel  scope link  src 1.17.192.121
default dev eth0  scope link

I tried to modify my route like this... but it doesn't work!

Yes... i know it is a strange question.What i'm trying to do is to contac=
t my=20
machine trhough another internet access!! weird!! (believe me... it has a=
=20
sense :)

Could netfilter help me?

Thank you


