From: "Ranjeet Shetye" <ranjeet.shetye@zultys.com>
Subject: RE: UDP packet forwarding
Date: Mon, 23 Dec 2002 11:13:54 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003201c2aab7$6faea9d0$0100a8c0@zultys.com>
References: <5.1.0.14.1.20021220172335.01d43550@144.135.24.13>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.1.0.14.1.20021220172335.01d43550@144.135.24.13>
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


Two questions:

1. Does your UDP rule use "-p udp" ?

2. Do you have something up and listening on port 113 of the target
machine that you are port-forwarding to ?

Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
771 Vaqueros Avenue
Sunnyvale  CA  94085
USA
Ranjeet.Shetye@Zultys.com
http://www.zultys.com/

 


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Colin
> Sent: Thursday, December 19, 2002 10:32 PM
> To: netfilter@lists.netfilter.org
> Subject: UDP packet forwarding
> 
> 
> Hi,
> 
> I am running Linux Kernel 2.4.20 and iptables 1.2.7a, with a 
> Linux server 
> doing primarly SNAT work for masquerading. I don't seem to be able to 
> forward UDP packets with iptables. I am able to forward TCP 
> packets through 
> the firewall, such as identd requests, like so:
> 
> iptables -t nat -A PREROUTING -j DNAT -p tcp --destination-port 113 
> --to-destination xxx.xxx.xxx.xxx
> 
> What I'm doing here is forwarding a packet from an external 
> system to a 
> machine on an internal network, so that it can answer an 
> identd request. 
> The above works fine for that. However, it doesn't seem to 
> work for UDP 
> packets. Even when I forward all data from the source IP 
> address to an 
> internal host (as opposed to limiting it by 
> --destination-port), the UDP 
> data refuses to be forwarded, and my linux machine sends out 
> ICMP port 
> unreachable errors to the external machine. No data is sent 
> across the 
> local ethernet at all.
> 
> Is there any reason for this? Anything I'm doing wrong or can 
> change to 
> correct it? Any help would be greatly appreciated.
> 
> 


