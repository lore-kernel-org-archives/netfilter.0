From: andilist@gmx.de
Subject: Passed chains from local process to local ip
Date: Mon, 26 Jul 2004 08:27:28 +0200 (MEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <23413.1090823248@www51.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hello,
which chains are passed from packets, generated from a local process with a
local ip as destination(not 127.0.0.1, but ip-address of a local network
interface).

Is it OUTPUT -> POSTROUTING -> PREROUTING -> INPUT, or is it directly?

my network interface has 5 ip-adresses. If have 2 daemons (say A and B)
running on 2 different local ip-Addresses (ip-A and IP-B) on the same port.
It's not possible to run a deamon on 2 or more addresses. so i need to
forward ip-c, ip-d and ip-e to ip-a.

ip-a -> A
ip-b -> B
ip-c -> ip->a -> A
ip-d -> ip->a -> A
ip-e -> ip->a -> A

it works allready from packets from remote hosts (with dnat and prerouting),
but not from local packets. to use dnat for local packets in the output
chain i read that i must update the kernel and install a new version of
iptables. but i am not sure, if this will work, because the packets are for
a local ip-address and not for a remote destination.

Thanks for your help,
Andreas



-- 
+++ GMX DSL-Tarife 3 Monate gratis* +++ Nur bis 25.7.2004 +++
Bis 24.000 MB oder 300 Freistunden inkl. http://www.gmx.net/de/go/dsl


