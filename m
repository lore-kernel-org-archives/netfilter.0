From: Stephen Hemminger <stephen@networkplumber.org>
Subject: Re: Bridging issues: Issues with IP packets with multicast MAC
 address
Date: Fri, 7 Feb 2014 12:22:23 -0700
Message-ID: <20140207122223.108b66f2@samsung-9>
References: <0DEFA0384E6CC8469FBD21EC20CA73C0E3074798@MAILSTORE-A.hitech.vision-network.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0DEFA0384E6CC8469FBD21EC20CA73C0E3074798@MAILSTORE-A.hitech.vision-network.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sophal Lee <sophal@esolute.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, 6 Feb 2014 00:01:51 +0000
Sophal Lee <sophal@esolute.com> wrote:

> Hi 
> 
> I'm having issues with multicast Ethernet frames getting forwarding to all my virtual guest in a KVM virtualised environment. 
> 
> Some information about ow the system's configure, ebtables and iptables are used for L2/L3 filtering. A virtual IP. (192.168.1.1) has a multicast MAC paired with it (03:11:11:11:11:11). 
> 
> Bridge networking has been setup i.e. shared physical device. So my interfaces are the bridge interface (br0) and multiple virtual interface for the guest (vnet0, vnet1, vnet2, etc.).
> 
> Here's a few articles I've been referring to for setting up my bridge: 
> https://wiki.debian.org/BridgeNetworkConnections
> http://wiki.libvirt.org/page/Networking
> 
> I've configured the kernel state to have arp/iptables ignore bridge traffic through changing the following fields
> * bridge-nf-call-arptables
> * bridge-nf-call-iptables
> * bridge-nf-call-ip6tables
> From my understanding and how I've configured the bridge, it should behave just like a switch, so I'd expect that multicast MAC address to be forwarded to all virtual interfaces by the bridge interface. However, only certain multicast frames are going through to the KVM guest such as Microsoft NLB packets, ARP and other types of multicast/broadcast traffic.  However, IP packets with the multicast MAC address is not getting forwarded.
> 
> Running a few test, I can see these IP packets (with the multicast Ethernet frame) arrive at the bridge interface but doesn't get forwarded to any of the virtual net interface. 
> 
> ebtables has been configured to filter by bridging, so it should be forwarding packets to the virtual interfaces based on MAC multicasting. In the brouting chain, I've left the policy ACCEPT which should be making decision on the link-layer.
> 
> Judging from what's happening, it might be possible they are being routed instead. Is there a way to see where  and what's happening to these packets? Which chains the packets are going from and what rules are being applied? Thanks.

The bridge does IGMP snooping to filter multicast packets. What kernel version are you using?

