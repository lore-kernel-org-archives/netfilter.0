From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: two negatived parameters
Date: Tue, 07 Sep 2004 11:10:05 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <413DDD5D.1000006@pbl.ca>
References: <5943.1094471335@www56.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5943.1094471335@www56.gmx.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Akolinare@gmx.net wrote:
>>iptables -A FORWARD -s host1 -d host2 -j DROP
> 
> well sorry it is not that easy as it seems. The rule should forward pakets
> to a user-chain only if host1 ist not the source and host2 are is not the
> destination.

Actually, it is...  Let draw things out, so that you can see clearly 
where you made mistake...

What you have is !A AND !B, which is the same thing as !(A OR B), which 
gives you following table:

A B T
0 0 1
0 1 0
1 0 0
1 1 0

This obviously is not what you wanted.  It matches only when both source 
and destination of the packet are not as specified.

What you want is logical operation that will result in this table:

A B T
0 0 1
0 1 1
1 0 1
1 1 0

Translated from table to formula, this would be !(A AND B) (it is 
trivial to see that above is negated AND operator table), which could 
also be written as !A OR !B (if you preffer this form).  Now, AFAIK, 
neither of those can be acomplished directly in Netfilter as one liner. 
  You can only use and operator, and you can negate arguments only 
directly, and somehow I doubt you can specify -s or -d multiple times on 
same line.  But as a workaround, what  somebody (you ommited who when 
quoting) suggested will do exactly what you want:

    iptables -A FORWARD -s host1 -d host2 -j DROP
    iptables -A FORWARD -j ACCEPT

The first line will drop what you wanted to drop.  The second will 
accept all the rest.  Unless there were more rules to follow and more 
checks to be done for host1 and host2 (in which case, you can do them in 
user defined chain, and change first line to jump there instead of 
dropping packet right away).  Something along the lines of:

    iptables -A FORWARD -s host1 -d host2 -j SOMETHING
    iptables -A FORWARD -j ACCEPT
    iptables -N SOMETHING
    iptables -A SOMETHING -p tcp --dport 80 -j ACCEPT
    iptables -A SOMETHING -j DROP

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

