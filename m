From: Vijay Kumar <vijay@calsoftinc.com>
Subject: iptables configuration help
Date: Fri, 05 Nov 2004 21:11:24 +0530
Message-ID: <1099669284.891.131.camel@dhanush.intranet.calsoft.com>
Reply-To: vijay@calsoftinc.com
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

Hello,

I have a firewall with three nic ( external ip, DMZ ip, LAN ip ) 
I have added a subinterface on the external interface ( public ip with a public ip address ) 

There is 1 machine on the internal LAN and I want it to go out using the IP of the sub interface,
i.e access the internet using the exteral sub interface IP which I have added. 

I have done the following : 

iptables -t nat -I POSTROUTING -s 172.16.0.119 -o eth1:0 -j SNAT --to-source <external_ip> 

After adding this I also added the below mentioned rules : 

iptables -A INPUT -s 172.16.0.119 -d 0.0.0.0/0.0.0.0 -j ACCEPT 
iptables -I FORWARD -s 172.16.0.119 -j ACCEPT 

When I addded the rules iptables gave me an Warning stating :" Weird character in interface eth0:0, no ! : "

Where am I going wrong ? Are sub interface allowed in iptables ? 

What iptables rule should  add so that the LAN machine uses the subinterface to reach the internet ? 

What i need is something like static nat ?

Kindly help.

Vijay. 
