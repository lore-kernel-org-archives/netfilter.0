From: Doug Yeager <doug@aircomwireless.net>
Subject: spoofing client IP configuration
Date: Thu, 13 Mar 2003 06:58:24 -0500
Sender: hostap-admin@shmoo.com
Message-ID: <5.2.0.9.0.20030313064430.0323ecb0@yeagerautomation.com>
Mime-Version: 1.0
Return-path: <hostap-admin@shmoo.com>
Errors-To: hostap-admin@shmoo.com
List-Unsubscribe: <http://lists.shmoo.com/mailman/listinfo/hostap>,
	<mailto:hostap-request@shmoo.com?subject=unsubscribe>
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:hostap@shmoo.com>
List-Help: <mailto:hostap-request@shmoo.com?subject=help>
List-Subscribe: <http://lists.shmoo.com/mailman/listinfo/hostap>,
	<mailto:hostap-request@shmoo.com?subject=subscribe>
List-Archive: <http://lists.shmoo.com/pipermail/hostap/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: nocat@lists.nocat.net, , nocatnet@lists.nocat.net, , hostap@shmoo.com, , netfilter@lists.netfilter.org

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
