From: Doug Yeager <doug@aircomwireless.net>
Subject: spoofing client IP configuration
Date: Thu, 13 Mar 2003 07:19:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.0.20030313071936.03245590@yeagerautomation.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

o.k.,
managing a public WLAN, people have all sorts of IP configurations preset 
on their clients (not all are dhcp clients enabled).
i am currently running a DHCP server and it works *MOST* of the time.  the 
ultimate solution would be to somehow ignore the client ip configuration 
and map to the clients on the server side based on their mac address, or 
something like that.  i know this is possible because there are hotels that 
do this kind of thing.....some terms like "nomadic server" have popped up.

i want the server to route based on local addresses, so this service 
hopefully would run at the mac level.
the public wlan currently runs:
nocat gateway
HostAP
Iptables firewall
DHCPD  (server in question by this email)

any alternatives to DHCP that do this would be great....i just want people 
configured to their work ip configs to be able to get on.  would moving to 
802.11 auth help?  i don't think so because after authentication you still 
need an IP to do anything...unless i'm thinking about this wrong.

thx,
doug 


