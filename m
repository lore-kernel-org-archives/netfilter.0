From: Roberto Nibali <ratz@tac.ch>
Subject: Re: Loding rules
Date: Mon, 16 Dec 2002 11:47:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DFDAF5B.1070800@tac.ch>
References: <3df77ff9.7a14.0@unacs.bg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: nedco@unacs.bg
Cc: netfilter@lists.netfilter.org

> Hi,
>  How to load fast about 20000 rules in iptables.
>  If some document will be help , please let me know  :)

Netfilter is not designed for that. Please use the nf-hipac[1] drop-in 
replacement. NF-hipac will do the filtering and rule organisation for you and 
for the rest (NAT, mangle) you can still use netfilter. Also you should check if 
you can't logically draw a binary tree with your rules which would then result 
in faster matching lookup (at least with netfilter).

And no: iptables-save/restore is _not_ an option for dynamically changing rules!

If you have that many rules you certainly have a logic or kind of a matrix 
behind that. Try to use some algebraic transformations (linear translation, 
Laplace (define network flows), Gauss, TSP, ...) to optimize the ruleset. I have 
done this and successfully reduced the number of rules.

[1] http://www.hipac.org

Regards,
Roberto Nibali, ratz
-- 
echo '[q]sa[ln0=aln256%Pln256/snlbx]sb3135071790101768542287578439snlbxq' | dc


