From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: SNAT issue for locally generated UDP packet
Date: Wed, 15 Jun 2005 10:16:44 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C4012717@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: baski@foundrynet.com, netfilter@lists.netfilter.org

Hi,

I think, that your rule does not make sense:=20

iptables -t nat -A POSTROUTING --protocol udp --source-port 5060 -j SNAT =
--to-source 5.5.5.7:1024-32000

You are trying to NAT a single port (5060) onto a range of ports =
(1024-32000). This will not work. NAT should be a many-many or =
single-single relationship. When many-many, ranges should be exactly the =
same size. It should be more like:

iptables -t nat -A POSTROUTING --protocol udp --source-port 5060 -j SNAT =
--to-source 5.5.5.7:1024

Cheers,

Sietse


________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Baskaran =
Mohandass
Sent: Tue 14/06/2005 22:01
To: netfilter@lists.netfilter.org
Subject: SNAT issue for locally generated UDP packet=20



Hi all,

      I am trying to source nat the packet generated locally using
iptables. Machine is running Fedora core2 and one of the interface
address is 5.5.5.7.  Sip server sends a packet with source port 5060 and
ip address 5.5.5.7. I want to change the IP address and the source port
when it goes out. Reading the IPtables manual only rule i can think of =
is
iptables -t nat -A POSTROUTING --protocol udp --source-port 5060  -j
SNAT --to-source 5.5.5.7:1024-32000.
[root@sipserver2 ~]# uname -a
Linux sipserver2.baski.com 2.6.9-1.667 #1 Tue Nov 2 14:41:25 EST 2004
i686 i686 i386 GNU/Linux
Unfortunately it does not work. IPtables also says that locally
generated packets are modified in the output chain and there is not NAT
capability in there. I went through all the messages in the archive for
SNAT and OUTPUT, So I would really appreciate any help on this. If there
is any patch available for this I am ready to try.

Thanks and Regards
..baski




