From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Some confuisions about following script
Date: Sat, 24 May 2003 11:31:28 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A01923F@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: syd_salman@yahoo.com, netfilter@lists.netfilter.org

This is a script so it's like a language to some extend..


"What is LOGLIMIT "
LOGLIMIT is just something he's used as a variable.


"What is LOGLIMITBURST and"
Same as above.

"What is --log-prefix "fp=3DINVALID:1 a=3DDROP " "
This is what's put in the syslogs in front of the packet so it is =
recognisable..
ie. I used --log-prefix "INETPKT " when means it's an internet packet. I =
also use --log-prefix "VPNPKT " which tells me this packet was from my =
VPN.. etc..etc.. it's just a log label.

Alot of scripts do this because it's easier to manage.. eg.
---example script--

#!/bin/bash

# Define variables
WRKVPN=3D"ppp+"
IPSEC0=3D"ipsec0"
EXTDEV=3D"eth1"
INTSN=3D"192.168.1.0/24"
PUBPORTS=3D"1024:65535"
#
#
echo -n "  Configuring  : Enabling some ICMP"
#
#
$IPTABLES -A INPUT -i $EXTDEV -p icmp --icmp-type echo-request -j ACCEPT
$IPTABLES -A INPUT -i $EXTDEV -p icmp --icmp-type echo-reply   -j ACCEPT
$IPTABLES -A INPUT -i $EXTDEV -p icmp --icmp-type 3            -j ACCEPT
$IPTABLES -A INPUT -i $EXTDEV -p icmp --icmp-type 11           -j ACCEPT
success;echo

Now with the above script, can you imagine what a pain it would be if I =
changed my network card from eth1 to eth2 because I've added a DMZ or =
something.. all the lines with "-i eth1" would need changing... so =
variable fix that..


-----Original Message-----
From: Salman Ahmed [mailto:syd_salman@yahoo.com]
Sent: Saturday, May 24, 2003 8:20 AM
To: netfilter@lists.netfilter.org
Subject: Some confuisions about following script


I have downloaded one script from internet which some
parts are making confusion which are:

####################################################
#----Create logging chains-----#

##These are the logging-chains. They all have a
certain limit of log-entries/sec to prevent
log-flooding
##The syslog-entries will be fireparse-compatible (see
http://www.fireparse.com)

#Invalid packets (not ESTABLISHED,RELATED or NEW)
	$IPTABLES -N LINVALID
	$IPTABLES -A LINVALID -m limit --limit $LOGLIMIT
--limit-burst $LOGLIMITBURST -j LOG --log-prefix
"fp=3DINVALID:1 a=3DDROP " $IPTABLES -A LINVALID -j DROP

#####################################################


I am having following confusions.

What is LOGLIMIT=20
What is LOGLIMITBURST and
What is --log-prefix "fp=3DINVALID:1 a=3DDROP "

How can we only block mns messenger and yahoo
messenger?

How can we block all communications except www.=20


Please help me out.

Best Regards
Salman

__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com


