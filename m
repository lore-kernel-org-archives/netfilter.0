From: Trevor Turton <trevor@turton.co.za>
Subject: Blocking source ports after REDIRECT
Date: Wed, 14 Apr 2004 18:42:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <407D69F3.8050105@turton.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

I am running an untrusted web/app server and mail server on a Linux 
server, and choose to run then as non-root.  The apps must therefore use 
ports other than the well-known privileged ones.  I have set up iptables 
to redirect client requests addressed to the well-known ports to the 
ports that these apps open, e.g.
 25 -> 8025
 80 -> 8080
110 -> 8110
This works fine.  Out of obsessive neatness rather than for any good 
technical reason I would like to block direct access to the apps through 
their non-privileged (8xxx) ports.  When I insert a filter command to do 
this, it blocks the redirected traffic as well.  Does anyone have a 
suggestion for me?  The commands are listed below, with the one that 
breaks connectivity commented out with ##

Regards
Trevor Turton

#!/bin/bash
###############################################################################
# This script redirects various well-known services to local 
unprivileged ports
# and block the other privileged ports.
# 2004-04-13 Trevor Turton
###############################################################################
#
# turn on IP forwarding:
#
echo 1 > /proc/sys/net/ipv4/ip_forward
#
# redirect well-known services' ports to local unprivileged ports
#
/sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 25  -j 
REDIRECT --to-ports 8025
/sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 80  -j 
REDIRECT --to-ports 8080
/sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 110 -j 
REDIRECT --to-ports 8110
/sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 443 -j 
REDIRECT --to-ports 8443
#
# accept traffic addressed to the serviced tcp ports
#
/sbin/iptables -A INPUT -p tcp --dport 22  -j ACCEPT
/sbin/iptables -A INPUT -p tcp --dport 25  -j ACCEPT
/sbin/iptables -A INPUT -p tcp --dport 80  -j ACCEPT
/sbin/iptables -A INPUT -p tcp --dport 110 -j ACCEPT
/sbin/iptables -A INPUT -p tcp --dport 443 -j ACCEPT
#
# filter out traffic to remaining privileged tcp ports
#
/sbin/iptables -A INPUT -p tcp -i eth0 --dport 0:1023 -j DROP
## the following command blocks -eth0 --dport 25,80,110,443 as well!!
## /sbin/iptables -A INPUT -p tcp -i eth0 --dport 8000:8443 -j DROP
#
# accept traffic to serviced udp port (dns)
#
/sbin/iptables -A INPUT -p udp --dport 53  -j ACCEPT
#
# filter out traffic to remaining privileged udp ports
#
/sbin/iptables -A INPUT -p udp -i eth0 --dport 0:1023 -j DROP

