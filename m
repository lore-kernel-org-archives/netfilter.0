From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: locally access server behind firewall
Date: Wed, 01 Sep 2004 14:05:03 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094061903.2037.112.camel@localhost>
References: <41360CA0.6090109@tomdp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41360CA0.6090109@tomdp.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Tom <tom@tomdp.com>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-09-01 at 13:53, Tom wrote:
> Hi,
> 
> I have a linux firewall (iptables), and a linux server with apache 
> behind that firewall. My provider blocks ports below 1024, so I have a 
> prerouting-rule that redirects traffic like this:
> 
> $IPTABLES -A PREROUTING -t nat -i $WWW p tcp -d $EXTIP --dport 8888 -j 
> DNAT --to $SERVER:80
> 
> I also have 2 forward-rules:
> 
> $IPTABLES -A FORWARD -i $WWW -o $LAN -p tcp --dport 80 -j ACCEPT
> $IPTABLES -A FORWARD -i $LAN -o $WWW -p tcp --sport 80 -j ACCEPT
> 
> and I have these two lines to allow my local pc's to connect to the 
> firewall with ssh and stuff like that:
> $IPTABLES -A INPUT -i $LAN -s $INTLAN -j ACCEPT
> $IPTABLES -A OUTPUT -o $LAN -d $INTLAN -j ACCEPT
> 
> 
> where:
>   $EXTIP = my external IP address
>   $WWW is eth1
>   $LAN is eth0
>   $SERVER = my server's internal IP address.
>   $INTLAN = "192.168.0.0/24"
> 
> This works really well when I try to connect from the outside to my 
> webserver. But, if I try to connect to http://myserver.com:8888 from the 
> internal network (or from my server itself), I always get 'connection 
> refused'. I'm pretty sure I need some other rules, but can someone 
> please help me in the good direction here? Thanks a lot!!
> 
> 
> 
> PS: Here's a little drawing of the situation:
> 
> SERVER (eth0) <----> (eth0) GATEWAY-PC (eth1) <----> internet
If I understand you correctly, you are trying to connect to the web
server on the internal network from devices on the internal network. 
That means the packets never pass through the firewall.  In that case,
no additional rules will help you.

You could force the traffic to pass through the firewall by placing the
web server on a physical DMZ (highly preferable if this web server
allows public access as it appears to - if someone cracks it, they will
be on your internal network) or on a logical DMZ.  To create a logical
DMZ, simply bind a second address for a separate subnet to the internal
interface of the firewall and change the web server internal address to
an address on that new subnet.

However, I would think the easiest thing to do is configure Apache to
answer on port 8888.  Hope this helps - John
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


