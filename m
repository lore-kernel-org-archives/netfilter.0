From: Jason Opperisano <opie@817west.com>
Subject: Re: Shareaza and IPtables
Date: Sun, 14 Nov 2004 12:32:23 -0500
Message-ID: <20041114173223.GA1071@bender.817west.com>
References: <20041114041647.120.qmail@web40727.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041114041647.120.qmail@web40727.mail.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sat, Nov 13, 2004 at 08:16:47PM -0800, Tasha Smith wrote:
> Hii Everyone,
> 
> I am running Shareza(P2P) program on my laptop behind my Router/Firewall running
> Linix 7.3 and Iptables 1.2.7a. Iam trying to open up port 6346 on my firewall so
> it forwards it to my laptop where Sharaza is running. My OUTBOUND rule is
> already sent to ACCEPT
> # Set the default policy to drop.
> $iptables --policy INPUT DROP
> $iptables --policy FORWARD DROP
> $iptables --policy OUTPUT ACCEPT

the OUTPUT chain covers packets originating from the firewall
itself--your FORWARD policy; which covers packets routed through the
firewall, is set to DROP.

> $iptables -t nat --policy PREROUTING ACCEPT
> $iptables -t nat --policy OUTPUT ACCEPT
> $iptables -t nat --policy POSTROUTING ACCEPT
> 
> Here is Shareza's connection test the i keep timing out on.
> http://www.crucial-forums.com/connectiontest/
> 
> I have Shareza's port configured to 6346.
> My firewall rule that i thought should work but are not are here. This is for
> emule as well. Any help guys to get this going. I googled but couldnt find
> anything really useful on this.

something useful would be to clue us into whether eth1 is internal or
external--i'm going to *assume* it's internal and eth0 is external...

> #My rules for EMULE;
> $iptables -A INPUT -p tcp --dport 4662 -j ACCEPT
> $iptables -A OUTPUT -p tcp -m multiport --sport 4661,4662 -j ACCEPT
> $iptables -t nat -A PREROUTING -p tcp --dport 4662 -j DNAT --to 192.168.0.69

how's about a NAT rule for shareaza?

  iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 6346 \
    -j DNAT --to-destination $LAPTOP_IP

> #These are my Forwarding rules.
> $iptables -A FORWARD -i eth1 -p tcp --dport 80 -j ACCEPT
> $iptables -A FORWARD -i eth1 -p tcp -m multiport --dport 25,80,110,443 -j ACCEPT
> $iptables -A FORWARD -i eth1 -p tcp --dport 21 -j ACCEPT
> $iptables -A FORWARD -i eth1 -p tcp --dport 22 -j ACCEPT
> $iptables -A FORWARD -i eth1 -p tcp -m multiport --dport
> 1040,1043,1046,1047,1048,1050,1051,1052,1053,1054 -j ACCEPT
> $iptables -A FORWARD -i eth1 -p udp --dport 500 -j ACCEPT
> $iptables -A FORWARD -i eth1 -p 50 -j ACCEPT
> $iptables -A FORWARD -i eth1 -p 51 -j ACCEPT
> #$iptables -A FORWARD -i eth1 -p udp --dport 10000 -j ACCEPT
> $iptables -A FORWARD -i eth1 -p udp --dport 1863 -j ACCEPT
> $iptables -A FORWARD -i eth1 -p tcp --dport 1863 -j ACCEPT
> $iptables -A FORWARD -i eth1 -p tcp -m multiport --dport 135,137,138,139 -j
> ACCEPT
> $iptables -A FORWARD -i eth1 -p udp -m multiport --dport 135,137,138,139 -j
> ACCEPT
> $iptables -A FORWARD -i eth1 -p tcp --dport 1214 -j ACCEPT
> $iptables -A FORWARD -i eth1 -p udp --dport 1214 -j ACCEPT
> $iptables -A FORWARD -i eth1 -p udp --dport 2644 -j ACCEPT
> $iptables -A FORWARD -i eth1 -p tcp --dport 3389 -j ACCEPT
> $iptables -A FORWARD -i eth1 -p udp --dport 3389 -j ACCEPT
> $iptables -A FORWARD -i eth1 -p tcp -m multiport --dport 6344,6345,6346,6347 -j
> ACCEPT
> $iptables -A FORWARD -i eth1 -p udp -m multiport --dport 6344,6345,6346,6347 -j
> ACCEPT
> $iptables -A FORWARD -i eth1 -p tcp -m multiport --dport 4242,4661,4662 -j
> ACCEPT
> $iptables -A FORWARD -i eth1 -p udp -m multiport --dport 4661,4662,4772 -j
> ACCEPT
> $iptables -A FORWARD -p tcp --dport 4662 -i eth0 -o eth1 -j ACCEPT
> $iptables -A FORWARD -p udp --dport 4662 -i eth0 -o eth1 -j ACCEPT

how's about a rule for shareaza?

  iptables -A FORWARD -i eth0 -o eth1 -p tcp \
    --dport 6346 -d $LAPTOP_IP -j ACCEPT

> # Enables Packet Forwarding
> $iptables -t nat -A POSTROUTING -o eth0  -j MASQUERADE
> 
> echo 1 > /proc/sys/net/ipv4/ip_forward

-j

-- 
Jason Opperisano <opie@817west.com>

