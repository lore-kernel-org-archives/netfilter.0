From: Mikhail <misha@mhsystems.com>
Subject: DNAT for two external NIC
Date: Tue, 29 Aug 2006 17:42:35 -0400
Message-ID: <007301c6cbb4$0aa38c00$4764a8c0@mhsystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

=A0 I have Linux gateway/firewall with 3 NIC: eth0 =96 LAN, eth1 =96 =
ISP1, eth2 =96
ISP2.
I=92ve got separate static IPs from each of the ISP (IP1 & IP2) which I
statically assigned to eth1 and eth2.
My default route points to ISP1 gateway via eth1. I need to provide =
external
access to a few computers on the LAN using different IPs and port =
numbers
(no load balancing and target machines are IP-specific).=20
=A0 Everything works fine if I use IP1 address but I was unable to get =
to the
corresponding LAN machine through IP2. Ping requests are also not =
responded
if they=92re made to IP2. They do reach eth2 and I can see them using =
tcpdump
but then nothing goes out on any NIC. The same goes for TCP/IP requests =
=96
I=92ve managed to trace them to the nat table PREROUTING chain but they =
could
not be found in either INPUT or FORWARD chain of the mangle table. If I =
make
default route through eth2 =96 everything starts working through that =
NIC and
stops through eth1. I seem to be missing something simple. Any help is
greatly appreciated.

Mikhail.



