From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: a problem about NAT.
Date: Thu, 25 Sep 2003 15:38:28 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E51@alderaan.smgtec.com>
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
To: Chen Jian <ChenJ@yztech.com.cn>, netfilter@lists.netfilter.org

Too my knowledge, you can't have more than one Src,SrcPort,Dst,DstPort
match, so if they simultaneously connect to the same destination with
the same source, it won't work. I am not sure what Linux would do in
such circumstances. One idea would be to write a helper application that
uses other information in the packet's Layer 7 data to distinguish
between the three connections. But if it happens to be three HTTP
connections, there isn't any 'DNA' that can be used to tell the three
ports apart.

This can all be found in ip_conntrack.c and ip_conntrack_proto_tcp.c or
ip_conntrack_proto_udp.c. The NAT portion only kicks in after CONNTRACK,
so if CONNTRACK can't handle it, NAT won't either.

You're only solution may be to have each client connecting to the
destination on different (hard coded?) IP addresses.

-----Original Message-----
From: Chen Jian [mailto:ChenJ@yztech.com.cn]=20
Sent: Wednesday, September 24, 2003 7:08 AM
To: netfilter@lists.netfilter.org
Subject: a problem about NAT.

hi, all
There are 3 machine behind the NAT server. When the 3 machine request
the same Web server outside, NAT use 3 different source port to
distinguish the 3 connection.
My problem is when the 3 machine have the same source port , how
netfilter handle it ? I also want to know where the handle code is .
Thanks .
--

