From: Jim Burnett <jburnett@e-masi.com>
Subject: iptables 1.2.7a and 1.2.8 not reading 1.2.6a script
Date: Fri, 12 Sep 2003 10:08:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063379302.19368.9.camel@dod-secure.e-masi.com>
Reply-To: jburnett@e-masi.com
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
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hello and good morning! 
I am having a heck of a time. I spent all day trying to figure out why
my IPtables script isnt working on my new firewall machine.

Old box ( WORKING ) Slackware 8.1 - iptables 1.2.6a
New box ( NOT WORKING ) Gentoo - iptables 1.2.8

I did check the gentoo kernel and it has everything the Slackware box
has. Plus I've read the documentation and I've done this for a while. I
did re-compile iptables to conform with the new kernel on gentoo. 

For some reason httpd is  filtered on the gentoo box and open on the
slackware box. I even tried using webmin to setup up everything
identical but no go.


Yes apache is bound to the internal IP. I can reach apache from any
internal machine. 

All I want to do is keep my apache box on the local network and forward
the requests from the firewall to my internal apache server. 
The firewall is also the gateway for internet access for the local
workstations.


Apache = 192.168.1.1
Firewall - external IP = 209.145.93.99 

My current rc.firewall script works on slack but not gentoo ( 1.2.6a not
1.2.8 of iptables):


# !/bin/sh

# now to flush/clear out the iptables first
iptables -F -t nat
iptables -F -t mangle
iptables -F -t filter


echo "1" > /proc/sys/net/ipv4/conf/all/forwarding

modprobe ip_conntrack
modprobe ip_conntrack_ftp


iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o $EXTIF -j SNAT --to 209.145.93.99

echo "  Forwarding http traffic to Gadaffi.solarplex.org "
iptables -t nat -A PREROUTING -p tcp -i eth0 -d 209.145.93.99 --dport 80
-j DNAT --to-destination 192.168.1.1:80

iptables -A FORWARD -p tcp -i eth1 -d 192.168.1.1 --dport 80 -j ACCEPT


# now to list the iptables
iptables -L -t nat
iptables -L



