From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Iptables problem
Date: Thu, 13 Mar 2003 11:16:23 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0303131110400.30819@dns.toxicfilms.tv>
References: <009401c2e946$eb346fe0$0700a8c0@dale>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <009401c2e946$eb346fe0$0700a8c0@dale>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: De Jager Laubscher <dejager@think.co.za>
Cc: netfilter@lists.netfilter.org

> Can anyonne please tell me how to open port 1500 to 1511 on my NAT box
> using iptable on slackeware ??
You have not written what do you want precisely, so i will give a few
examples. But PLEASE READ THE HOWTO, it is very informative. It is vital
to know how it all works.
I will assume TCP.
If you want to open these ports _to_ the NAT box use:
# iptables -A INPUT -p tcp --dport 1500:1511 -j ACCEPT

If you want to NAT these ports do:
# iptables -t nat -A PREROUTING -i $EXT -p tcp --dport 1500 -j DNAT \
	--to x.y.z.a

Remember that if doing 1:1 NAT requiers a similar rule for SNAT on
POSTROUTING.

If you want to NAT and change the ports do:
# iptables -t nat -A PREROUTING -i $EXT -p tcp --dport 1500 -j DNAT \
	--to x.y.z.a:other_port

of course read also:
# iptables -j DNAT --help
# iptables -j SNAT --help
# iptables -p tcp --help

Regards,
Maciej Soltysiak


