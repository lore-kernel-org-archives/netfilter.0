From: Sandro Dentella <sandro@e-den.it>
Subject: Re: unable to re-configure?
Date: Mon, 27 Jun 2005 16:40:30 +0200
Message-ID: <20050627144030.GA16972@casa.e-den.it>
References: <200506271025.32340.m.giggey@utoronto.ca>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200506271025.32340.m.giggey@utoronto.ca>
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

> Would like to get port 1194 open (UDP).

> [root@here]# /sbin/iptables -L
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
> RH-Firewall-1-INPUT  all  --  anywhere             anywhere
> 
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
> RH-Firewall-1-INPUT  all  --  anywhere             anywhere
> 
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
> 
> Chain RH-Firewall-1-INPUT (2 references)
> target     prot opt source               destination
> ACCEPT     all  --  anywhere             anywhere
> ACCEPT     icmp --  anywhere             anywhere            icmp any
> ACCEPT     ipv6-crypt--  anywhere             anywhere
> ACCEPT     ipv6-auth--  anywhere             anywhere
> ACCEPT     udp  --  anywhere             224.0.0.251         udp dpt:5353
> ACCEPT     udp  --  anywhere             anywhere            udp dpt:ipp
> ACCEPT     all  --  anywhere             anywhere            state RELATED,ESTABLISHED
> ACCEPT     tcp  --  anywhere             anywhere            state NEW tcp dpt:ssh
> REJECT     all  --  anywhere             anywhere            reject-with icmp-host-prohibited
> ACCEPT     udp  --  anywhere             anywhere            state NEW udp dpt:1194

I guess the problem is tha you ACCEPT udp/1194 after you already
REJECTed. You should accept it before.

REJECT, (man iptables learns), is a "terminating TARGET, ending rule
transversal" 

*:-)

-- 
Sandro Dentella  *:-)
e-mail: sandro@e-den.it 
http://www.tksql.org                    TkSQL Home page - My GPL work

