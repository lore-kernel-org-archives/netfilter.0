From: Ben Yerushalmi <beny@pd.verio.net>
Subject: Re: Redirect ports on localhost
Date: Tue, 23 Mar 2004 22:15:02 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <343604D8-7D52-11D8-980E-000A957E9214@pd.verio.net>
References: <406099AD.2070403@verio.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <406099AD.2070403@verio.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I have bind listening on port 5300 so named.conf isn't the problem.

I've been using tcpdump to try and troubleshoot the packets. Both the 
source and destination of the packet are localhost. I noticed that by 
changing the OUTPUT (and enabling "NAT_LOCAL" in my linux 2.4.25 
kernel), tcpdump is fooled into thinking the packet is headed to port 
5300 but I think by that point the packet has passed the application 
layer and bind doesn't see the packet.

Also, I have the filter table accepting EVERYTHING.

# iptables -L -vn
Chain INPUT (policy ACCEPT 18907 packets, 1521K bytes)
  pkts bytes target     prot opt in     out     source               
destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source               
destination

Chain OUTPUT (policy ACCEPT 18208 packets, 2540K bytes)
  pkts bytes target     prot opt in     out     source               
destination

#

On Mar 23, 2004, at 1:10 PM, Ben Yerushalmi wrote:

> Hi,
>
> I'm trying to redirect traffic on my DNS server. I have bind listening 
> on port 5300 (UDP) instead of 53. I've got it working from the 
> internal network but seem to have problem on redirecting localhost 
> traffic. I've tried changing both PREROUTING and OUTPUT chains in the 
> nat table but it doesn't seem to help.
>
> iptables -A PREROUTING -t nat -p udp -i lo --dport domain -j REDIRECT 
> --to-ports 5300
>
> and
>
> iptables -A OUTPUT -t nat -p udp -d localhost  --dport domain -j 
> REDIRECT --to-ports 5300
>
>
> Anyone have luck doing this? What am I missing?
>
> Thanks,
> Ben
>
>


