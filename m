From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: iptables -A OUTPUT --set-mark , routing
Date: Thu, 22 Jul 2004 12:09:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3063e504072203097839f9b1@mail.gmail.com>
References: <40FE316C.50109@belkam.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40FE316C.50109@belkam.com>
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

First, for marks, use hexa numbers, like --set-mark 0x80 and .. fwmark 0x80

I don;t know what proto static nexthop is, i dont use them :)
Make sure you did an ip route flush cache

On Wed, 21 Jul 2004 14:03:40 +0500, Dmitry Melekhov <dm@belkam.com> wrote:
> Hello!
> 
> I need to route traffic to specific port from localhost to specific gateway.
> 
> I'm testing this on icmp.
> 
> I wrote rules:
> 
> iptables -t mangle -A OUTPUT -p icmp -j MARK --set-mark 80
> ip rule add prio 221 table 221 fwmark 80
> ip route add default table 221 proto static  nexthop via 192.168.22.221
> dev eth0
> 
> Then I try to ping something from different subnet:
> 
> ping 10.1.1.1
> connect: Network is unreachable
> 
> If I add rule
> iptables -t mangle -A PREROUTING -p icmp -j MARK --set-mark 80
> 
> Then I can successefully ping 10.1.1.1 from another host (my host is
> default gw for it, it's address is 192.168.22.229).
> 
> Hmmm.
> 
> How can I route marked packets from localhost?
> 
> ping 10.1.1.1
> PING 10.1.1.1 (10.1.1.1) from 192.168.22.254 : 56(84) bytes of data.
>  From 192.168.22.229: icmp_seq=1 Redirect Host(New nexthop: 192.168.22.221)
> 
>

