From: Michael Anderson <mathtoot@yahoo.com>
Subject: Iptables Tutorial 1.1.19 by Oskar Andreasson
Date: Fri, 12 Sep 2003 09:50:30 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030912165030.86144.qmail@web40705.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi, 

I have recieved an error called: "Unknown arg
`--state'" from linux (I am running RH Linux 9.2
(shrike) -- but have not run "Updater" i.e. have not
run any patches or the like since the install) 

I am using the Oskar Andreasson's "DHCP" firewall
script from his excellent "Tutorial 1.1.19 "

Here are some of the things I have changed in the DHCP
script: 

from:  INET_IFACE="eth0"
to:    INET_IFACE="ppp0"

form:  IPTABLES="/usr/sbin/iptables"
to:    IPTABLES="/sbin/iptables"

from:   #echo "1" > /proc/sys/net/ipv4/ip_dynaddr
to:      echo "1" > /proc/sys/net/ipv4/ip_dynaddr

It has been suggested that perhaps my modules were not
loaded properly esp. the "ipt_STATE" module

Perhaps this is the problem... Below are the
/sbin/modprobe commands with "arg" from the DHCP
script: 

#
# 2.1 Required modules
#
                                                      
                         
/sbin/modprobe ip_conntrack
/sbin/modprobe ip_tables
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_mangle
/sbin/modprobe iptable_nat
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_limit
/sbin/modprobe ipt_MASQUERADE

I do not see where ipt_STATE is loaded...
Is this supposed to be loaded prior to running the
DHCP script? 

If there are additional modprobe commands that have to
be loaded prior to running this script -- I wonder
which ones they are?

I did use Lokkit* to make a secure server whilst I ran
this script ... Lokkit may have unloaded the mod that
"ipt_STATE" ... and done this behind the scenes...

Very roughly these are the line numbers 225-228 and
314 and 367 where the error occured:

$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state
--state NEW -j LOG \
--log-prefix "New not syn:"

$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state
--state NEW -j DROP

$IPTABLES -A allowed -p TCP -m state --state
ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A FORWARD -m state --state 
ESTABLISHED,RELATED -j ACCEPT


*Lokkit iptables output after cat
/etc/sysconfig/iptables: 

# Firewall configuration written by lokkit
# Manual customization of this file is not
recommended.
# Note: ifup-post will punch the current nameservers
through the
#       firewall; such entries will *not* be listed
here.
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:RH-Lokkit-0-50-INPUT - [0:0]
-A INPUT -j RH-Lokkit-0-50-INPUT
-A FORWARD -j RH-Lokkit-0-50-INPUT
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 80 --syn
-j ACCEPT
-A RH-Lokkit-0-50-INPUT -i lo -j ACCEPT
-A RH-Lokkit-0-50-INPUT -i eth1 -j ACCEPT
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --syn -j REJECT
-A RH-Lokkit-0-50-INPUT -p udp -m udp -j REJECT
COMMIT

Well as you can prolly tell I am a total "newbie" at
all this stuff... 

I have done google seaches but only one bug was
remotely related to the --state error...  If someone
could direct me in a "positive" direction -- I would
be grateful... One last thing... My son is going to
kill me If I dont get his win2k workstation (on my
lan) back on the "net"!!!

Kindest Regards, 

Michael Anderson


__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com

