From: Chip Upsal <chip@cyberwolf.com>
Subject: Update httpd.conf file:  Apache virtualhost not working behind fi
	rewall.
Date: Fri, 20 Dec 2002 12:43:18 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3019863CF306D211BA4500A0CC30812DB4C242@exchange.cyberwolf.com>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Update: 

The format of the conf file has much to do with how the server responds.

specifically the virtual host directives:
for example:

<VirtualHost 192.168.0.2>
   ServerName site4.company.com
   ServerAlias site4*
   ServerAdmin admin@company.com
   DocumentRoot D:/web_root/foo4
   ErrorLog logs/site4.cyberwolf.com-error_log
   CustomLog logs/site4.cyberwolf.com-access_log common
</VirtualHost>

192.168.0.2 is the internal address of the server; this will make all
request to this server go to the first virtual root defined in the conf
file.

While if the directives look like:

<VirtualHost *>
   ServerName site4.company.com
   ServerAlias site4*
   ServerAdmin admin@company.com
   DocumentRoot D:/web_root/foo4
   ErrorLog logs/site4.cyberwolf.com-error_log
   CustomLog logs/site4.cyberwolf.com-access_log common
</VirtualHost>

or:

<VirtualHost site4.company.com>
   ServerName site4.company.com
   ServerAlias site4*
   ServerAdmin admin@company.com
   DocumentRoot D:/web_root/foo4
   ErrorLog logs/site4.cyberwolf.com-error_log
   CustomLog logs/site4.cyberwolf.com-access_log common
</VirtualHost>

Then all request to the server go the default DocumentRoot.

Any ideas what the NATing in NETFILTER could be doing to the host header?

I updated my iptables to version 1.2.6a with no help.


Chip



-----Original Message-----
From: Chip Upsal 
Sent: Thursday, December 19, 2002 6:39 PM
To: netfilter@lists.netfilter.org
Subject: Apache virtualhost not working behind firewall.


I have a windows 2000 server running apache 2.0.43 with virtual hosts 
behind an iptables firewall doing NAT.
I am running iptables v1.2.5 on a redhat 7.3 server.

My nat and fowarding rules look like:

INET_IP="216.184.9.5"
#HTTP_IP="216.184.9.6"
PWWEB_IP="216.184.9.30"
PWODBC_IP="216.184.9.29"
INET_IFACE="eth2"

LAN_IP="192.168.1.15"
LAN_IP_RANGE="192.168.1.0/24"
LAN_BCAST_ADRESS="192.168.1.255"
LAN_IFACE="eth0"


DMZ_PWWEB_IP="192.168.0.2"
DMZ_PWSQL_IP="192.168.0.3"
DMZ_PWODBC_IP="192.168.0.4"
DMZ_IP="192.168.0.1"
DMZ_IFACE="eth1"


$IPTABLES -A FORWARD -i $DMZ_IFACE -o $INET_IFACE -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -m state \
--state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $LAN_IFACE -o $DMZ_IFACE -j ACCEPT
$IPTABLES -A FORWARD -i $DMZ_IFACE -o $LAN_IFACE -j ACCEPT

#
# PWWEB
#

$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_PWWEB_IP \
--dport 80 -j allowed
$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_PWWEB_IP \
-j icmp_packets

#
# PWODBC
#

$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_PWODBC_IP \
--dport 80 -j allowed
$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d 
$DMZ_PWODBC_IP \
-j icmp_packets

#
# PWWEB
#
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $PWWEB_IP 
--dport 80 \
-j DNAT --to-destination $DMZ_PWWEB_IP

$IPTABLES -t nat -A PREROUTING -p ICMP -i $INET_IFACE -d $PWWEB_IP \
-j DNAT --to-destination $DMZ_PWWEB_IP

#
# PWODBC
#
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $PWODBC_IP 
--dport 80 \
-j DNAT --to-destination $DMZ_PWODBC_IP

$IPTABLES -t nat -A PREROUTING -p ICMP -i $INET_IFACE -d $PWODBC_IP \
-j DNAT --to-destination $DMZ_PWOBDC_IP


The problem....
When the server is connected directly to the internet all works well. 
However, when it is behind the firewall the virtualhost are not working 
(you can only access the default web site.

Furthermore i am getting the following errors when starting iptables;

[root@iptables init.d]# ./iptables restart
Flushing all current rules and user defined chains:        [  OK  ]
Clearing all current rules and user defined chains:        [  OK  ]
Applying iptables firewall rules:                          [  OK  ]
iptables v1.2.5: Unknown arg `--to-destination'
Try `iptables -h' or 'iptables --help' for more information.
                                                            [  OK  ]


Any ideas on a solution would be most appriciated.


Chip

