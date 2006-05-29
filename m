From: zottmann <zottmann@ig.com.br>
Subject: =?iso-8859-1?q?Packets_that_shouldn=B4t_be_dropped_=28conntrack?=
	=?iso-8859-1?q?=3F=29?=
Date: Mon, 29 May 2006 14:56:21 -0300
Message-ID: <20060529_175621_020315.zottmann@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Message-Boundary-by-Mail-Sender-1148925381"
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
To: netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--Message-Boundary-by-Mail-Sender-1148925381
Content-Type: text/plain; charset="iso-8859-1"
Content-description: Mail message body
Content-Transfer-Encoding: quoted-printable
Content-disposition: inline

Hi !!=20

We are noticing here a reasonable amount of packets that are being dropped,=
=20
that shouldn=B4t be.=20

These packets are originated at our web server, port 80, targeted at high=20
ports in external hosts, and have values set for both SEQ and ACK.=20

This scenario leads us to think that these packages are answers to accesses=
=20
that are being done to our web server, and that the response time is=20
actually greater than the iptables conntrack limit.=20

I think I recall reading something regarding to a problem with conntrack=20
some time ago, but didn=B4t find anything in the list archives.=20

We are running iptables v1.3.1 over a Fedora 3 with 2.6.11.12 SMP kernel.=20

Can anybody help me on this?=20

Thanks in advance,=20
Carlos.=20






--Message-Boundary-by-Mail-Sender-1148925381--


