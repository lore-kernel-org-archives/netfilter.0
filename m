From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: ICMP, SYN, ACK flooding
Date: Fri, 5 Dec 2003 17:33:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312051733.53248.JALaramie@Loudoun-Fairfax.com>
References: <3FD1027E.70007@bodybuildingdiscount.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FD1027E.70007@bodybuildingdiscount.com>
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
To: netfilter@lists.netfilter.org

On Friday 05 December 2003 17:11, Robert Gil wrote:
> In this script for iptables i cant seem to get the icmp flood protection
> to work. Im limiting the icmp to 1/s and a burst of 4... (under ping of
> death), same goes for syn flood allthough im not quite sure how to test
> syn/ack/fin/xmas flooding. And how can i go about closing all ports to
> syn packets except the ones listed so i dont have the responding.
> Perhaps i have some things in the wrong order. Any help would be great.
>
>               ~Rob Gil
> #######################################################
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT ACCEPT
>
> iptables -A INPUT -j ACCEPT -p tcp --dport 21
> iptables -A INPUT -j ACCEPT -p tcp --dport 22
> iptables -A INPUT -j ACCEPT -p tcp --dport 25
> iptables -A INPUT -j ACCEPT -p tcp --dport 80
> iptables -A INPUT -j ACCEPT -p tcp --dport 110
> iptables -A INPUT -j ACCEPT -p tcp --dport 443
>
> iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -p udp -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
>

As a general rule it's good to have the ESTABLISHED, RELATED rule ahead of the 
generic ACCEPT rules since they will catch most of your packets.

Jeff


