From: Gary Hodder <vk2kcf@miacomputers.com>
Subject: RE: Forwarding intranet ip's
Date: 21 Oct 2002 23:04:08 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035205458.2741.12.camel@sandy.vk2kcf.ampr.org>
References: <D502122A1694B04EAE0F53D53CC2F764017581@exch2k-01.infopart.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D502122A1694B04EAE0F53D53CC2F764017581@exch2k-01.infopart.nl>
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
To: Ferry van Steen <ferry.van.steen@InfoPart.nl>
Cc: netfilter <netfilter@lists.netfilter.org>

Hi Ferry,

the problems is fixed.
A tcpdump -i eth1 shows it works fine.
Me goes stand in corner and writes, must forward packets both way :)
The second iptables rule below was not added.
To your other msg, the client I was using is 192.168.150.50 :)

Thanks for the help.
Regards
Gary.

> Oh I forgot. I only see one line....
> -t filter is default btw so I'll omit
> 
> iptables -A FORWARD -s 192.168.150.0/255.255.255.0 -i eth0 -d
> 192.168.151.0/255.255.255.0 -o eth1 -j ACCEPT
> iptables -A FORWARD -s 192.168.151.0/255.255.255.0 -i eth1 -d
> 192.168.150.0/255.255.255.0 -o eth0 -j ACCEPT
> 
> Remember that traffic is always two ways. For traffic to exist not only
> should 150.x be allowed to send to 151.x, 151.x should also know how to
> and be allowed to send to 150.x
> 
> In short
> 
> The 192.168.150.x network should have routes to the 192.168.151.x
> network and have firewall access
> The 192.168.151.x network should have routes to the 192.168.150.x
> network and have firewall access
> The linux server should have both routes (it has by default since it has
> network cards/interfaces in those segments) and have ip_forwarding
> enabled (you did this) and shouldn't block the traffic by any means
> (iptables comes to mind as does rp_filter, but rp_filter should be safe
> in this case)
> 
> Regards
> 
> 



