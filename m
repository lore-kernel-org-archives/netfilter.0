From: "Ferry van Steen" <ferry.van.steen@InfoPart.nl>
Subject: RE: measure traffic
Date: Wed, 9 Oct 2002 14:04:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D502122A1694B04EAE0F53D53CC2F764B2E8@exch2k-01.infopart.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: "Heupink, Mourik Jan C." <Heupink@INTECH.UNU.EDU>, Payal <payal@hotpop.com>, netfilter@lists.netfilter.org

Whow, I wouldn't know... But perhaps it counts everything it sees, that
doesn't mean that it only sees traffic that actually needs to be
bridged. I don't think such a difference comes from firewall rules alone
though, but if it does, you might be able to pick it up in the counters
of the firewall.

Regards


-----Oorspronkelijk bericht-----
Van: Heupink, Mourik Jan C. [mailto:Heupink@INTECH.UNU.EDU]=20
Verzonden: woensdag 9 oktober 2002 12:39
Aan: 'Payal'; netfilter@lists.netfilter.org
Onderwerp: RE: measure traffic

this is slightly off topic, but i'm asking anyway :)

when taking a look at the byte counters with ifconfig, i get the
following
results:

eth0      Link encap:Ethernet  HWaddr 00:60:08:6B:A2:FE
          UP BROADCAST RUNNING PROMISC MULTICAST  MTU:1500  Metric:1
          RX packets:16181723 errors:4 dropped:0 overruns:0 frame:0
          TX packets:17970946 errors:0 dropped:0 overruns:0 carrier:0
          collisions:581668 txqueuelen:100
          RX bytes:3686193757 (3515.4 Mb)  TX bytes:1361276683 (1298.2
Mb)
          Interrupt:11 Base address:0x6000

intech007:~ # ifconfig eth1
eth1      Link encap:Ethernet  HWaddr 00:60:08:6B:A2:1A
          UP BROADCAST RUNNING PROMISC MULTICAST  MTU:1500  Metric:1
          RX packets:18559613 errors:0 dropped:0 overruns:0 frame:0
          TX packets:16380728 errors:0 dropped:0 overruns:0 carrier:388
          collisions:184706 txqueuelen:100
          RX bytes:2205111742 (2102.9 Mb)  TX bytes:3719071392 (3546.7
Mb)
          Interrupt:9 Base address:0x6100

This machine is a bridging transparant firewall. eth1 is internet side,
and
eth0 is lan side.=20

Is it correct to assume, that the firewall rules in use reduced the
incoming
traffic from 2102.9 MB to 1298.2 MB?

Isn't that too big a reduction..? Am i making a thinking error here..?

Thanks for any replies.

Yours,
Mourik Jan



