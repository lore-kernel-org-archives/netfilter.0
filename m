From: Frank Gruellich <frank@home.manuelm.org>
Subject: Re: return
Date: Fri, 4 Jun 2004 15:58:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040604135810.GO20290@home.manuelm.org>
References: <00f201c44a39$599a9230$49caa8c0@caris.priv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <00f201c44a39$599a9230$49caa8c0@caris.priv>
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
To: netfilter <netfilter@lists.netfilter.org>

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

> Also, I was wondering is there a way to specify multiple source ip address ?
> ex -s 192.168.200.5, 192.168.200.20 .....

Not with unpatched iptables.  Use two rules or search the pom.

HTH,
 regards, Frank.
-- 
Sigmentation fault

