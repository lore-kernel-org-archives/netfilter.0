From: "Steffen Trenkler" <trenkler@syn-con.de>
Subject: iptables problems with SuSE 8.0
Date: Thu, 13 Mar 2003 11:21:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FFEKLFAFFPMEICKNCBGAMEFKCDAA.trenkler@syn-con.de>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: "(iptables) English Mailing-List Netfilter" <netfilter@lists.netfilter.org>

Hi,

I'm new here in this list.

My English is not so very well, but I try to explain my problem with
iptables:

I got a system with SuSE 8.0. It works as a router with an iptables script
between 2 static LANs. The Script does it very well, but sometimes it
happens that all connections from one LAN to the other are blocked suddenly.

/var/log/messages and /var/log/firewall shows the following:

fw  kernel: eth0: Transmit timed out, status 00, resetting...
fw kernel:      Rx ring c071a000: 00000000 00000000 00000000 00000000 ...
fw kernel:      Tx ring c071b000: 80008001 80008005 80008009 8000800d
80008011 ...

and then:

fw kernel: PACKET DROPPED: .....
fw kernel: PACKET DROPPED: .....
fw kernel: PACKET DROPPED: .....
...

The error-message repeats periodically for a few seconds.

There are 2 same NICs in that system: D-Link DFE-550TX.

After rebooting the system, the firewall works fine again, 'cause the script
is loaded at booting the system.

Thx 4 help

Steffen Trenkler

Note: Is there any german-language iptables list?



