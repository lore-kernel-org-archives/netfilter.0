From: "ganesh kumar godavari" <gkgodava@rediffmail.com>
Subject: need help in rate limiting tcp-syn !!
Date: 29 Jun 2002 20:56:19 -0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020629205619.20469.qmail@webmail6.rediffmail.com>
Reply-To: "ganesh kumar godavari" <gkgodava@rediffmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Next_1025384179---0-202.54.124.151-20467"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

 This is a multipart mime message


--Next_1025384179---0-202.54.124.151-20467
Content-type: text/plain;
	format=flowed
Content-Disposition: inline


hello group,
  i have attached my shell code to limit the  ping-icmp and 
tcp-syn and tcp-portscan protection. i need some help in this 
matter.

i am not able to limit the incoming tcp-syn packet and port scan 
packets done using nmap.

i used nmap -sS -O -P0 -p1-15 <host name> for port scanning, nmap 
-sS -O -P0 <host name> for syn flooding.

can anyone tell me what is wrong!!. i am successfully able to 
limit the ping flood (ping -f <hostname>) from bib.cs.edu.

but when i repeat the experiment with tcp-syn flood and tcp port 
scan. i am not able to limit.

logically the rules look fine for me. but i am not able to do some 
rate limiting.

Thanks a mil

--
ganesh







#!/bin/sh

# This is the location of the iptables command
IPTABLES="/sbin/iptables"

EXTIF="eth0"
INTIF="eth1"

# Overall Limit for TCP-SYN-Flood detection
TCPSYNLIMIT="1/s"
# Burst Limit for TCP-SYN-Flood detection
TCPSYNLIMITBURST="5"
# Overall Limit for TCP-SYN-Flood detection
PINGLIMIT="1/s"
# Burst Limit for TCP-SYN-Flood detection
PINGLIMITBURST="5"


$IPTABLES -F
$IPTABLES -F -t mangle
$IPTABLES -F -t nat
$IPTABLES -X
$IPTABLES -X -t mangle
$IPTABLES -X -t nat

# Set up IP FORWARDing and Masquerading
$IPTABLES --table nat --append POSTROUTING --out-interface $EXTIF 
-j MASQUERADE
$IPTABLES --append FORWARD --in-interface $INTIF  -j ACCEPT

echo 1 > /proc/sys/net/ipv4/ip_forward             # Enables 
packet forwarding by kernel

$IPTABLES -P INPUT ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT


$IPTABLES -N PORTSCANLIMIT
$IPTABLES -A PORTSCANLIMIT -p tcp --tcp-flags SYN,ACK,FIN,RST RST  
-m limit --limit $TCPSYNLIMIT --limit-burst $TCPSYNLIMITBURST -j 
ACCEPT
$IPTABLES -A PORTSCANLIMIT -p tcp --tcp-flags SYN,ACK,FIN,RST RST 
-j DROP
$IPTABLES -A PORTSCANLIMIT -j RETURN


$IPTABLES -N TCPACCEPT
$IPTABLES -A TCPACCEPT -p tcp --syn -m limit --limit $TCPSYNLIMIT 
--limit-burst $TCPSYNLIMITBURST -j ACCEPT
$IPTABLES -A TCPACCEPT -p tcp --syn -j DROP

$IPTABLES -A TCPACCEPT -p tcp -j PORTSCANLIMIT
$IPTABLES -A TCPACCEPT -j RETURN


$IPTABLES -N PINGACCEPT
$IPTABLES -A PINGACCEPT -p icmp --icmp-type echo-request -m limit 
--limit $PINGLIMIT --limit-burst $PINGLIMITBURST -j ACCEPT
$IPTABLES -A PINGACCEPT -p icmp --icmp-type echo-request -j DROP
$IPTABLES -A PINGACCEPT -p icmp -j RETURN


$IPTABLES -A INPUT -p tcp  -s bib.cs.edu -j TCPACCEPT
$IPTABLES -A INPUT -p icmp -s bib.cs.edu -j PINGACCEPT

#$IPTABLES -A TCPACCEPT -p tcp !--syn -j ACCEPT
#$IPTABLES -A INPUT -p tcp --syn  -j DROP

#IPTABLES -A INPUT -i $EXTIF  -j DROP
#$IPTABLES -A INPUT -i $EXTIF -p tcp  -j TCPACCEPT
#$IPTABLES -A INPUT -p tcp -j DROP



_________________________________________________________
There is always a better job for you at Monsterindia.com.
Go now http://monsterindia.com/rediffin/

--Next_1025384179---0-202.54.124.151-20467
Content-type: message/rfc822

MIME-Version: 1.0
From: MAILER-DAEMON@samba.org (Mail Delivery System)
Subject: Undelivered Mail Returned to Sender
To: gkgodava@rediffmail.com
Content-Type: multipart/mixed;
	boundary="CE24A413C.1025384025/lists.samba.org"
Message-Id: <20020629205345.857D24189@lists.samba.org>

This is a MIME-encapsulated message.

--CE24A413C.1025384025/lists.samba.org
Content-Description: Notification
Content-Type: text/plain

This is the Postfix program at host lists.samba.org.

I'm sorry to have to inform you that the message returned
below could not be delivered to one or more destinations.

For further assistance, please contact <postmaster@samba.org>

