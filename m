From: Evan Pierce <evan@pierce.co.za>
Subject: Re: Load Balancing issue
Date: Mon, 11 Apr 2011 18:23:46 +0200
Message-ID: <4DA32B12.40309@pierce.co.za>
References: <4DA2CB4D.2070402@pierce.co.za> <4DA2F4A7.4030902@kickstone.com> <4DA2FB80.4050306@pierce.co.za> <4DA32055.9030904@kickstone.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DA32055.9030904@kickstone.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Lister <john.lister@kickstone.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


> Generally, i have separate tables that do the mark/saving so as to only
> put the rules in once.
> I also have a route for the local net in my fwmark(ed) tables.
> 
> 
> Hope that helps
> 
> John
> 
> 
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

John

I now have rules as such

ip route add table 4 default via 192.168.1.1
ip route add table 4 192.168.11.0/24 via 192.168.11.1
iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
iptables -t mangle -A PREROUTING -p tcp --dport 80 -s 192.168.11.0/24 -j
MARK --set-mark 4
iptables -t mangle -A PREROUTING -p tcp --dport 443 -s 192.168.11.0/24
-j MARK --set-mark 4
iptables -t nat -A POSTROUTING -o $EXTERNAL2 -j SNAT --to-source 192.168.1.2
iptables -t nat -A POSTROUTING -o $EXTERNAL -j SNAT --to-source 196.212.0.42
iptables -t mangle -A PREROUTING -j CONNMARK --save-mark
ip rule add fwmark 4 table 4
ip route flush cache

Still no joy - maybe soemthing I need to fiddle with under /proc/sys?

Evan
