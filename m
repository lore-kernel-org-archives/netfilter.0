From: "Mariusz Stanisz" <mstanisz@stonewatercontrols.com>
Subject: Re: netfilter digest, Vol 1 #693 - 11 msgs
Date: Sun, 16 Mar 2003 17:22:16 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <33262.12.247.174.109.1047856936.squirrel@stonewatersoftware.com>
References: <20030316224101.4485.22981.Mailman@kashyyyk>
Reply-To: mstanisz@stonewatercontrols.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030316224101.4485.22981.Mailman@kashyyyk>
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
To: netfilter@lists.netfilter.org

Hi i need some help making an iptables script that does the following...

1) eth0 has 4 extern ips
   eth0 -> 192.168.0.50 (nic 0)
   eth0:eth2 -> 192.168.0.200
   eth0:eth3 -> 192.168.0.201
   eth0:eth4 -> 192.168.0.202
   eth1 -> 192.168.0.1 (internal network) (nic 1)


2) On eth1 there is a 5 port switch which has 4 different webservers
   connected to it.
   webserver 1 -> 172.168.0.2
   wbeserver 2 -> 172.168.0.3
   webserver 3 -> 172.168.0.4
   webserver 3 -> 172.168.0.5

3) On eth0 the only incoming traffic is allowed on port 21,23 and 80.from
   192.168.0.0/255.255.255.0 network.
   All outgoing traffic is allowed.

4) On eth1 all traffic is allowed both ways.

5) This is the most important rule i need.
        192.168.0.50:80 -> 172.168.0.2:80
        192.168.0.200:80 -> 172.168.0.3:80
        192.168.0.201:80 -> 172.168.0.4:80
        192.168.0.202:80 -> 172.168.0.5:80
This what i have so far but it does not work at all. I'm not sure what is
wrong with it.

+++++++++++++++++++++++++++++
Hardware is TS-5500
cpu elan (486 DX/4-WD) 66Mhz
++++++++++++++++++++++++++++

=========================================================================================

#!/bin/sh
NETACCEPT=192.168.0.0/255.255.255.0
NAT=yes
TEST=start
case "$TEST" in
        'start')
        if [ -x /usr/bin/logger ]; then
                logger -p info "Firewall Starting"
        fi
        FWD=`cat /proc/sys/net/ipv4/ip_forward`
        echo "0" > /proc/sys/net/ipv4/ip_forward
        echo "30" > /proc/sys/net/ipv4/tcp_fin_timeout
        echo "1800" > /proc/sys/net/ipv4/tcp_keepalive_intvl

        iptables -P OUTPUT        ACCEPT
        iptables -P INPUT        DROP
        iptables -P FORWARD DROP

        cat /proc/net/ip_tables_names | while read table; do
        iptables -t $table -L -n | while read c chain rest; do
                if test "X$c" = "XChain" ; then
                        iptables -t $table -F $chain
                fi
                done
                iptables -t $table -X
        done

        iptables -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
        iptables -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
        iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

#
#   Interface Rule #0 for ETH0
#

        iptables -N ETH0
        iptables -A OUTPUT -o eth0  -m state --state NEW  -j ETH0
        iptables -A FORWARD -o eth0  -m state --state NEW  -j ETH0
        iptables -A ETH0 -j ACCEPT

#
#   Interface Rule #1 for ETH0
#

        iptables -N TELNET
        iptables -A INPUT -i eth0  -p tcp -m state --state NEW  -s $NETACCEPT
--destination-port 23 -j TELNET
        iptables -A FORWARD -i eth0  -p tcp -m state --state NEW  -s
$NETACCEPT
--destination-port 23 -j TELNET

        iptables -A INPUT -i eth0  -p udp -m state --state NEW  -s $NETACCEPT
--destination-port 23 -j TELNET
        iptables -A FORWARD -i eth0  -p udp -m state --state NEW  -s
$NETACCEPT
--destination-port 23 -j TELNET

        iptables -A TELNET  -j LOG   --log-level info --log-prefix
"TELNET_IN : "
        iptables -A TELNET -j ACCEPT

#
#   Interface Rule #2 for ETH0
#

        iptables -N FTP
        iptables -A INPUT -i eth0  -p tcp -m state --state NEW  -s $NETACCEPT
--destination-port 21 -j FTP
        iptables -A FORWARD -i eth0  -p tcp -m state --state NEW  -s
$NETACCEPT
--destination-port 21 -j FTP

        iptables -A INPUT -i eth0  -p udp -m state --state NEW  -s $NETACCEPT
--destination-port 21 -j FTP
        iptables -A FORWARD -i eth0  -p udp -m state --state NEW  -s
