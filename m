From: Frank Gruellich <frank@home.manuelm.org>
Subject: Re: blocking all traffic in port 137/137
Date: Wed, 16 Jun 2004 11:00:12 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040616090012.GT31253@home.manuelm.org>
References: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108> <1087322336.2054.12.camel@localhost> <1846.64.2.245.108.1087324894.squirrel@64.2.245.108> <200406152004.45544.Antony@Soft-Solutions.co.uk> <011701c4537e$891361b0$858310ac@suarapembaruan.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <011701c4537e$891361b0$858310ac@suarapembaruan.com>
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
To: netfilter@lists.netfilter.org

* david <david@suarapembaruan.co.id> 16. Jun 04:
> Dear all,

Hi,

> When i look at "IPTRAF", i see lot of broadcast traffic that using port 137
> and 138, how to make rules that can block all traffic in port 137 and 138, i
> already try to use this rules but its no works...

Additional to Antonys statement the OUTPUT-rules should be even more
useless.  Are you runnig netbios at a linux-box?

> iptables -A INPUT -p tcp --dport 137 DROP
> iptables -A INPUT -p udp --dport 137 DROP
> iptables -A INPUT -p tcp --dport 138 DROP
> iptables -A INPUT -p udp --dport 138 DROP
> iptables -A INPUT -p icmp DROP

And ICMP is _not_ bad.  Don't DROP it.

HTH,
 regards, Frank.
-- 
Sigmentation fault

