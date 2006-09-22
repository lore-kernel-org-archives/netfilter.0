From: J Richard Glass <richard@mikeradford.org>
Subject: Using iptables with marks, fwmarks and ip tables and routes
Date: Fri, 22 Sep 2006 10:55:47 -0700
Message-ID: <cc2f7c40260241bbf8304b5c45fa29ef@localhost>
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

Hi,

I am hoping for some enlightenment

We have a dial-out server that will be establishing multiple ppp connections with remote ppp servers. In our case all the destination ip addresses are the same (same ips on different servers). 

To make sure packets go out the appropriate interface, we assign a temporary destination address that is associated with an interface. In the OUTPUT hook mangle table we mark the packet with a flag that will route it to its interface. The packet destination address is then translated (DNAT) to its real ip address and we use the mark to routes the packet out the correct interface.

Here are the commands we issue to iptables and ip:

iptables -v -t mangle -A OUTPUT -d 10.9.0.1  -j MARK --set-mark 11 
iptables -v -t nat -A OUTPUT -d 10.9.0.1  -j DNAT --to-destination 192.168.1.1

ip rule add fwmark 11 table 11
ip route add dev ppp0 table 11

Table of IP Addresses to Interface
10.9.0.1 => table 11 => ppp0
10.9.0.2 => table 12 => ppp1 etc.

We've gotten this to work with NICs using ethernet connections, but now we are starting with the modems and the ppp interfaces don't come up until connections are made. Since all the routing rules are static and determined beforehand, would it be possible to create placeholder ppp interfaces and then write iptables and ip rules using the placeholders? We'd prefer to have this set up independent of our software.

Thanks for the help.

-richard




