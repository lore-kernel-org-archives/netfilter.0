From: "Omar Garcia" <omar.garcia@fractalia.biz>
Subject: Re: CONNMARK save-mark and restore-mark not working ?
Date: Fri, 18 Feb 2005 11:56:29 +0100
Message-ID: <004001c515a8$80403df0$910010ac@coco>
References: <20050218084044.GA31190@elm.home.idallen.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

And this?

    iptables -t mangle -A OUTPUT -j CONNMARK --restore-mark
    iptables -t mangle -A OUTPUT -m connmark ! --mark 0 -j ACCEPT
    iptables -t mangle -A OUTPUT -j MARK --set-mark 9
    iptables -t mangle -A OUTPUT -j CONNMARK --save-mark

----- Original Message ----- 
From: "Ian! D. Allen" <idallen@idallen.ca>
To: <netfilter@lists.netfilter.org>
Sent: Friday, February 18, 2005 9:40 AM
Subject: CONNMARK save-mark and restore-mark not working ?


> I think this pair (marking connections with "9"):
>
>     iptables -t mangle -A OUTPUT -j MARK --set-mark 9
>     iptables -t mangle -A OUTPUT -j CONNMARK --set-mark 9
>
> should be equivalent to this pair:
>
>     iptables -t mangle -A OUTPUT -j MARK --set-mark 9
>     iptables -t mangle -A OUTPUT -j CONNMARK --save-mark
>
> The first pair works - I get mark=9 entries in /proc/net/ip_conntrack .
> The second pair does not - I get no marks at all in ip_conntrack.
>
> I think this pair should set packet marks from the ip_conntrack marks:
>
>     iptables -t mangle -A OUTPUT -j CONNMARK --set-mark 9
>     iptables -t mangle -A OUTPUT -j CONNMARK --restore-mark
>
> It does not - the packets aren't marked:
>
> Chain OUTPUT (policy ACCEPT 2989 packets, 395K bytes)
>  pkts bytes target     prot opt in     out     source
destination
>  1695  178K CONNMARK   all  --  *      *       0.0.0.0/0
0.0.0.0/0           CONNMARK set 0x9
>  1695  178K CONNMARK   all  --  *      *       0.0.0.0/0
0.0.0.0/0           CONNMARK restore
>     0     0 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0           MARK match 0x9 LOG flags 1 level 7 prefix `IDAMARK '
>  1695  178K            all  --  *      *       0.0.0.0/0
0.0.0.0/0           MARK match 0x0
>
> What am I missing?
>
> Linux elm 2.6.10-1mdk #2 Sat Jan 29 13:10:11 EST
> 2005 i686 AMD Athlon(tm) XP 3200+ unknown GNU/Linux
>
> -- 
> -IAN!  Ian! D. Allen   Ottawa, Ontario, Canada
>        EMail: idallen@idallen.ca   WWW: http://www.idallen.com/
>        College professor (Linux) via: http://teaching.idallen.com/
>        Support free and open public digital rights:  http://eff.org/
>
>



