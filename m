From: "Tony Rogers" <Tony.Rogers@erudine.com>
Subject: RE: iptables - external IP address on internal interface?
Date: Tue, 12 Apr 2011 10:20:57 +0100
Message-ID: <054F5B1BB94BD943B243C3B39B4F568D016E42F1@victory.Erudine.local>
References: <054F5B1BB94BD943B243C3B39B4F568D016E42CE@victory.Erudine.local> <1302544375.1551.11.camel@andybev>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <1302544375.1551.11.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org


As requested - output of "iptables -nL"

I have sanitized this to a certain extent:

192.168.0.2 is a VoIP box (and proven not to be the source of any of
this traffic).

<EXT_IP> is the external IP of the box.

<ACCESS_IP_1> through <ACCESS_IP_7> are static addresses giving access
to certain services.

<ACCESS_NET> is a static network address giving access to certain
services.

------------------------------------------------------------------------
-----------------------------

Chain INPUT (policy DROP)
target     prot opt source               destination         
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
dpts:1026:1028 
DROP       udp  --  0.0.0.0/0            0.0.0.0/0           udp
dpts:1026:1028 
DROP       udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:67 
DROP       udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:68 
BADTCP     all  --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state
RELATED,ESTABLISHED 
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state NEW 
DROP       all  --  127.0.0.0/8          0.0.0.0/0           state NEW 
DROP       all  --  0.0.0.0/0            127.0.0.0/8         state NEW 
ACCEPT    !icmp --  0.0.0.0/0            0.0.0.0/0           state NEW 
XTACCESS   all  --  0.0.0.0/0            0.0.0.0/0           state NEW 
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 0

ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 3

ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 5

ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type
11 
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 8
limit: avg 1/sec burst 5 
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg
10/min burst 5 LOG flags 0 level 4 prefix `INPUT ' 
ACCEPT     udp  --  0.0.0.0/0            224.0.0.0/4         
ACCEPT     2    --  0.0.0.0/0            224.0.0.0/4         
DROP       all  --  0.0.0.0/0            224.0.0.0/4         
DROP       all  --  224.0.0.0/4          0.0.0.0/0           
DROP       all  --  240.0.0.0/4          0.0.0.0/0           

Chain FORWARD (policy DROP)
target     prot opt source               destination         
BADTCP     all  --  0.0.0.0/0            0.0.0.0/0           
TCPMSS     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x06/0x02 TCPMSS clamp to PMTU 
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state
RELATED,ESTABLISHED 
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state NEW 
DROP       all  --  127.0.0.0/8          0.0.0.0/0           state NEW 
DROP       all  --  0.0.0.0/0            127.0.0.0/8         state NEW 
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state NEW 
PORTFWACCESS  all  --  0.0.0.0/0            0.0.0.0/0           state
NEW 
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg
10/min burst 5 LOG flags 0 level 4 prefix `OUTPUT ' 
ACCEPT     udp  --  <ACCESS_IP_7>         192.168.0.2         udp
dpt:5060 
ACCEPT     udp  --  <ACCESS_IP_7>         192.168.0.2         udp
dpts:1024:65535 
ACCEPT     tcp  --  <ACCESS_NET>/28       192.168.0.2         tcp dpt:80

ACCEPT     tcp  --  <ACCESS_IP_3>         192.168.0.2         tcp dpt:80

ACCEPT     tcp  --  <ACCESS_IP_4>         192.168.0.2         tcp dpt:80

ACCEPT     tcp  --  <ACCESS_IP_3>         192.168.0.2         tcp dpt:22

ACCEPT     tcp  --  <ACCESS_NET>/28       192.168.0.2         tcp dpt:22

ACCEPT     tcp  --  <ACCESS_IP_4>         192.168.0.2         tcp dpt:22

ACCEPT     tcp  --  <ACCESS_IP_4>         192.168.0.2         tcp dpt:20

ACCEPT     tcp  --  <ACCESS_IP_4>         192.168.0.2         tcp dpt:21


Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

Chain BADTCP (2 references)
target     prot opt source               destination         
PSCAN      tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x3F/0x29 
PSCAN      tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x3F/0x00 
PSCAN      tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x3F/0x01 
PSCAN      tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x06/0x06 
PSCAN      tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x03/0x03 
NEWNOTSYN  tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:!0x17/0x02 state NEW 

Chain LOG_DROP (0 references)
target     prot opt source               destination         
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg
10/min burst 5 LOG flags 0 level 4 
DROP       all  --  0.0.0.0/0            0.0.0.0/0           

Chain LOG_REJECT (0 references)
target     prot opt source               destination         
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg
10/min burst 5 LOG flags 0 level 4 
REJECT     all  --  0.0.0.0/0            0.0.0.0/0           reject-with
icmp-port-unreachable 

