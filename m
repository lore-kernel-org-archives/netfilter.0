From: Bill Davidsen <davidsen@tmr.com>
Subject: Re: iptables problems with SuSE 8.0
Date: Thu, 13 Mar 2003 14:48:42 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.3.96.1030313144018.32436D-100000@gatekeeper.tmr.com>
References: <FFEKLFAFFPMEICKNCBGAMEFKCDAA.trenkler@syn-con.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FFEKLFAFFPMEICKNCBGAMEFKCDAA.trenkler@syn-con.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steffen Trenkler <trenkler@syn-con.de>
Cc: "(iptables) English Mailing-List Netfilter" <netfilter@lists.netfilter.org>

On Thu, 13 Mar 2003, Steffen Trenkler wrote:

> My English is not so very well, but I try to explain my problem with
> iptables:
> 
> I got a system with SuSE 8.0. It works as a router with an iptables script
> between 2 static LANs. The Script does it very well, but sometimes it
> happens that all connections from one LAN to the other are blocked suddenly.

The output below shows clearly shows that you are having system problems,
not iptables problems. In approximate order of probability:
  1 - hardware problem in the NIC
	If the driver was bad it would probably happen on both NICs.
	If it does happen on both NICs skip this idea.
	Can you swap NICs and see if the problem moves?
  2 - driver problem
	Unless there is a newer driver or kernel available, you may have
	to change to another brand of NIC. Sorry.
  3 - cable problem
	I had a bad cable cause the connection to drop once in a while.
	Check that all cables are firmly plugged in.

> /var/log/messages and /var/log/firewall shows the following:
> 
> fw  kernel: eth0: Transmit timed out, status 00, resetting...
> fw kernel:      Rx ring c071a000: 00000000 00000000 00000000 00000000 ...
> fw kernel:      Tx ring c071b000: 80008001 80008005 80008009 8000800d
> 80008011 ...
> 
> and then:
> 
> fw kernel: PACKET DROPPED: .....
> fw kernel: PACKET DROPPED: .....
> fw kernel: PACKET DROPPED: .....
> ...
> 
> The error-message repeats periodically for a few seconds.
> 
> There are 2 same NICs in that system: D-Link DFE-550TX.
> 
> After rebooting the system, the firewall works fine again, 'cause the script
> is loaded at booting the system.
> 
> Thx 4 help
> 
> Steffen Trenkler
> 
> Note: Is there any german-language iptables list?
> 
> 
> 

-- 
bill davidsen <davidsen@tmr.com>
  CTO, TMR Associates, Inc
Doing interesting things with little computers since 1979.


