From: Mike Giggey <m.giggey@utoronto.ca>
Subject: Re: unable to re-configure?
Date: Mon, 27 Jun 2005 11:02:31 -0400
Message-ID: <200506271102.31329.m.giggey@utoronto.ca>
References: <200506271025.32340.m.giggey@utoronto.ca>
	<20050627144030.GA16972@casa.e-den.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050627144030.GA16972@casa.e-den.it>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org
Cc: Sandro Dentella <sandro@e-den.it>

On June 27, 2005 10:40, Sandro Dentella wrote:
> I guess the problem is tha you ACCEPT udp/1194 after you already
> REJECTed. You should accept it before.
> 
> REJECT, (man iptables learns), is a "terminating TARGET, ending rule
> transversal" 
Thanks! Good point!

I corrected for this; restarted and get the same problem.


{iptables}
[root@here]# /sbin/iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination
RH-Firewall-1-INPUT  all  --  anywhere             anywhere

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
RH-Firewall-1-INPUT  all  --  anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain RH-Firewall-1-INPUT (2 references)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
ACCEPT     icmp --  anywhere             anywhere            icmp any
ACCEPT     ipv6-crypt--  anywhere             anywhere
ACCEPT     ipv6-auth--  anywhere             anywhere
ACCEPT     udp  --  anywhere             224.0.0.251         udp dpt:5353
ACCEPT     udp  --  anywhere             anywhere            udp dpt:ipp
ACCEPT     all  --  anywhere             anywhere            state RELATED,ESTABLISHED
ACCEPT     tcp  --  anywhere             anywhere            state NEW tcp dpt:ssh
ACCEPT     udp  --  anywhere             anywhere            state NEW udp dpt:1194
REJECT     all  --  anywhere             anywhere            reject-with icmp-host-prohibited

{nmap}
[root@there]# nmap -sU -p U:1194  {ip of here}

Starting nmap 3.50 ( http://www.insecure.org/nmap/ ) at 2005-06-27 11:00 EDT
Interesting ports on here (ip of here):
PORT     STATE  SERVICE
1194/udp closed unknown

Nmap run completed -- 1 IP address (1 host up) scanned in 0.842 seconds


