From: "john doe" <d_j_d@hotmail.com>
Subject: Re: iptables forwarding problems
Date: Sun, 23 Feb 2003 17:22:33 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY2-F199gmoZqWNaZX00033086@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


>From: "Matt Riggs" <matt.riggs@beasleyallen.com>
>To: <netfilter@lists.netfilter.org>
>Subject: iptables forwarding problems
>Date: Fri, 21 Feb 2003 12:46:58 -0600
>
>I am confused. I am trying to port forward ftp from a specific host to a 
>server on my private network.
>
>I was under the impression that specifying a rule such as $iptables -t nat 
>-A PREROUTING -p tcp -s IP -d IP --dport 21 -j DNAT --to IP:21 would allow 
>this connection.

Half the truth. This rule only states what to do when packets from your 
specific outside ip go to your ip:21 : change the destination to ip:21 on 
your lan. you still have to specifically allow traffic between the out- and 
inside-hosts to be forwarded in the FORWARD chain.

>
>The Catch ALL rule.
>$iptables -A INPUT -j DROP
>$iptables -A OUTPUT -j DROP
>$iptables -A FORWARD -j DROP
>
>I realize it says to DROP FORWARDs but I was under the assumption that 
>since i declared a specific rule, it would DROP everything else( i.e. allow 
>that one forward rule)
>
>Am I completely wrong...please explain....
>
>Thanks in advance
>
>Matt
>
>
>
>
>
No not completely. you were on track. However, there's still work to be done 
'cause this allows ftp control traffic between the hosts only. For actual 
data transfers you need rules depending on whether active or passive ftp is 
involved.

There's a good example on the netfilter website about this.
Have look at http://www.sns.ias.edu/~jns/security/iptables/index.html#CONFIG
and look at the ftp part of the example script.

_________________________________________________________________
MSN 8 with e-mail virus protection service: 2 months FREE* 
http://join.msn.com/?page=features/virus


