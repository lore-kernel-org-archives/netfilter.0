From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: voicechat(yahoo messenger)
Date: Tue, 27 May 2003 17:00:37 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D04@wardrive.citadelcomputer.com.au>
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
To: George Vieira <georgev@citadelcomputer.com.au>, kaushalender shekhawet <kaushalenders@hotmail.com>, netfilter@lists.netfilter.org

Sorry, ignore my ignorance.. missed the vital Subject line...

What ports does this program use? Have you port forward it to your PC?

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

-----Original Message-----
From: George Vieira=20
Sent: Tuesday, May 27, 2003 4:25 PM
To: kaushalender shekhawet; netfilter@lists.netfilter.org
Subject: RE: voicechat(yahoo messenger)


Voice chat using what program.. I have a million chatting utilites....
Have you researched www.google.com for anything?

Thanks,
____________________________________________
George Vieira
Systems Manager

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

-----Original Message-----
From: kaushalender shekhawet [mailto:kaushalenders@hotmail.com]
Sent: Tuesday, May 27, 2003 3:35 PM
To: netfilter@lists.netfilter.org
Subject: voicechat(yahoo messenger)


Hi group,


we have redhat 8 on which we are running iptables.We have problem that =
all=20
user behind this are not able to voice chat.Plz help me on that These r =
the=20
rules i am using


#!/bin/sh
export =
PATH=3D"/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin"
IPTABLES=3D"/sbin/iptables"
IFCONFIG=3D"/sbin/ifconfig"
# Delete and flush. Default table is "filter". Others like "nat" must be =

explicitly stated.
/sbin/iptables --table nat --flush
/sbin/iptables --delete-chain
/sbin/iptables --table nat --delete-chain
/sbin/iptables -F
# Add SysV style initialization support (ignore everything except 'stop' =
and=20
'clear').

if [ "$1" =3D=3D "stop" ] || [ "$1" =3D=3D "clear" ]; then
  iptables -t filter -F > /dev/null 2>&1
  iptables -t filter -X > /dev/null 2>&1
  iptables -t nat -F > /dev/null 2>&1
  iptables -t nat -X > /dev/null 2>&1
  iptables -t mangle -F > /dev/null 2>&1
  iptables -t mangle -X > /dev/null 2>&1
  iptables -t filter -P INPUT ACCEPT > /dev/null 2>&1
  iptables -t filter -P OUTPUT ACCEPT > /dev/null 2>&1
  iptables -t filter -P FORWARD ACCEPT > /dev/null 2>&1
  iptables -t nat -P PREROUTING ACCEPT > /dev/null 2>&1
  iptables -t nat -P POSTROUTING ACCEPT > /dev/null 2>&1
  iptables -t nat -P OUTPUT ACCEPT  > /dev/null 2>&1
  iptables -t mangle -P POSTROUTING ACCEPT > /dev/null 2>&1
  iptables -t mangle -P OUTPUT ACCEPT > /dev/null 2>&1
  iptables -t mangle -P PREROUTING ACCEPT > /dev/null 2>&1
  iptables -t mangle -P INPUT ACCEPT > /dev/null 2>&1
  iptables -t mangle -P FORWARD ACCEPT > /dev/null 2>&1
  echo "-> Firewall disabled."
  exit
fi
iptables -t nat -X
iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -P OUTPUT ACCEPT
#iptables -t mangle -F
#iptables -t mangle -X
#iptables -t mangle -P POSTROUTING ACCEPT
#iptables -t mangle -P OUTPUT ACCEPT
/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j =
REDIRECT=20
--to-port 3128
/sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j =
REDIRECT=20
--to-port 3128
/sbin/iptables -A INPUT -p icmp --icmp-type 0 -j ACCEPT
/sbin/iptables -A INPUT -p icmp --icmp-type 3 -j ACCEPT
# Set up IP FORWARDing and Masquerading
/sbin/iptables --table nat --append POSTROUTING --out-interface eth0 -j=20
MASQUERADE
/sbin/iptables --append FORWARD --in-interface eth0 -j ACCEPT
/sbin/iptables --table nat --append POSTROUTING --out-interface eth1 -j=20
MASQUERADE
/sbin/iptables --append FORWARD --in-interface eth1 -j ACCEPT

## Ignore any broadcast icmp echo requests
if [ -e /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts ]; then
    echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
fi
#
## Don't accept source routed packets.
if [ -e /proc/sys/net/ipv4/conf/all/accept_source_route ]
for interface in /proc/sys/net/ipv4/conf/*/accept_source_route; do
   echo "0" > $interface
  done
fi
# Automatic IP defragmenting
############################
if [ -e /proc/sys/net/ipv4/ip_always_defrag ]
then
  echo "1" > /proc/sys/net/ipv4/ip_always_defrag
fi
#
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 111 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 111 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 6668 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 6668 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 22 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 22 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 111 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 111 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 135 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 135 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 137 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 137 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 138 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 138 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 139 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 139 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 445 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 445 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 6667 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 6667 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 1025 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 1978 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 2002 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 1433 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 1433 -j DROP
/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 1434 -j DROP
/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 1434 -j DROP

#Turning on Linux kernel support for spoof and DOS (Denial Of Service)=20
protection:
echo 1 >/proc/sys/net/ipv4/tcp_syncookies
echo 1 > /proc/sys/net/ipv4/ip_forward

_________________________________________________________________
Himalayan holiday! Waiting to be won.=20
http://server1.msn.co.in/sp03/summerfun/index.asp Find out more.




