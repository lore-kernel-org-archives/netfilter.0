From: netfilter@tommi.org
Subject: Re: iptables and Poptop
Date: Mon, 9 Dec 2002 20:04:35 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021209200435.GA31098@ok.is>
References: <11FE00AA8C43D311ABE3000629B0CB481398E1@DBSISERVER>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <11FE00AA8C43D311ABE3000629B0CB481398E1@DBSISERVER>
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
Content-Transfer-Encoding: 7bit
To: Justin Kay <jkay@nwrecc.org>
Cc: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

I belive this is a PPP issue, try looking up the ppp proxyarp
option.

- Tomas Edwardsson
- Unix/Linux Support
- Opin Kerfi HF

On Mon, Dec 09, 2002 at 11:26:30AM -0700, Justin Kay wrote:
> From: Justin Kay <jkay@nwrecc.org>
> To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>
> Subject: iptables and Poptop
> X-Mailer: Internet Mail Service (5.5.2653.19)
> Date: Mon, 9 Dec 2002 11:26:30 -0700
> 
> I am trying to set up a server as a firewall/vpn server.  I am using
> iptables 1.2.6a and poptop 1.1.3.  I can connect to the poptop server just
> fine from the internet.  I can ping to the 10.0.0.1 address that my poptop
> server uses on the internal interface from the poptop client, but I don't
> get any further that that.  I can't ping anything else internally (ten net
> addresses) and I can't ping out to the address issued to the poptop client
> from a LAN machine.  Any ideas on where to look?
> 
> Rules:
> 
> ########################## Policy Section #########################
> 
> $IPTABLES -P INPUT DROP
> $IPTABLES -P OUTPUT DROP
> $IPTABLES -P FORWARD DROP
> 
> ####################### User defined chains #####################
> 
> $IPTABLES -N icmp_packets
> 
> $IPTABLES -A icmp_packets -p ICMP --icmp-type 8 -j ACCEPT
> $IPTABLES -A icmp_packets -p ICMP --icmp-type 11 -j ACCEPT
> $IPTABLES -A icmp_packets -p ICMP --icmp-type 3 -j ACCEPT
> $IPTABLES -A icmp_packets -p ICMP -s $LAN_IP_RANGE -j ACCEPT
> 
> ########################## Input Section ################################
> 
> $IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT
> $IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LAN_IP -j ACCEPT
> $IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET_IP -j ACCEPT
> $IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s $LAN_IP_RANGE -j ACCEPT
> 
> $IPTABLES -A INPUT -p ALL -d $INET_IP -m state --state ESTABLISHED,RELATED \
> 	-j ACCEPT
> $IPTABLES -A INPUT -p TCP --dport 1723 -j ACCEPT
> $IPTABLES -A INPUT -p 47 -j ACCEPT
> 
> $IPTABLES -A INPUT -i ppp+ -j ACCEPT
> 
> $IPTABLES -A INPUT -p ICMP -j icmp_packets
> 
> $IPTABLES -A INPUT -j LOG --log-prefix "INPUT chain "
> ########################### Forward Section #############################
> 
> $IPTABLES -A FORWARD -i $INET_IFACE -p tcp -d $NT --dport 25 -j ACCEPT
> $IPTABLES -A FORWARD -i $INET_IFACE -p tcp -d $NT --dport 110 -j ACCEPT
> $IPTABLES -A FORWARD -i $INET_IFACE -p tcp -d $TETON --dport 80 -j ACCEPT
> $IPTABLES -A FORWARD -i $INET_IFACE -p tcp -d $TETON --dport 443 -j ACCEPT
> #$IPTABLES -A FORWARD -p ICMP -j icmp_packets
> $IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
> $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> $IPTABLES -A FORWARD -i ppp+ -o $LAN_IFACE -j ACCEPT
> $IPTABLES -A FORWARD -i $LAN_IFACE -o ppp+ -j ACCEPT
> 
> $IPTABLES -A FORWARD -j LOG --log-prefix "FORWARD chain "
> ########################### Output Section ###############################
> 
> $IPTABLES -A OUTPUT -p ALL -o ppp+ -j ACCEPT
> $IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
> $IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
> $IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT
> $IPTABLES -A OUTPUT -p ALL -s $INET_IP2 -j ACCEPT
> $IPTABLES -A OUTPUT -p ALL -m state --state ESTABLISHED,RELATED -j ACCEPT 
> 
> $IPTABLES -A OUTPUT -j LOG --log-prefix "OUTPUT packet died: "
> 
> ########################## end script ####################################
> 
> Justin 

