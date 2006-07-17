From: Jim Doble <jim.doble@tavve.com>
Subject: Local Routing without IP Aliasing
Date: Mon, 17 Jul 2006 16:48:47 -0400
Message-ID: <44BBF7AF.2090004@tavve.com>
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

I am trying to configure a Linux host to treat a potentially large range 
of IP addresses as "local", without having to define these addresses as 
aliases. When packets (UDP or TCP) arrive addressed to any of these 
addresses, I need these packets to be delivered locally (that is, 
treated as if they were addressed to the IP address of my Linux host, 
even though they were not), without losing knowledge of the original 
destination address and port. 
I am defining static routes in any other hosts that need to communicate 
with these addresses, in order to ensure that packets addressed to these 
addresses will be sent to my Linux host. The problem I am having is that 
these packets are being discarded in my Linux host, unless I redirect 
them to the address associated with my Linux host, in which case the 
original destination address is lost (except in the case of TCP, where 
there is a mechanism to recover it via getsockopt).

I would prefer to find a way to do this using iptables or routing 
configuration, or via a netfilter extension, if that is possible. Any 
advice would be appreciated.

Jim Doble
Tavve Software Company




