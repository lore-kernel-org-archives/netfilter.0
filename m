From: "Jerry M. Howell II" <jmhowell@jmhowell.com>
Subject: firewall whoes
Date: Sat, 31 May 2003 14:01:37 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030531140137.C16012@jmhowell.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

I am curently searching the archives and google, if there is a solution
posted I must be overlooking it. My curent situation is I have some aol,
compuserve customers. The moment I enable the firewall they are unable
to connect. My question is what do I need to enable to allow aol and cs
customers to reach me through my firewall? here is the firewall. I
comented out some of the lines till I can figure out how to help our
clients connect to us.

#!/bin/bash
#
# This is a sample firewall for ip_tables, the tool for doing
firewalling
# and masquerading under the 2.3.x/2.4.x series of kernels.
#
# Be warned, this is a very restrictive set of firewall rules (and they
# should be, for proper security). Anything that you do not
_specifically_
# allow is logged and dropped into /dev/null, so if you're wondering why
# something isn't working, check /var/log/messages.
#
# This is about as close as you get to a 'secure' firewall. It's nasty,
# it's harsh, and it will make your machine nearly invisible to the rest
# of the internet world. Have fun.
#
# To run this script you must 'chmod 700 iptables-script' and then
execute
# it. To stop it from running, run 'iptables -F'

#Point this to your copy of ip_tables
IPT="/usr/local/sbin/iptables"

#Load the module.
/sbin/modprobe ip_tables

#Flush old rules, delete the firewall chain if it exists
$IPT -F
$IPT -F -t nat
$IPT -X firewall

# Drop all packets from spamers

#% [whois.apnic.net node-2]
#% How to use this server        http://www.apnic.net/db/
#% Whois data copyright terms
http://www.apnic.net/db/dbcopyright.html
#
#inetnum:      202.148.160.0 - 202.148.175.255
# $IPT -A INPUT -s 202.148.160.0/24 -j DROP

# ENGLISH
#
#KRNIC is not ISP but National Internet Registry similar with APNIC.
#Please see the following end-user contacts for IP address information.
#
#IP Address         : 211.222.66.128-211.222.66.255
#Network Name       : KORNET-LLINE-NAMINCHON-LNISOFT
#Connect ISP Name   : KORNET
#Connect Date       : 20001201
#Registration Date  : 20020703
#$IPT -A INPUT -s 211.222.66.0/24 -j DROP

#$IPT -A INPUT -s 67.30.5.196/32 -j DROP
#Setup Masquerading. Change the IP to your internal network and
uncomment
#this in order to enable it.
#$IPT -A POSTROUTING -t nat -s 192.168.1.0/24 -j MASQUERADE
#$IPT -P FORWARD ACCEPT
#echo 1 > /proc/sys/net/ipv4/ip_forward

#Set up the firewall chain
$IPT -N firewall
$IPT -A firewall -j LOG --log-level info --log-prefix "Firewall:"
#$IPT -A firewall -j DROP


#Accept ourselves
$IPT -A INPUT -s 127.0.0.1/32 -d 127.0.0.1/32 -j ACCEPT
#If you're using IP Masquerading, change this IP to whatever your
internl
#IP addres is and uncomment it
#$IPT -A INPUT -s 192.168.1.1/32 -d 0/0 -j ACCEPT

#Accept DNS, 'cause it's warm and friendly
#$IPT -A INPUT -p udp --source-port 53 -j ACCEPT
#$IPT -A INPUT -p tcp --source-port 113 -j ACCEPT
#$IPT -A INPUT -p tcp --destination-port 113 -j ACCEPT

#Allow ftp to send data back and forth.
#$IPT -A INPUT -p tcp ! --syn --source-port 20 --destination-port
1024:65535 -j ACCEPT
# Allow ftp

#$IPT -A INPUT -p tcp --destination-port 21  -j ACCEPT

#Accept SSH. Duh.
$IPT -A INPUT -p tcp --destination-port 22  -j ACCEPT

#accept http
$IPT -A INPUT -p tcp --destination-port 80  -j ACCEPT

#Alow smtp
$IPT -A INPUT -p tcp --destination-port 25  -j ACCEPT

#Allow pop3

$IPT -A INPUT -p tcp --destination-port 110  -j ACCEPT

# allow ssl

$IPT -A INPUT -p tcp --destination-port 443  -j ACCEPT

# allow cpanel

$IPT -A INPUT -p tcp --destination-port 2082  -j ACCEPT

# allow WHM

$IPT -A INPUT -p tcp --destination-port 2087  -j ACCEPT

# allow Cpanel webmail

#$IPT -A INPUT -p tcp --destination-port 2095  -j ACCEPT
# drop for scaning our network

$IPT -A INPUT -s 217.133.0.0/16 -j DROP

# multiple ftps for no apparent reason. Looking for weakness?

$IPT -A INPUT -s 80.13.0.0/16 -j DROP

#Send everything else ot the firewall.
$IPT -A INPUT -p icmp -j firewall
$IPT -A INPUT -p tcp --syn -j firewall
$IPT -A INPUT -p udp -j firewall
-- 
Jerry M. Howell II