$NETACCEPT
--destination-port 21 -j FTP

        iptables -A FTP  -j LOG   --log-level info --log-prefix "FTP_IN : "
        iptables -A FTP -j ACCEPT

#
#   Interface Rule #3 for ETH0
#

        iptables -N WWW
        iptables -A INPUT -i eth0  -p tcp -m state --state NEW  -s $NETACCEPT
--destination-port 80 -j WWW
        iptables -A FORWARD -i eth0  -p tcp -m state --state NEW  -s
$NETACCEPT
--destination-port 80 -j WWW

        iptables -A INPUT -i eth0  -p udp -m state --state NEW  -s $NETACCEPT
--destination-port 80 -j WWW
        iptables -A FORWARD -i eth0  -p udp -m state --state NEW  -s
$NETACCEPT
--destination-port 80 -j WWW

        iptables -A WWW  -j LOG   --log-level info --log-prefix "WWW_IN : "
        iptables -A WWW -j ACCEPT

#
#   Interface Rule #0 for LO
#

        iptables -N LO
        iptables -A INPUT -i lo  -m state --state NEW  -j LO
        iptables -A FORWARD -i lo  -m state --state NEW  -j LO
        iptables -A OUTPUT -o lo  -m state --state NEW  -j LO
        iptables -A FORWARD -o lo  -m state --state NEW  -j LO
        iptables -A LO -j ACCEPT

#
#   Interface Rule #0 for ETH1
#

        iptables -N ETH1
        iptables -A INPUT -i eth1  -m state --state NEW  -j ETH1
        iptables -A FORWARD -i eth1  -m state --state NEW  -j ETH1
        iptables -A OUTPUT -o eth1  -m state --state NEW  -j ETH1
        iptables -A FORWARD -o eth1  -m state --state NEW  -j ETH1
        iptables -A ETH1 -j ACCEPT


#
#  Final rules filter
#

        iptables -A INPUT      -j DROP
        iptables -A OUTPUT     -j ACCEPT
        iptables -A FORWARD    -j DROP

        echo "$FWD" > /proc/sys/net/ipv4/ip_forward

        if [ -x /usr/bin/logger ]; then
                logger -p info "Filter Done"
        fi

#
#  rules nat
#
        if [ $NAT == "yes" ]; then
#
                ifconfig eth0:eth2 192.168.0.200 netmask 255.255.255.0 up
                ifconfig eth0:eth3 192.168.0.201 netmask 255.255.255.0 up
                ifconfig eth0:eth4 192.168.0.202 netmask 255.255.255.0 up
#
                iptables -t nat -A POSTROUTING -o eth0 -s
172.168.0.0/255.255.255.0 -d
0/0 -j MASQUERADE

                iptables -t nat -A PREROUTING -p udp -i eth0 -d
192.168.0.50 --dport 80
-j DNAT --to 172.168.0.2:80
                iptables -t nat -A PREROUTING -p tcp -i eth0 -d
192.168.0.50 --dport 80
-j DNAT --to 172.168.0.2:80

                iptables -t nat -A PREROUTING -p udp -i eth0 -d
192.168.0.200 --dport 80
-j DNAT --to 172.168.0.3:80
                iptables -t nat -A PREROUTING -p tcp -i eth0 -d
192.168.0.200 --dport 80
-j DNAT --to 172.168.0.3:80

                iptables -t nat -A PREROUTING -p udp -i eth0 -d
192.168.0.201 --dport 80
-j DNAT --to 172.168.0.4:80
                iptables -t nat -A PREROUTING -p tcp -i eth0 -d
192.168.0.201 --dport 80
-j DNAT --to 172.168.0.4:80

                iptables -t nat -A PREROUTING -p udp -i eth0 -d
192.168.0.202 --dport 80
-j DNAT --to 172.168.0.5:80
                iptables -t nat -A PREROUTING -p tcp -i eth0 -d
192.168.0.202 --dport 80
-j DNAT --to 172.168.0.5:80

                if [ -x /usr/bin/logger ]; then
                        logger -p info "Nat Done"
                fi
        fi
        ;;
        'stop')
                logger -p info "Firewall Is Down"
                iptables -P OUTPUT        ACCEPT
                iptables -P INPUT        ACCEPT
                iptables -P FORWARD        ACCEPT

                cat /proc/net/ip_tables_names | while read table; do
                iptables -t $table -L -n | while read c chain rest; do
                if test "X$c" = "XChain" ; then
                        iptables -t $table -F $chain
                fi
                done
                iptables -t $table -X
                done
        ;;
        *)
      echo "usage $0 start|stop"
        ;;
esac
=============================================================================================
Help Please.
I'm not sure if if have to repeat all rules for eth2,eth3,eth4 .what am i
doing wronge






