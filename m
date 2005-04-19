From: "elg3ne" <sun@dap.edu.ph>
Subject: Re: IP Forwading from Local IP to Live IP
Date: Tue, 19 Apr 2005 16:41:09 +0800
Message-ID: <001b01c544bb$88d8a640$0b01a8c0@dap.edu.ph>
References: <1079365863.2163.8.camel@vejan>	<200403151608.12073.Antony@Soft-Solutions.co.uk><002a01c544b5$2222c300$0b01a8c0@dap.edu.ph>
	<4264B6FA.6080102@riverviewtech.net>
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
To: Taylor Grant <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org


----- Original Message ----- 
From: "Taylor Grant" <gtaylor@riverviewtech.net>
To: "elg3ne" <sun@dap.edu.ph>
Cc: <netfilter@lists.netfilter.org>
Sent: Tuesday, April 19, 2005 3:44 PM
Subject: Re: IP Forwading from Local IP to Live IP


> > Hi guys, Im new to iptables.. hope someone can help me to this.
> >
> > The situation is this, I have a webserver running on a local network
machine
> > (192.168.1.3) & I want it to be accessible outside my network. Is it
> > possible?
> >
> > setup is like this:
> >
> > workstation (192.168.1.3) ---> HUB ---> server ( LIVE IP, accessible
> > everywhere on the net )
> >
> > when user access the live IP ex. 10.0.0.3 can he forward to get the
files on
> > the worstation?
>
> I think you are talking about simple port forwarding.  To accomplish this
you would want to run such a set up on server / router / firewall.
>
> iptables -t nat -A PREROUTING -i $INet_Interface -d 10.0.0.3 -p
tcp --dport $Port_of_Service -j DNAT --to-destination
192.168.1.3:$Port_of_Service
> iptables -t nat -A PREROUTING -i $INet_Interface -d 10.0.0.3 -p
udp --dport $Port_of_Service -j DNAT --to-destination
192.168.1.3:$Port_of_Service
> iptables -t nat -A POSTROUTING -o $LAN_Interface -d 192.168.1.3 -p
tcp --dport $Port_of_Service -j SNAT --to-source $Internal_IP_of_Server
> iptables -t nat -A POSTROUTING -o $LAN_Interface -d 192.168.1.3 -p
udp --dport $Port_of_Service -j SNAT --to-source $Internal_IP_of_Server
>
> This will take any TCP or UDP traffic that is coming in to the server to
port $Port_of_Service and (port) forward it to 192.168.1.3 where the traffic
will be handled as if it were originally destined to the internal system.
>
>
>
> Grant. . . .

Hi Grant, I have an existing Linux PC firewall... the machine has 2 NIC, 1
for LiveIP and 1 for LocalIP.. i have also an existing firewall on the
machine... I will post it here so can take a look at.. I've tried to add the
above iptables command but no luck...thanks

LOCALLINK="eth0"
GLOBALLINK="eth1"
ROUTER="yes"
NAT="10.0.0.3"
INTERFACES="lo eth0 eth1"
SERVICES="8080 80"

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

#################################
iptables -t nat -A PREROUTING -i $GLOBALLINK -d 203.87.141.9 -p tcp --dport
8080 -j DNAT --to-destination 192.168.1.11:8080
iptables -t nat -A PREROUTING -i $GLOBALLINK -d 203.87.141.9 -p udp --dport
8080 -j DNAT --to-destination 192.168.1.11:8080
iptables -t nat -A POSTROUTING -o $LOCALLINK -d 192.168.1.11 -p tcp --dport
8080 -j SNAT --to-source 192.168.1.1
iptables -t nat -A POSTROUTING -o $LOCALLINK -d 192.168.1.11 -p udp --dport
8080 -j SNAT --to-source 192.168.1.1
#################################

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


