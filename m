From: "elg3ne" <sun@dap.edu.ph>
Subject: iptables ip forwarding...
Date: Tue, 3 May 2005 10:27:16 +0800
Message-ID: <008201c54f87$a36965e0$0b01a8c0@dap.edu.ph>
References: <df31c4040505021142197fdcdc@mail.gmail.com><df31c40405050213556ddc65b2@mail.gmail.com><20050502210104.GB12530@bender.817west.com><200505021812.37561.ramoni@databras.com.br>
	<df31c404050502141865ca509c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

hi guys i have 2 ISP and an existing firewall which forward 1 IP block to
another internet gateway... for example those ip's 192.168.4.* will be
forwarded to 2nd ISP & there rest block will be on the 1st ISP... i was able
to forward 1 IP block but my problem is that I want to forward another block
ex. 192.168.4.* and 192.168.1.5.* and 192.168.6.*.. how can I do that... I
will paste my existing firewall here & please feel free to edit ..thanks

Note: I highlighted the ISP forwarding with "#" sign.

#!/bin/bash
LOCALLINK="eth0"
GLOBALLINK="eth1"
ROUTER="yes"
NAT="X.X.X.X"
INTERFACES="lo eth0 eth1"
SERVICES="22 53 80"

if [ "$1" = "start" ]
then
        echo "Starting firewall..."
        iptables --flush
        iptables --table nat --flush
        iptables --delete-chain
        iptables --table nat --delete-chain
        iptables -P INPUT DROP
        iptables -A INPUT -i ! ${GLOBALLINK} -j ACCEPT
        iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
        #enable public access to certain services
        for x in ${SERVICES}
        do
            iptables -A INPUT -p tcp --dport ${x} -m state --state NEW -j
ACCEPT
        done
      iptables -A INPUT -p tcp -i ${GLOBALLINK} -j REJECT --reject-with
tcp-reset
       iptables -A INPUT -p udp -i ${GLOBALLINK} -j REJECT --reject-with
icmp-port-unreachable

        #explicitly disable ECN
        if [ -e /proc/sys/net/ipv4/tcp_ecn ]
        then
                echo 0 > /proc/sys/net/ipv4/tcp_ecn
        fi

        #disable spoofing on all interfaces
        for x in ${INTERFACES}
        do
                echo 1 > /proc/sys/net/ipv4/conf/${x}/rp_filter
        done
        iptables -A FORWARD -s 0.0.0.0/0.0.0.0 -p tcp --dport 53 -j ACCEPT
        iptables -A FORWARD -s 0.0.0.0/0.0.0.0 -p udp --dport 53 -j ACCEPT

        if [ "$ROUTER" = "yes" ]
        then
                #we're a router of some kind, enable IP forwarding
                echo 1 > /proc/sys/net/ipv4/ip_forward
                if [ "$NAT" = "dynamic" ]
                then
                        #dynamic IP address, use masquerading
                        echo "Enabling masquerading (dynamic ip)..."
                        iptables --table nat --append POSTROUTING -p
tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
                        iptables --table nat --append
POSTROUTING --out-interface ${GLOBALLINK} -j MASQUERADE
                        iptables --append FORWARD --in-interface
${LOCALLINK} -j ACCEPT


                elif [ "$NAT" != "" ]
                then
                        #static IP, use SNAT
                        echo "Enabling SNAT (static ip)..."
                        iptables --table nat --append POSTROUTING -p
tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
                        iptables --table nat --append
POSTROUTING --out-interface ${GLOBALLINK} -j SNAT --to-source ${NAT}
                        iptables --append FORWARD --in-interface
${LOCALLINK} -j ACCEPT

############################################################
# forwarding to other ISP begins here
# dual ISP use with 2 proxy/gateway server
# if you want to use only 1 ISP comment all lines upto the "forwarding end
here"
#IP_OF_CLIENT=192.168.6.0/24
IP_OF_CLIENT=192.168.9.12
IP_ISP2=192.168.1.13
IP_ISP1=192.168.1.1

## Rewriting destination address for PUBLIC IP hosted at our server
iptables -t nat -A PREROUTING -s $IP_OF_CLIENT -p tcp -d 203.87.141.12 -j
DNAT --to 203.87.141.12
iptables -t nat -A PREROUTING -s $IP_OF_CLIENT -p tcp -d 203.87.141.2 -j
DNAT --to 203.87.141.2
iptables -t nat -A PREROUTING -s $IP_OF_CLIENT -p tcp -d 203.87.141.3 -j
DNAT --to 203.87.141.3
## Rewriting destination address
iptables -t nat -A PREROUTING -s $IP_OF_CLIENT -j DNAT --to $IP_ISP2

## Allow forwarding of connections
iptables -A FORWARD -s $IP_OF_CLIENT -d $IP_ISP2 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -d $IP_OF_CLIENT -s $IP_ISP2 -m state --state
ESTABLISHED,RELATED -j ACCEPT

## Maybe you need SNATing. If so:
iptables -t nat -A POSTROUTING -s $IP_OF_CLIENT -d $IP_ISP2 -j
SNAT --to-source $IP_ISP1

# forwarding of connection end here
############################################################

                        # for transparent proxy..
                        iptables -t nat -A PREROUTING -i eth0 -p tcp --dport
80 -j REDIRECT --to-port 8088
                fi
        fi

elif [ "$1" = "stop" ]
then
        echo "Stopping firewall..."
        iptables -F INPUT
        iptables -F FORWARD
        iptables -P INPUT ACCEPT
        #turn off NAT/masquerading, if any
        iptables -t nat -F POSTROUTING
fi


