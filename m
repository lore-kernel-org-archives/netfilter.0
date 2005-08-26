From: Clemens Eisserer <linuxhippy@gmail.com>
Subject: Two network cards - routing and iptables
Date: Fri, 26 Aug 2005 16:55:47 +0200
Message-ID: <194f625505082607553b1d3f95@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

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
LKLET021.highwa *               255.255.255.255 UH    0      0        0 ipp=
p0
192.168.1.0     *               255.255.255.0   U     0      0        0 eth=
1
192.168.0.0     *               255.255.255.0   U     0      0        0 eth=
0
default         LKLET021.highwa          UG    0      0        0 ippp0
m

Furthermore it would be great if I could use this computer as a
gateway for all computers in 192.168.0.0/24 and 192.168.1.0/24 so that
each computer in this net could reach each other. I tried to configure
iptables a bit, but withought any success :-(

It would be great if anybody could help me, I know those are
newbie-questions, sorry.

Thank you in advance, lg Clemens

