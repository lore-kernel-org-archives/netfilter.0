From: "Thiago Lucas" <thiago@powers.com.br>
Subject: Re: UDP port redirect
Date: Wed, 1 Aug 2007 09:52:38 -0300
Message-ID: <OFA4C855BE.5EB3EB70-ON8325732A.0046BADD-8325732A.0046BD2D@powers.com.br>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hello Martijn,


Martijn Lievaart <m@rtij.nl> gravou em 01/08/2007 03:07:23:

> Not sure why this doesn't work, but you don't need the state match in 
> the NAT rule.

That state match in nat/prerouting, my mistake.. it shouldn't be there. 
But I don't believe that was the problem, as it just does nothing..

> iptables -t nat -A PREROUTING -i <ext_if> -p udp -d <ext_ip> --dport
> 22 -j DNAT  --to <int_ip>:1194
> iptables -A FORWARD -i <ext_if> -p udp -d <int_ip> --dport 1194 -m 
> state --state NEW -j ACCEPT
> 
> should work.

It should ! :-)

> 
> You may want to add an explicit LOG rule:
> 
> iptables -A FORWARD -i <ext_if> -p udp -d <int_ip> --dport 1194 -j 
> LOG --log-prefix "WRONG: "
> 
> or even
> 
> iptables -A FORWARD -p udp --dport 1194 -j LOG --log-prefix "WRONG: "


The connection never goes through :/

fw:/etc/iptables # iptables -t nat -L PREROUTING -n -v | grep -E 
'udp.*22.*1194'
    1    70 DNAT       udp  --  eth0   *       0.0.0.0/0 <ext_ip> udp 
dpt:22 to:192.168.10.254:1194 

fw:/etc/iptables # iptables -L FORWARD -n -v | grep -E 'LOG.*udp.*1194'
    0     0 LOG        udp  --  eth0   *       0.0.0.0/0 192.168.10.254  
udp dpt:1194 LOG flags 0 level 4 prefix `WRONG: ' 

> 
> 
> after the ACCEPT rule to debug this.
> 
> M4
> 
> 