If you do so, please include this problem report. You can
delete your own text from the message returned below.

			The Postfix program

<netfileter@lists.samba.org>: unknown user: "netfileter"


--CE24A413C.1025384025/lists.samba.org
Content-Description: Undelivered Message
Content-Type: message/rfc822

Received: from webmail6.rediffmail.com (unknown [202.54.124.151])
	by lists.samba.org (Postfix) with SMTP id CE24A413C
	for <netfileter@lists.samba.org>; Sat, 29 Jun 2002 13:53:43 -0700 (PDT)
Received: (qmail 20279 invoked by uid 510); 29 Jun 2002 20:54:31 -0000
Date: 29 Jun 2002 20:54:31 -0000
Message-ID: <20020629205431.20278.qmail@webmail6.rediffmail.com>
Received: from unknown (128.198.60.195) by rediffmail.com via HTTP; 29 Jun 2002 20:54:31 -0000
MIME-Version: 1.0
From: "ganesh kumar godavari" <gkgodava@rediffmail.com>
Reply-To: "ganesh kumar godavari" <gkgodava@rediffmail.com>
To: netfileter@lists.samba.org
Subject: help in rate limiting
Content-type: text/plain;
	format=flowed
Content-Disposition: inline

hello group,
  i have attached my shell code to limit the  ping-icmp and 
tcp-syn and tcp-portscan protection. i need some help in this 
matter.

i am not able to limit the incoming tcp-syn packet and port scan 
packets done using nmap.

i used nmap -sS -O -P0 -p1-15 <host name> for port scanning, nmap 
-sS -O -P0 <host name> for syn flooding.

can anyone tell me what is wrong!!. i am successfully able to 
limit the ping flood (ping -f <hostname>) from bib.cs.edu.

but when i repeat the experiment with tcp-syn flood and tcp port 
scan. i am not able to limit.

logically the rules look fine for me. but i am not able to do some 
rate limiting.

Thanks a mil

--
ganesh







#!/bin/sh

# This is the location of the iptables command
IPTABLES="/sbin/iptables"

EXTIF="eth0"
INTIF="eth1"

# Overall Limit for TCP-SYN-Flood detection
TCPSYNLIMIT="1/s"
# Burst Limit for TCP-SYN-Flood detection
TCPSYNLIMITBURST="5"
# Overall Limit for TCP-SYN-Flood detection
PINGLIMIT="1/s"
# Burst Limit for TCP-SYN-Flood detection
PINGLIMITBURST="5"


$IPTABLES -F
$IPTABLES -F -t mangle
$IPTABLES -F -t nat
$IPTABLES -X
$IPTABLES -X -t mangle
$IPTABLES -X -t nat

# Set up IP FORWARDing and Masquerading
$IPTABLES --table nat --append POSTROUTING --out-interface $EXTIF 
-j MASQUERADE
$IPTABLES --append FORWARD --in-interface $INTIF  -j ACCEPT

echo 1 > /proc/sys/net/ipv4/ip_forward             # Enables 
packet forwarding by kernel

$IPTABLES -P INPUT ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT


$IPTABLES -N PORTSCANLIMIT
$IPTABLES -A PORTSCANLIMIT -p tcp --tcp-flags SYN,ACK,FIN,RST RST  
-m limit --limit $TCPSYNLIMIT --limit-burst $TCPSYNLIMITBURST -j 
ACCEPT
$IPTABLES -A PORTSCANLIMIT -p tcp --tcp-flags SYN,ACK,FIN,RST RST 
-j DROP
$IPTABLES -A PORTSCANLIMIT -j RETURN


$IPTABLES -N TCPACCEPT
$IPTABLES -A TCPACCEPT -p tcp --syn -m limit --limit $TCPSYNLIMIT 
--limit-burst $TCPSYNLIMITBURST -j ACCEPT
$IPTABLES -A TCPACCEPT -p tcp --syn -j DROP

$IPTABLES -A TCPACCEPT -p tcp -j PORTSCANLIMIT
$IPTABLES -A TCPACCEPT -j RETURN


$IPTABLES -N PINGACCEPT
$IPTABLES -A PINGACCEPT -p icmp --icmp-type echo-request -m limit 
--limit $PINGLIMIT --limit-burst $PINGLIMITBURST -j ACCEPT
$IPTABLES -A PINGACCEPT -p icmp --icmp-type echo-request -j DROP
$IPTABLES -A PINGACCEPT -p icmp -j RETURN


$IPTABLES -A INPUT -p tcp  -s bib.cs.edu -j TCPACCEPT
$IPTABLES -A INPUT -p icmp -s bib.cs.edu -j PINGACCEPT

#$IPTABLES -A TCPACCEPT -p tcp !--syn -j ACCEPT
#$IPTABLES -A INPUT -p tcp --syn  -j DROP

#IPTABLES -A INPUT -i $EXTIF  -j DROP
#$IPTABLES -A INPUT -i $EXTIF -p tcp  -j TCPACCEPT
#$IPTABLES -A INPUT -p tcp -j DROP


_________________________________________________________
There is always a better job for you at Monsterindia.com.
Go now http://monsterindia.com/rediffin/


--CE24A413C.1025384025/lists.samba.org--

--Next_1025384179---0-202.54.124.151-20467--


