From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: return
Date: Fri, 4 Jun 2004 11:22:19 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <016801c44a3f$57dc7fc0$49caa8c0@caris.priv>
References: <00f201c44a39$599a9230$49caa8c0@caris.priv> <20040604135810.GO20290@home.manuelm.org>
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
Content-Type: text/plain; charset="us-ascii"
To: Frank Gruellich <frank@home.manuelm.org>, netfilter <netfilter@lists.netfilter.org>

oops .. that was a typo ... (the missing -p tcp) ...

However, assuming that was there ....
I thought the return uses the default policy if and only if it was attached
to either input, forward, or output chains ....
my understanding of it for other chains, is that it would just "return" the
chain it came from ....

so in my case, if nothing was matched at the end of subchain1, then it would
just jump back to the chain that called it (forwared), and continue parseing
the rules .....

So ... if this is trued (and if it is not, please let me know), is this an
efficiant way to do this ... if it is not, then let me know.

My problem is, there are some useres who require nats to other companies ...
somtimes a couple of users require the same rule set .... so assuming that
my nat tables are correct ( i did not include them), I wanted to do the
following.

-A Forward -s 192.168.200.5 -o eth1 -j subchain1
-A Forward -s 192.168.200.6 -o eth1 -j subchain1
-A Forward -s 192.168.200.0/24 -o eth1 -j subchain2

-A subchain1 -d 200.200.200.200 --dport 1234 -j ACCEPT
-A subchain1 -d 200.200.300.300 --dport 4321 -j ACCEPT
-A subchain1 -j RETURN

-A subchain2 .......... blah blah blah ....

If I did a "Reject" or "Drop" at the end of subchain1, then the 200.5 and
200.6 users would never get to subchain2 (they would drop into subchain1
because it matches their source ...)

Thank you again for the help.

Peter

----- Original Message ----- 
From: "Frank Gruellich" <frank@home.manuelm.org>
To: "netfilter" <netfilter@lists.netfilter.org>
Sent: Friday, June 04, 2004 10:58 AM
Subject: Re: return


* Peter Marshall <peter.marshall@caris.com>  4. Jun 04:
> I was just wondering if anyone here uses "return" in their rules ..

Not really, but I know when I should use it.

> -A Forward -s 192.168.200.5 -o eth1 -j subchain1
> -A Forward -s 192.168.200.0/24 -o eth1 -j subchain2
>
> -A subchain1 -d 200.200.200.200 --dport 1234 -j ACCEPT

BTW: this rule will not work.  --dport without -p is not valid.

> -A subchain1 -d 200.200.300.300 --dport 4321 -j ACCEPT
> -A subchain1 -j RETURN

Well, if this is the last rule in subchain1 it is useless, as RETURN is
something like the default polycy of userdefined chain.  If you want to
apply a large ruleset to a whole subnet expect a couple of host (e.g.
cause you don't like them) you could do something like:

$IPT -N subchain1
# not for the bad hosts
$IPT -A subchain1 -j RETURN    -s 192.168.0.23
$IPT -A subchain1 -j RETURN    -s 192.168.0.55
$IPT -A subchain1 -j ACCEPT    -p tcp --dport 4662
# lot more $IPT -A subchain1 ...
$IPT -A FORWARD   -j subchain1 -s 192.168.0.0/24
$IPT -A FORWARD   -j ACCEPT    -p tcp --dport 80

> Also, I was wondering is there a way to specify multiple source ip address
?
> ex -s 192.168.200.5, 192.168.200.20 .....

Not with unpatched iptables.  Use two rules or search the pom.

HTH,
 regards, Frank.
-- 
Sigmentation fault


