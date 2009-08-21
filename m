From: "J. Bakshi" <joydeep@infoservices.in>
Subject: nmap scan makes my apache connection  super slow
Date: Fri, 21 Aug 2009 14:36:21 +0530
Message-ID: <4A8E638D.8040006@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear list,

nmap scan " nmap -P0 ...."  makes my apache connection super slow !!!

The iptables rule sets to cope with scanners  I have in my server is

`````````
## SYN-FLOODING PROTECTION
iptables -N syn-flood
iptables -A INPUT -i $IFACE -p tcp --syn -j syn-flood
iptables -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN
iptables -A syn-flood -j DROP

## Make sure NEW tcp connections are SYN packets
iptables -A INPUT -i $IFACE -p tcp ! --syn -m state --state NEW -j DROP

## FRAGMENTS
iptables -A INPUT -i $IFACE -f -j LOG --log-prefix "IPTABLES FRAGMENTS: "
iptables -A INPUT -i $IFACE -f -j DROP

#XMAS packets
#Incoming malformed XMAS packets. Drop them:
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP

#Drop all NULL packets
#Incoming malformed NULL packets:
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP

#block commonly used port-scanning technique.

iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL FIN,URG,PSH -j LOG \
           --log-prefix "NMAP-XMAS SCAN:" --log-tcp-options --log-ip-options

iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL NONE -j LOG \
           --log-prefix "NMAP-NULL SCAN:" --log-tcp-options --log-ip-options

iptables -t mangle -A PREROUTING -p tcp --tcp-flags SYN,RST SYN,RST -j LOG \
         --log-prefix "SYN/RST SCAN:" --log-tcp-options --log-ip-options

iptables -t mangle -A PREROUTING -p tcp --tcp-flags SYN,FIN SYN,FIN -j LOG \
          --log-prefix "SYN/FIN SCAN:" --log-tcp-options --log-ip-options

iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL NONE -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
ipt#XMAS packets
#Incoming malformed XMAS packets. Drop them:
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP

#Drop all NULL packets
#Incoming malformed NULL packets:
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP

#block commonly used port-scanning technique.

iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL FIN,URG,PSH -j LOG \
           --log-prefix "NMAP-XMAS SCAN:" --log-tcp-options --log-ip-options

iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL NONE -j LOG \
           --log-prefix "NMAP-NULL SCAN:" --log-tcp-options --log-ip-options

iptables -t mangle -A PREROUTING -p tcp --tcp-flags SYN,RST SYN,RST -j LOG \
         --log-prefix "SYN/RST SCAN:" --log-tcp-options --log-ip-options

iptables -t mangle -A PREROUTING -p tcp --tcp-flags SYN,FIN SYN,FIN -j LOG \
          --log-prefix "SYN/FIN SCAN:" --log-tcp-options --log-ip-options

iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL NONE -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags SYN,RST SYN,RST -j DROP

#XMAS packets
#Incoming malformed XMAS packets. Drop them:
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP

#Drop all NULL packets
#Incoming malformed NULL packets:
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP

#block commonly used port-scanning technique.

iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL FIN,URG,PSH -j LOG \
           --log-prefix "NMAP-XMAS SCAN:" --log-tcp-options --log-ip-options

iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL NONE -j LOG \
           --log-prefix "NMAP-NULL SCAN:" --log-tcp-options --log-ip-options

iptables -t mangle -A PREROUTING -p tcp --tcp-flags SYN,RST SYN,RST -j LOG \
         --log-prefix "SYN/RST SCAN:" --log-tcp-options --log-ip-options

iptables -t mangle -A PREROUTING -p tcp --tcp-flags SYN,FIN SYN,FIN -j LOG \
          --log-prefix "SYN/FIN SCAN:" --log-tcp-options --log-ip-options

iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL NONE -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
iptables -t mangle -A PREROUTING -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
ables -t mangle -A PREROUTING -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
ables -t mangle -A PREROUTING -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP

## malformed packets

iptables -A INPUT -i $IFACE -p tcp -m tcp --tcp-flags
FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
iptables -A INPUT -i $IFACE -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j
DROP
iptables -A INPUT -i $IFACE -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j
DROP
iptables -A INPUT -i $IFACE -p tcp -m tcp --tcp-flags FIN,RST FIN,RST -j
DROP
iptables -A INPUT -i $IFACE -p tcp -m tcp --tcp-flags FIN,ACK FIN -j DROP
iptables -A INPUT -i $IFACE -p tcp -m tcp --tcp-flags ACK,URG URG -j DROP
````````````````

But nmap scan on the server makes apache connection running on it super
slow !!!
If I stop the scan apache again become normal.
Is there any trick to keep the connection normal even with scanners are
doing their job ? Please suggest how to cope with it.
Thanks
