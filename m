From: "Javier Govea" <jgovea@magma.ca>
Subject: Re: Round Robin Load Balancing
Date: Sun, 10 Aug 2003 15:07:42 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308101907.h7AJ7gTV018617@webmail1.magma.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>, Javier Govea <jgovea@magma.ca>
Cc: netfilter@lists.netfilter.org

Hi guys, sorry about this late response, i've been playing with the kernel during this
time. Well, i tested the CONNMARK option (the rules i tested are below) for the round
robin, but i still get the same problem, when my browser just doesn't load any webpage and
eventually times out. 

I hacked into the iptables modules: ipt_MASQUERADE and ip_tables and put some "printk"s to
see what was happening. The "printk"s in the ip_tables module show that the ppp links are
 chosen in a round robin fashion, which is very good. The rules I'm shoing below use
"-j SNAT --to-source <ppp0-ip-addr>" in the NAT table. I however used  
"-j MASQUERADE" instead because i believe this two jumps are equivalent and because i put
some prints in the ipt_MASQUERADE module. Well the prints from the MASQUERADE module
doesn't show anything, which means that the packets are never been masqueraded. 

So my browser is timing out because the packets, if they are sent at all, they are not
being masqueraded, so they don't know how to return.

The CONNMARK
 
> iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source <ppp0-ip-addr>
> iptables -t nat -A POSTROUTING -o ppp1 -j SNAT --to-source <ppp1-ip-addr>
> iptables -t nat -A POSTROUTING -o ppp2 -j SNAT --to-source <ppp2-ip-addr>
> iptables -t nat -A POSTROUTING -o ppp3 -j SNAT --to-source <ppp3-ip-addr>
> 
> iptables -t mangle -A PREROUTING -m nth --every 4 --packet 1 -m state --state new  -j
CONNMARK --set-mark 1
> iptables -t mangle -A PREROUTING -m nth --every 4 --packet 2 -m state --state new  -j
CONNMARK --set-mark 2
> iptables -t mangle -A PREROUTING -m nth --every 4 --packet 3 -m state --state new  -j
CONNMARK --set-mark 3
> iptables -t mangle -A PREROUTING -m nth --every 4 --packet 0 -m state --state new  -j
CONNMARK --set-mark 4
> 
> iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 1 -m state --state new  -j
CONNMARK --set-mark 1
> iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 2 -m state --state new  -j
CONNMARK --set-mark 2
> iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 3 -m state --state new  -j
CONNMARK --set-mark 3
> iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 0 -m state --state new  -j
CONNMARK --set-mark 4
> 
> iptables -t mangle -A POSTROUTING -m connmark --mark 1 -j ROUTE --oif ppp1
> iptables -t mangle -A POSTROUTING -m connmark --mark 2 -j ROUTE --oif ppp2
> iptables -t mangle -A POSTROUTING -m connmark --mark 3 -j ROUTE --oif ppp3
> iptables -t mangle -A POSTROUTING -m connmark --mark 4 -j ROUTE --oif ppp0
> 
> Haven't had the chance to test it, though.
> 
> Ramin
> 
> 

