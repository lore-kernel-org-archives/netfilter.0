From: "Harrison, Bruce (CXO)" <Bruce.Harrison@hp.com>
Subject: RE: Two network cards - routing and iptables
Date: Fri, 26 Aug 2005 09:24:52 -0600
Message-ID: <2F75680A268354469586578F0712182AB552D4@CXOEXC12.AMERICAS.CPQCORP.NET>
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
To: Clemens Eisserer <linuxhippy@gmail.com>
Cc: netfilter@lists.netfilter.org


Hello Clemens,

    For issue 1, perhaps you are blocking ICMP traffic on eth1?
    For issue 2, ip_forward needs to be set to a 1 (not part of
iptables).

Take Care!


Bruce...


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Clemens
Eisserer
Sent: Friday, August 26, 2005 8:56 AM
To: netfilter@lists.netfilter.org
Subject: Two network cards - routing and iptables

Hi there,

I've just discovered the power of iptables and it just works well in
my selfbuilt isdn router. However now I also want to route between two
subnets and it just does not work.

I've two network cards in the pc:
eth0 - 192.168.0.1
eth1 - 192.168.1.2

when I try to ping another computer connected to 192.168.0.0/24
everything works fine, however I cannot ping my access-point in
192.168.1.0/24 (which works from a stand-alone computer withought any
problems).

This are my routes:
LKLET021.highwa *               255.255.255.255 UH    0      0        0
ippp0
192.168.1.0     *               255.255.255.0   U     0      0        0
eth1
192.168.0.0     *               255.255.255.0   U     0      0        0
eth0
default         LKLET021.highwa          UG    0      0        0 ippp0
m

Furthermore it would be great if I could use this computer as a
gateway for all computers in 192.168.0.0/24 and 192.168.1.0/24 so that
each computer in this net could reach each other. I tried to configure
iptables a bit, but withought any success :-(

It would be great if anybody could help me, I know those are
newbie-questions, sorry.

Thank you in advance, lg Clemens


