From: Bill Tangren <bjt@aa.usno.navy.mil>
Subject: Re: DMZ problems
Date: Thu, 25 Jan 2007 17:22:09 -0500
Message-ID: <45B92D91.8070500@aa.usno.navy.mil>
References: <45B12F3B.5020306@aa.usno.navy.mil> <45B61EAB.1040706@pason.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45B61EAB.1040706@pason.com>
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
Cc: netfilter@lists.netfilter.org

Michael Gale wrote:
> Hey,
> 
>     Why can you not use DNAT ?
> 

We are not allowed to "hide" servers in a private network behind a firewall. All 
servers have to have public IP numbers.

   eth0:199.202.112.127/28  |  eth1:199.202.112.127/29      199.202.112.132
                       ------------                            ----------
{Internet}----------->| Firewall |--------------------------->| server |
                       ------------                            ----------

Let's say I've been allocated 199.202.112.127/28 (these are made up addresses) 
by my ISP, and I'm told to netmask as 255.255.255.0. Let's say I assign my 
firewall the IP address of 199.202.112.130 with a netmask of 255.255.255.0 as 
required. My /etc/sysconfig/network-scripts/ifcfg-eth0 will look something like 
this:

DEVICE=eth0
BOOTPROTO=static
BROADCAST=199.202.112.255
HWADDR=00:10:20:30:40:50
IPADDR=199.202.112.130
NETMASK=255.255.255.0
ONBOOT=yes
TYPE=Ethernet
GATEWAY=199.202.112.1

I can then subnet eth1 as, let's say 199.202.112.127/29, but I cannot create a 
private network, so /etc/sysconfig/network-scripts/ifcfg-eth1 would have to look 
something like this:

DEVICE=eth1
BOOTPROTO=static
BROADCAST=199.202.112.134
HWADDR=00:10:20:30:40:50
IPADDR=199.202.112.127
NETMASK=255.255.255.248
ONBOOT=yes
TYPE=Ethernet

The problem I'm having is the netmask for the outside NIC (eth0) overlaps the 
netmask for the DMZ side NIC (eth1). If I try to ping a server connected via hub 
to eth1 on the firewall FROM the firewall:

# ping 199.202.112.132
Destination host unreachable

but

# ping -I eth1 199.202.112.132

works. I need to have all of the servers on the DMZ pingable from the Internet, 
but still protected by a firewall.

I believe I have iptables set up to adequately protect the DMZ, but I have not 
been able to solve the problem outlined above.

> If you can not NAT the traffic then it needs to function as a router or 
> a bridge. A lot of companies use a "Interconnect". the ISP will provide 
> a small public subnet which is available behind a public IP.
> 
> So our ISP provides us with a /27 subnet of public IP's available behind 
> a public IP:
> 
> ISP -> route (X.X.X.X/27) -> external IP (Cisco router) Internal 
> IP[X.X.X.X/27]
> 
> So on the "internal" side of our Cisco router is a small /27 public 
> routeable network. We then assign the public IP's to our firewall and 
> other systems if needed.
> 
> You could do the same, if you were provided a small subnet. You could 
> also create bridge.
> 
> Michael
> 
> 

Sorry Michael about the off list post.


