From: "Daniel Williams" <danielw@staff.iinet.net.au>
Subject: Injecting Promisc packets into Routing Table
Date: Wed, 9 Aug 2006 01:06:56 +0800
Message-ID: <5B0731A8753509478386ED3D6513B2D101D5CE39@isp-per-exch01.win2k.iinet.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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

I have a Cisco switch port that is sending me packets into one interface
as part of a span / switch port data mirroring.

By turning on 'promisc' for the interface the interface starts seeing
all the traffic, however the data does not appear to travel through the
mangle table.

Remembering the MAC / IP and Nexthop will not line up with the data on
this box is their a way to route this traffic out a pptp/pp interface
for remote analysing.=20

Daniel



