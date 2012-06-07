From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset: stops working after a while
Date: Thu, 7 Jun 2012 08:59:38 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1206070856221.11710@blackhole.kfki.hu>
References: <4FD03AE5.9000509@gmc.lt>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4FD03AE5.9000509@gmc.lt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aidas Kasparas <a.kasparas@gmc.lt>
Cc: netfilter@vger.kernel.org

On Thu, 7 Jun 2012, Aidas Kasparas wrote:

> I have a strange problem with iptables/ipset. I'm under 80Mbps+ SYN
> flood (if to believe hoster's monitoring). Attack is not sofisticated --
> SYN packet's source address is [pseudo]random, spread more or less
> evenly over all available IPv4 address space (even block E). Idea was to
> drop first SYN packet from every IP address I haven't seen in past 10
> secs. So, I set up the following setup:
> 
> iptables -N firstdrop
> 
> iptables -N fd_0; iptables -A firstdrop -s 0.0.0.0/5 -j fd_0
> iptables -N fd_8; iptables -A firstdrop -s 8.0.0.0/5 -j fd_8
> ...
> iptables -N fd_216; iptables -A firstdrop -s 216.0.0.0/5 -j fd_216
> 
> ipset create fd_1 hash:ip timeout 10
> ipset create fd_2 hash:ip timeout 10
> ...
> ipset create fd_223 hash:ip timeout 10
> 
> iptables -A fd_0 -s 1.0.0.0/8 -m set --match-set fd_1 src -j RETURN;
> iptables -A fd_0 -s 1.0.0.0/8 -j SET --add-set fd_1 src;
> iptables -A fd_0 -s 2.0.0.0/8 -m set --match-set fd_2 src -j RETURN;
> iptables -A fd_0 -s 2.0.0.0/8 -j SET --add-set fd_2 src;
> ...
> iptables -A fd_0 -s 7.0.0.0/8 -m set --match-set fd_7 src -j RETURN;
> iptables -A fd_0 -s 7.0.0.0/8 -j SET --add-set fd_7 src;
> iptables -A fd_8 -s 8.0.0.0/8 -m set --match-set fd_8 src -j RETURN;
> iptables -A fd_8 -s 8.0.0.0/8 -j SET --add-set fd_8 src;
> ...
> iptables -A fd_216 -s 223.0.0.0/8 -m set --match-set fd_223 src -j RETURN;
> iptables -A fd_216 -s 223.0.0.0/8 -j SET --add-set fd_223 src;
> 
> iptables -A fd_0 -j DROP
> iptables -A fd_8 -j DROP
> ...
> iptables -A fd_216 -j DROP
> 
> iptables -A INPUT -s admin's_IP -j ACCEPT
> iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A INPUT -j firstdrop
> 
> That works. Legitimate connections goes through. Outgoing traffic drops
> to few megabits, as required for normal operations.
> 
> But, after a while (sometimes day, sometimes few hours) no IP addresses
> are added to fd_$i's by these iptables rules. And all the packets become
> DROP'ed. But if I try to add address by ipset command, or by different
> iptables rule -- then these addresses are added to ipsets (not sure, if
> that would work for any and all of them).

Maybe your given set gets full. From the manpage:

"When  entries  added  by the SET target of iptables/ip6tables, then the
hash size is fixed and the set won't be duplicated,  even  if  the  new
entry cannot be added to the set."

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
