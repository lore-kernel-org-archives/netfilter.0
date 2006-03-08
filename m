From: Chinh Nguyen <cnguyen@certicom.com>
Subject: Re: source nat does'nt work in bridge mode
Date: Wed, 08 Mar 2006 10:06:13 -0500
Message-ID: <440EF2E5.60102@certicom.com>
References: <3115d56e0603080251s485040f2n3bbcdb825363c752@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3115d56e0603080251s485040f2n3bbcdb825363c752@mail.gmail.com>
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


afshin lamei wrote:
> dear all, I've a linux box with iptables which is working in bridge
> mode. I want to change (NAT) the source IP of the outging packets,
> using:
> iptables -t nat -A POSTROUTING -s 192.168.100.100 -j SNAT --to-source
> 192.168.100.1
> the rule works correctly (source nat is done), but the client
> (192.168.100.100) does not revieve any packet of the reply. sniffing
> the outgoing traffic shows that the next hop can not find the client
> with translated IP (192.168.100.1). what should I do?
> regards
> afshin
> 

How can 100 receive the reply? Supposing you send a packet to 101. Because of
SNAT, 101 receives the packet from 1. When it tries to send the reply back, as 1
is on the same subnet, 101 will attempt to ARP the MAC address of 1. Since there
is no such machine, the reply is not sent out. (Note that if there is a 1
machine, the reply will go to it and still not to 100).

You might be able to solve this by adding an alias to your interface. For
example, "ip addr add 192.168.100.1/24 dev eth0". In this case, your 100 machine
may respond to an ARP request of 192.168.100.1.


