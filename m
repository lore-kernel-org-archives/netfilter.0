From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: ICMP floods
Date: Wed, 15 Oct 2003 03:06:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310150306.19623.Alistair@nerdnet.ca>
References: <01d501c392d0$0a9efbb0$de0018ac@admin.monash.edu.my>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <01d501c392d0$0a9efbb0$de0018ac@admin.monash.edu.my>
Content-Disposition: inline
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
To: eturner@monash.edu.my, netfilter@lists.netfilter.org

On October 14, 2003 11:54 pm, Edmund Turner wrote:
> Hey everyone!
> Im tyring to create a proper ICMP chain that will blocked ICMP flooding
> by Viruses and DOS attacks. Would the ruleset below be sufficient?
> I cant simulate the exact ICMP flooding, so im only assuming that
> limiting the ICMP burst to 10 /sec and limiting it to 5/sec.
>
> Any input is appreciated!!
>
> #####################
> #####ICMP CHAINS#####
> #####################
> /sbin/iptables -N ICMP
> /sbin/iptables -F ICMP
> /sbin/iptables -A ICMP -m limit -p ICMP -i eth2 --limit 1 --limit-burst
> 10
> /sbin/iptables -A ICMP -m limit -p ICMP -i eth1 --limit 1 --limit-burst
> 10
> /sbin/iptables -A ICMP -m limit -p ICMP -i eth0 --limit 1 --limit-burst
> 10
> /sbin/iptables -A ICMP -p icmp --icmp-type echo-reply -j ACCEPT
> /sbin/iptables -A ICMP -p icmp --icmp-type destination-unreachable -j
> ACCEPT
> /sbin/iptables -A ICMP -p icmp --icmp-type source-quench -j ACCEPT
> /sbin/iptables -A ICMP -p icmp --icmp-type time-exceeded -j ACCEPT
> #/sbin/iptables -A ICMP -p icmp --icmp-type echo-request  -j ACCEPT
> /sbin/iptables -A ICMP -p icmp --icmp-type echo-request -m limit --limit
> 5/second  -j ACCEPT

The  limit rule above will never be used as the packets are allready accepted 
by the rule above it.



> /sbin/iptables -A ICMP -p icmp -j LOG --log-level 5 --log-prefix "ICMP
> DROP: "
> /sbin/iptables -A ICMP -p icmp -j DROP
>
>
> regards
> edmund

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

