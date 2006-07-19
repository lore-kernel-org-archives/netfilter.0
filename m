From: Daniel Drake <dsd@gentoo.org>
Subject: Struggling with NAT: is PREROUTING working at all?
Date: Wed, 19 Jul 2006 15:25:26 +0100
Message-ID: <44BE40D6.90108@gentoo.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I have a network setup of:

Internet
  |
  |
ADSL ROUTER
external IP 1.2.3.4
internal IP 192.168.1.1, runs DHCP server on this network
  |
  |
LINUX SYSTEM
'external' IP 192.168.1.200 (eth1)
internal IP 192.168.0.200 (eth0)
Runs SOCKS proxy
  |
  |
INTERNAL NETWORK
Various internal clients at 192.168.0.x
Internal clients use SOCKS proxy for internet access
Main server at 192.168.1.1 running DHCP daemon

In other words, I don't trust the router, so I have partitioned it off 
in its own little network to the Linux system (192.168.1.x). I do not 
run MASQ/NAT on the 192.168.0.x network, so the internal clients use the 
socks proxy for external network access.

I have enabled DMZ mode on the router, but this isn't exactly what I 
thought a DMZ was. It just means that all 'unknown' ports are forwarded 
to the linux system - there is still some NAT going on between the 
router and linux system.

Now, what I want is port forwarding between internet and internal: I 
want to run a service on an internal machine and have it accessible to 
the outside world, i.e. I want to forward 1.2.3.4:5678 to 
192.168.0.32:9876 (TCP).

These are two separate networks only linked by the Linux system in the 
middle, so I want to use this to perform the required translations. I've 
successfully set up port forwarding on slightly less confusing networks 
in the past, but I've spent several hours struggling on this one without 
any luck.

The connections get through the router fine, but I'm having problems 
where it seems PREROUTING doesn't take effect: I can accept the 
connections on the Linux box (even when PREROUTING rules are in place).

I took a step back and re-read the iptables man page. It says that the 
nat table is consulted whenever a new connection is about to be 
established, and PREROUTING is used when packets come in, so I'd expect 
this rule to give me a lot of output:

     iptables -t nat -A PREROUTING -j LOG

But, I get nothing, even when successfully establishing a new connection 
from the outside to the linux system. Logging is definitely working 
since I can get logs from other rules.

No other rules are in place before this one, my script simply clears all 
tables/chains, sets all policies to ACCEPT, then runs the above command.

Am I missing something, or PREROUTING not triggering when it should be?

Thanks,
Daniel