Chain NEWNOTSYN (1 references)
target     prot opt source               destination         
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg
10/min burst 5 LOG flags 0 level 4 prefix `NEW not SYN? ' 
DROP       all  --  0.0.0.0/0            0.0.0.0/0           

Chain PORTFWACCESS (1 references)
target     prot opt source               destination         

Chain PSCAN (5 references)
target     prot opt source               destination         
LOG        tcp  --  0.0.0.0/0            0.0.0.0/0           limit: avg
10/min burst 5 LOG flags 0 level 4 prefix `TCP Scan? ' 
LOG        udp  --  0.0.0.0/0            0.0.0.0/0           limit: avg
10/min burst 5 LOG flags 0 level 4 prefix `UDP Scan? ' 
LOG        icmp --  0.0.0.0/0            0.0.0.0/0           limit: avg
10/min burst 5 LOG flags 0 level 4 prefix `ICMP Scan? ' 
LOG        all  -f  0.0.0.0/0            0.0.0.0/0           limit: avg
10/min burst 5 LOG flags 0 level 4 prefix `FRAG Scan? ' 
DROP       all  --  0.0.0.0/0            0.0.0.0/0           

Chain XTACCESS (1 references)
target     prot opt source               destination         
ACCEPT     tcp  --  0.0.0.0/0            <EXT_IP>        tcp dpt:20
state NEW 
ACCEPT     tcp  --  0.0.0.0/0            <EXT_IP>        tcp dpt:21
state NEW 
ACCEPT     tcp  --  0.0.0.0/0            <EXT_IP>        tcp dpt:80
state NEW 
ACCEPT     tcp  --  <ACCESS_IP_5>       <EXT_IP>        tcp dpt:5000
state NEW 
ACCEPT     udp  --  <ACCESS_IP_7>         192.168.0.2         udp
dpts:1024:65535 
ACCEPT     udp  --  <ACCESS_IP_7>         192.168.0.2         udp
dpt:5060 
ACCEPT     tcp  --  <ACCESS_IP_3>         192.168.0.2         state NEW
tcp dpt:22 
ACCEPT     tcp  --  <ACCESS_IP_4>         192.168.0.2         state NEW
tcp dpt:22 
ACCEPT     tcp  --  <ACCESS_IP_3>         <EXT_IP>        state NEW tcp
dpt:223 
ACCEPT     tcp  --  <ACCESS_IP_1>         192.168.0.2         state NEW
tcp dpt:22 
ACCEPT     tcp  --  <ACCESS_IP_1>         <EXT_IP>        state NEW tcp
dpt:81 
ACCEPT     tcp  --  <ACCESS_IP_1>         <EXT_IP>        state NEW tcp
dpt:223 
ACCEPT     tcp  --  <ACCESS_IP_2>          <EXT_IP>        state NEW tcp
dpt:22 
ACCEPT     tcp  --  <ACCESS_IP_3>         <EXT_IP>        state NEW tcp
dpt:10000 
ACCEPT     tcp  --  <ACCESS_IP_1>         <EXT_IP>        state NEW tcp
dpt:10000 
ACCEPT     tcp  --  <ACCESS_IP_1>         <EXT_IP>        state NEW tcp
dpt:5901 
ACCEPT     tcp  --  <ACCESS_IP_3>         <EXT_IP>        state NEW tcp
dpt:5901 
ACCEPT     tcp  --  <ACCESS_IP_1>         <EXT_IP>        state NEW tcp
dpt:5900 
ACCEPT     tcp  --  <ACCESS_IP_3>         <EXT_IP>        state NEW tcp
dpt:5900 

------------------------------------------------------------------------
-------------------------------------------------------

 

-----Original Message-----
From: Andrew Beverley [mailto:andy@andybev.com] 
Sent: 11 April 2011 18:53
To: Tony Rogers
Cc: netfilter@vger.kernel.org
Subject: Re: iptables - external IP address on internal interface?

On Mon, 2011-04-11 at 15:04 +0100, Tony Rogers wrote:
> I have a question for the iptables experts out there.
> 
> I previously asked this question on this forum here.
> 
> But no satisfactory answer was given.
> 
> I have an iptables firewall, where *eth0* is the *internal interface*,
> and _eth1 is the external interface_. eth1 is connected directly to
the
> internet, and this box is also a NAT router.
> 
> I am seeing traffic sourced from external IP addresses on eth0
(internal
> interface) - how can this be? (see logs below)

Can you post the iptables rules that you are using, in particular the
NAT part? What IP address range are you using on the internal network?

Andy



------------------------
This email was scanned by BitDefender.
