From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DHCRELAY through IPTABLES Firewall
Date: Tue, 29 Oct 2002 09:15:22 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021029091525.CVFB9836.mta01-svc.ntlworld.com@there>
References: <001001c27d72$1352c350$8f33e40f@lsmith5953> <200210281139.g9SBdPe08223@vulcan.rissington.net> <000b01c27f1d$f805e430$8f33e40f@lsmith5953>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000b01c27f1d$f805e430$8f33e40f@lsmith5953>
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
To: netfilter@lists.netfilter.org

On Tuesday 29 October 2002 7:37 am, bigman@monster-solutions.net wrote:

> here is how I ended up fixing my problem. However I have just discovered it
> only works with one client. When I try to get another client to obtain an
> IP it does not work. Any ideas? Is DNAT limiting me on one MAC to pass
> through or something? I am lost here.

Please can you confirm whether this works at all for a client which does not 
have an IP address to start with (ie it's not a renewal, or a request for the 
last IP address it had).   I don't see how it can work for a totally clean 
client.

> 1)    turned off DHCPD and DHCRELAY on firewall
> 2)    iptables -t nat -A PREROUTING -i eth2 -p udp --dport 67 -j
> DNAT --to-destination 192.168.1.70
> 3)    iptables -A FORWARD -p udp -m multiport --dport 67,68 -j ACCEPT

Okay, what this is doing is taking the original client's DHCP request, which 
has the following characteristics:
Source IP address = 0.0.0.0
Destination IP address = 0.0.0.0
Source MAC address = client's mac address
Destinaton MAC address = FF:FF:FF:FF:FF:FF

The broadcast MAC address means it gets to your firewall.

The PREROUTING rule then sets a destination IP address, and the normal 
routing system of Linux gives it a source MAC address = your Firewall, and a 
destination MAC address = the DHCP server.

The request gets to the server, it allocates an IP address based on the MAC 
address of your firewall (because that's where the local packet came from; 
remember MAC addresses only work within physical subnets), and sends the 
response back again.

The response has:
Source IP address = 192.168.1.70
Destination IP address = assigned DHCP address
Source MAC address = DHCP server
Destination MAC address = Firewall

Therefore the firewall receives the packet (because of the destination MAC 
address), forwards the packet on to the destination IP address (because of 
your rule 3), and the client gets an IP address.

The bit which I don't think can work unless the client already had an IP 
address (and the request was just a renewal, or a check that it could have 
the last IP address it had used again), is when the firewall sends the 
response back to the client, because unless the client responds to an ARP 
request from the firewall, how does the firewall know which MAC address to 
send the answer back to ?

I can say that this is definitely not the asnwer to your problem, because 
DHCP requests & responses with definitely break across a router (such as a 
netfilter firewall) simply because of what happens to the MAC addresses.

If you want to allocate addresses on one subnet from a DHCP server on another 
subnet you must use DHCRELAY.

Antony.

-- 

It is also possible that putting the birds in a laboratory setting
inadvertently renders them relatively incompetent.

 - Daniel C Dennett

