From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: iptables configuration help
Date: Fri, 05 Nov 2004 10:45:04 -0500
Message-ID: <1099669503.4891.125.camel@localhost>
References: <1099669284.891.131.camel@dhanush.intranet.calsoft.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1099669284.891.131.camel@dhanush.intranet.calsoft.com>
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
To: vijay@calsoftinc.com
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Fri, 2004-11-05 at 10:41, Vijay Kumar wrote:
> Hello,
> 
> I have a firewall with three nic ( external ip, DMZ ip, LAN ip ) 
> I have added a subinterface on the external interface ( public ip with a public ip address ) 
> 
> There is 1 machine on the internal LAN and I want it to go out using the IP of the sub interface,
> i.e access the internet using the exteral sub interface IP which I have added. 
> 
> I have done the following : 
> 
> iptables -t nat -I POSTROUTING -s 172.16.0.119 -o eth1:0 -j SNAT --to-source <external_ip> 
> 
> After adding this I also added the below mentioned rules : 
> 
> iptables -A INPUT -s 172.16.0.119 -d 0.0.0.0/0.0.0.0 -j ACCEPT 
> iptables -I FORWARD -s 172.16.0.119 -j ACCEPT 
> 
> When I addded the rules iptables gave me an Warning stating :" Weird character in interface eth0:0, no ! : "
> 
> Where am I going wrong ? Are sub interface allowed in iptables ? 
> 
> What iptables rule should  add so that the LAN machine uses the subinterface to reach the internet ? 
> 
> What i need is something like static nat ?
> 
> Kindly help.
> 
> Vijay.
I'm not sure about the aliases because I always use iproute2 instead to
bind a second address to the same interface.

I would you suggest that, instead of creating an alias, you do something
like"
ip address add <2nd external IP>/<mask length> dev eth0 brd +

then replace your -o eth0:1 with simply -o eth0

>  
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


