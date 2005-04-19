From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: IP Forwading from Local IP to Live IP
Date: Tue, 19 Apr 2005 14:12:13 -0500
Message-ID: <4265580D.9050906@riverviewtech.net>
References: <1079365863.2163.8.camel@vejan>	<200403151608.12073.Antony@Soft-Solutions.co.uk><002a01c544b5$2222c300$0b01a8c0@dap.edu.ph>	<4264B6FA.6080102@riverviewtech.net>
	<001b01c544bb$88d8a640$0b01a8c0@dap.edu.ph>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001b01c544bb$88d8a640$0b01a8c0@dap.edu.ph>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: elg3ne <sun@dap.edu.ph>
Cc: netfilter@lists.netfilter.org

> LOCALLINK="eth0"
> GLOBALLINK="eth1"
> ROUTER="yes"
> NAT="10.0.0.3"
> INTERFACES="lo eth0 eth1"
> SERVICES="8080 80"
> 
> if [ "$1" = "start" ]
> then
>         echo "Starting firewall..."
>         iptables --flush
>         iptables --table nat --flush
>         iptables --delete-chain
>         iptables --table nat --delete-chain
>         iptables -P INPUT DROP
>         iptables -A INPUT -i ! ${GLOBALLINK} -j ACCEPT
>         iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>         #enable public access to certain services
>         for x in ${SERVICES}
>         do
>             iptables -A INPUT -p tcp --dport ${x} -m state --state NEW -j ACCEPT
>         done
>        iptables -A INPUT -p tcp -i ${GLOBALLINK} -j REJECT --reject-with tcp-reset
>        iptables -A INPUT -p udp -i ${GLOBALLINK} -j REJECT --reject-with icmp-port-unreachable
>         #explicitly disable ECN
>         if [ -e /proc/sys/net/ipv4/tcp_ecn ]
>         then
>                 echo 0 > /proc/sys/net/ipv4/tcp_ecn
>         fi
> 
>         #disable spoofing on all interfaces
>         for x in ${INTERFACES}
>         do
>                 echo 1 > /proc/sys/net/ipv4/conf/${x}/rp_filter
>         done
> 
>         if [ "$ROUTER" = "yes" ]
>         then
>                 #we're a router of some kind, enable IP forwarding
>                 echo 1 > /proc/sys/net/ipv4/ip_forward
>                 if [ "$NAT" = "dynamic" ]
>                 then
>                         #dynamic IP address, use masquerading
>                         echo "Enabling masquerading (dynamic ip)..."
>                         iptables --table nat --append POSTROUTING -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
>                         iptables --table nat --append POSTROUTING --out-interface ${GLOBALLINK} -j MASQUERADE
>                         iptables --append FORWARD --in-interface ${LOCALLINK} -j ACCEPT
> 
> #################################
> iptables -t nat -A PREROUTING -i $GLOBALLINK -d 203.87.141.9 -p tcp --dport
> 8080 -j DNAT --to-destination 192.168.1.11:8080
> iptables -t nat -A PREROUTING -i $GLOBALLINK -d 203.87.141.9 -p udp --dport
> 8080 -j DNAT --to-destination 192.168.1.11:8080
> iptables -t nat -A POSTROUTING -o $LOCALLINK -d 192.168.1.11 -p tcp --dport
> 8080 -j SNAT --to-source 192.168.1.1
> iptables -t nat -A POSTROUTING -o $LOCALLINK -d 192.168.1.11 -p udp --dport
> 8080 -j SNAT --to-source 192.168.1.1
> #################################
> 
>                 elif [ "$NAT" != "" ]
>                 then
>                         #static IP, use SNAT
>                         echo "Enabling SNAT (static ip)..."
>                         iptables --table nat --append POSTROUTING -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
>                         iptables --table nat --append POSTROUTING --out-interface ${GLOBALLINK} -j SNAT --to-source ${NAT}
>                         iptables --append FORWARD --in-interface ${LOCALLINK} -j ACCEPT
> 
>                 fi
>         fi
> 
> elif [ "$1" = "stop" ]
> then
>         echo "Stopping firewall..."
>         iptables -F INPUT
>         iptables -F FORWARD
>         iptables -P INPUT ACCEPT
>         #turn off NAT/masquerading, if any
>         iptables -t nat -F POSTROUTING
> fi

Try moving your rules form the section that you have them in the the "then...fi" block below where they are at presently. Based on the fact that you have NAT set to something other than dynamic the section that you have your rules in will never be called.



Grant. . . .

