From: Arash Yadegarnia <arash@bluehome.net>
Subject: FWDing packets from a physical interface to a virtual interface
Date: Wed, 12 Sep 2007 02:06:53 +0330
Message-ID: <1189550213.14727.34.camel@Thinkpad>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi, :)

Here is the situation:

I have a machine with 2 NICs, assume eth0 (192.168.0.10) connected to my
LAN, and eth1 (192.168.0.20) connected to Internet through a gateway.
I also, have a virtual tap0 (TUN/TAP) interface (10.0.0.1) on this
machine.

All that I want to do is simply, forwarding ALL traffic coming to eth0
from the LAN, into my tap0 interface, So I can modify them using my own
user space program which can capture packets on the tap interface and
send them on eth1 to another address somewhere in the world (through
Internet).

Since I want IP addresses unchanged, I cannot use NAT or Masquerading.
As far as I know, In this matter forwarding should be done in Layer-2 so
I'm not sure if I can use iptables to do the job.
I also have tried bridging but I was trapped in a horrible bridge loop
(Enabling STP on bridge also didn't work for me).

Any ideas? :)

Thanks,
Arash


