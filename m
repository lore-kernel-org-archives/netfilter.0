From: mailinglists@belfin.ch
Subject: RE: rule check
Date: Thu, 16 Jan 2003 16:46:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <31347F3CE518D6118ACB00A0246AD0560B2674@mx.seaan.net>
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
To: netfilter@lists.netfilter.org


> Are these two rules essentially the same ?

no, they're not.
 
> Thanks,
> Mike
> 
> iptables -A FORWARD -i eth2 -o eth0 -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT

for traffic from eth2 over eth0 this rule is not restricted at all

> 
> iptables -A FORWARD -i eth2 -o eth0 -p tcp --dport 2000:2050 -m
> state --state NEW,ESTABLISHED,RELATED -j ACCEPT

this rule restricts to proto tcp and to destination ports 2000:2050

I just don't know what you neet the related for here. new,established does
the job.

Philipp



