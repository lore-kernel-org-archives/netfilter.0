From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Duplicate IP scenario. Doable with iptables?
Date: Fri, 26 Nov 2004 23:04:53 -0500
Message-ID: <1101528293.2019.26.camel@localhost>
References: <s1a330bd.064@mail2.hatsize.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <s1a330bd.064@mail2.hatsize.com>
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
To: Kevin Hilscher <KHilscher@Hatsize.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Tue, 2004-11-23 at 14:44, Kevin Hilscher wrote:
> I have a somewhat odd scenario that requires the same pools of 192.168
> IPs to be bound to eth1 and eth2 on the same machine. I need to NAT
> another pool of 10.x.x.x IPs bound to eth0 to these two pools of 192.168
> IPs. The setup is as follows:
>  
> eth0:10.115.0.1/16 -> eth1:192.168.0.1/24
> eth0:10.115.0.2/16 -> eth1:192.168.0.2/24
> eth0:10.115.0.3/16 -> eth1:192.168.0.3/24
> eth0:10.115.0.4/16 -> eth1:192.168.0.4/24
> eth0:10.115.0.5/16 -> eth1:192.168.0.5/24
> eth0:10.115.0.6/16 -> eth1:192.168.0.6/24
>    
> eth0:10.116.0.1/16 -> eth2:192.168.0.1/24
> eth0:10.116.0.2/16 -> eth2:192.168.0.2/24
> eth0:10.116.0.3/16 -> eth2:192.168.0.3/24
> eth0:10.116.0.4/16 -> eth2:192.168.0.4/24
> eth0:10.116.0.5/16 -> eth2:192.168.0.5/24
> eth0:10.116.0.6/16 -> eth2:192.168.0.6/24
>  
> Suse 8.1 has no problem letting me bind the same IPs to eth1 and eth2,
> since eth1 and eth2 are not on the same physical network. However, I am
> having problems writing my NAT rules for this scenario.
>  
> Is this scenario doable under iptables?
>  
> TIA,
>  
> Kevin
Hmmm . . . that's an interesting one.  Let's break it into SNAT and
DNAT.  I think you will be able to keep the packets straight in DNAT by
specifying the inbound interface, e.g., 
iptables -t nat -A PREROUTING -i eth2 -d 192.168.0.1/24 -j DNAT
--to-destination 10.116.0.1

On SNAT, we can keep the packets straight based upon source, e.g., 
iptables -t nat -A POSTROUTING -s 10.116.0.6 -j SNAT --to-source
192.168.0.6

but I'm not sure how one makes sure the packet goes out eth2 rather than
eth1.  I think the interface decision has already been made but I'm not
sure.  If it has been, I wonder if one could use policy routing in
iproute2 to make it work.  One could set up a rule to route to an
interface based upon source.  It might be worth a try.  Good luck - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


