From: Peter Johnson <peter@thejohnsons.com.au>
Subject: Re: Strange setup
Date: 21 Jan 2003 07:42:00 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043095321.24583.78.camel@wizardslair>
References: <1648.10.35.120.83.1043012159.squirrel@mail.unixpimps.org>
	<1043015513.24583.16.camel@wizardslair> 
	<1084.10.35.120.83.1043023502.squirrel@mail.unixpimps.org> 
	<1043049030.24581.76.camel@wizardslair>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1043049030.24581.76.camel@wizardslair>
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
To: Netfiler E-Mail List <netfilter@lists.netfilter.org>

ooops ... before too many people comment, the IPs should have been 0-15
and 16-31


On Mon, 2003-01-20 at 18:50, Peter Johnson wrote:
> Ok, gotcha now...
> 
> Still do 
> ip rule add from $WAN_IP table $WAN_TABLE
> ip rule add from $WLAN_IP table $WLAN_TABLE
> and 
> ip route add default via $WAN_PEER_IP dev $WAN_IF table $WAN_TABLE
> ip route add default via $WLAN_PEER_IP dev $WAN_IF table $WLAN_TABLE
> 
> Add iptables rules approximately as follows:
> 
> $IPTABLES -t nat -A PREROUTING -i $WAN_IF -j DNAT $DMZ_IP_0-16
> $IPTABLES -t nat -A PREROUTING -i $WLAN_IF -j DNAT $DMZ_IP_17-32
> 
> $IPTABLES -t nat -A POSTROUTING -o $WAN_IF -j SNAT $WAN_IP
> $IPTABLES -t nat -A POSTROUTING -o $WLAN_IF -j SNAT $WLAN_IP
> 
> $IPTABLES -t filter -A FORWARD -i $WAN_IF -o $DMZ_IF -j ACCEPT
> $IPTABLES -t filter -A FORWARD -i $WLAN_IF -o $DMZ_IF -j ACCEPT
> 
> That takes care of the initial connection i.e. SYN packets. The IPTables
> nat table is only used on the initial packet on each connection.
> 
> For the actual routing, the only thing that I can think of is assigning
> two IPs (aliases) to each server in the DMZ say .0-16 for WAN and 17-32
> for WLAN then using
> 
> $IPTABLES -t mangle -A PREROUTING -s $DMZ_IP_0-16 -j MARK --set-mark 1
> and
> $IPTABLES -t mangle -A PREROUTING -s $DMZ_IP_17-32 -j MARK --set-mark 2
> 
> then add
> 
> ip rule add fwmark 1 table $WAN_TABLE
> and
> ip rule add fwmark 2 table $WLAN_TABLE
> 
> 
> Sorry but that is all I can come up with at the moment.
> 
> PJ
> 
> -- 
> 
> Quitters never win, and winners never quit, but those who never quit AND
> never win are idiots.
> 
> 
> 
> 
-- 

The truth is out there? Does anyone know the URL?

Homepage: http://www.wizardslair.net


