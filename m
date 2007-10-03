From: pedro noticioso <cucnews@yahoo.com>
Subject: openvpn, squid, msn messenger multihomed
Date: Wed, 3 Oct 2007 11:00:32 -0700 (PDT)
Message-ID: <93606.23684.qm@web55404.mail.re4.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

ok, please dont mind my previous message, I have made some changes, but still need some help, please.

this is the current setup

    [ADSL1:192.168.101.254]                        [ADSL2:192.168.102.254]
                                          |                           | 
           [eth1:192.168.101.253]                       [eth2:192.168.102.253]
                                       [debian/squid/openvpn]
                                         [eth1:192.168.2.99]
                                                        |
                                                   [switch]
                                                       |

                                          {LAN:192.168.2.0}


I managed to send port 80 to 192.168.102.254 with a squid configuration option, but all other ports like ftp, pop3, smtp, and VPN are going into ADSL1  :s

I would like to dedicate ADSL1 to the VPN and send the rest to ADSL2, and I have been trying to control who goes into msn and who will not in squid cache, it is great as a web cache, but it just sucks at blocking msn messenger for some users and leave open for others :s

here is my complete iptables rules

echo 1 > /proc/sys/net/ipv4/ip_forward
PRIVATE=192.168.2.0/24
LOOP=127.0.0.1
iptables -P OUTPUT DROP
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -F
iptables -t nat -F
iptables -P OUTPUT ACCEPT
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 1331 -j DNAT --to 192.168.2.25
iptables -A INPUT -s $LOOP -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -p tcp --dport ssh -j ACCEPT
iptables -A INPUT -p udp --dport 1190 -j ACCEPT
iptables -A INPUT -p udp --dport 1191 -j ACCEPT
iptables -A INPUT -p udp --dport 1200 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -i tun+ -j ACCEPT
iptables -A FORWARD -i tun+ -j ACCEPT
iptables -A INPUT -i tap+ -j ACCEPT
iptables -A FORWARD -i tap+ -j ACCEPT
iptables --append FORWARD --in-interface eth0 -j ACCEPT
iptables -A INPUT -i eth1 -j ACCEPT
iptables -A FORWARD -i eth1 -j ACCEPT
iptables -A OUTPUT -m state --state NEW -o eth0 -j ACCEPT
iptables -A OUTPUT -m state --state NEW -o eth2 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state NEW -o eth0 -j ACCEPT
iptables -A FORWARD -m state --state NEW -o eth2 -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING -s $PRIVATE -o eth0 -j MASQUERADE
iptables -t nat -A PREROUTING -i eth1 -s 192.168.2.0/24 -p tcp --dport 80 -j REDIRECT --to-port 3128

#iptables -A PREROUTING -i eth1 -t mangle -p tcp -m multiport --dport smtp,pop3,ftp,https,1863 -j  MARK --set-mark 1

echo "#">/etc/iproute2/rt_tables
echo "# reserved values">>/etc/iproute2/rt_tables
echo "#">>/etc/iproute2/rt_tables
echo "255     local">>/etc/iproute2/rt_tables
echo "254     main">>/etc/iproute2/rt_tables
echo "253     default">>/etc/iproute2/rt_tables
echo "0       unspec">>/etc/iproute2/rt_tables
echo "#">>/etc/iproute2/rt_tables
echo "# local">>/etc/iproute2/rt_tables
echo "#">>/etc/iproute2/rt_tables
echo "#1      inr.ruhep">>/etc/iproute2/rt_tables
echo "200 web.out">>/etc/iproute2/rt_tables

#ip rule add fwmark 1 table web.out

ip rule add from 192.168.102.253 table web.out
ip route add default via 192.168.102.254 dev eth2 table web.out
ip route flush cache

the 2 commented lines, are my first try to route smtp,pop3,ftp,https,1863 to ADSL2, but when I executed the fw script with those lines uncommented, the email clients could not get email, so I had to comment them and restart. We have a hosted email server on the wild internet.

I also, ask you to please suggest a rule to block a a few ip address, for only a few clients in my lan, for the purpose of allowing some full users access to msn messenger, while blocking acces to some other users.

I identified the ip addresses msn messenger uses to authenticate through https, 8163 and http a couple weeks ago, but I cant find the file, so as you read I am snooping the network traffic again to gather the necessary info again.

thanks!




       
____________________________________________________________________________________
Yahoo! oneSearch: Finally, mobile search 
that gives answers, not web links. 
http://mobile.yahoo.com/mobileweb/onesearch?refer=1ONXIC
