From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Instructions on how to redirect port 80 to port 8080
Date: Wed, 18 Feb 2004 14:19:04 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402181419.04235.Antony@Soft-Solutions.co.uk>
References: <9908FCB837A50642B74E2BEC198843095CC652@csrees-exchsrvb.csrees.usda.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <9908FCB837A50642B74E2BEC198843095CC652@csrees-exchsrvb.csrees.usda.gov>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Wednesday 18 February 2004 2:06 pm, Martinez, Michael wrote:

> --> iptables -A PREROUTING -t nat -d a.b.c.d -p tcp --dport 80
> --> -j REDIRECT --to 8080
>
> This isn't working. I can "telnet `hostname` 8080" and get an http
> response, but when I do "telnet `hostname` 80" the response I get is
> "telnet: Unable to connect to remote host: Connection refused."

Given the ruleset you've posted, I don't see how a telnet to 8080 can work, 
since you have no INPUT rule allowing packets to that port...

Please flush the counters on your rules using "iptables -Z; iptables -Z -t 
nat", connect to port 8080, and then tell us the output of "iptables -L -nvx; 
iptables -L -t nat -nvx".

> -A PREROUTING -d 199.128.238.12 -p tcp -m tcp --dport 80 -j REDIRECT
> --to-ports 8080

> :INPUT ACCEPT [0:0]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [417:40204]
> :RH-Firewall-1-INPUT - [0:0]
>
> -A INPUT -j RH-Firewall-1-INPUT
> -A FORWARD -j RH-Firewall-1-INPUT
> -A RH-Firewall-1-INPUT -i lo -j ACCEPT
> -A RH-Firewall-1-INPUT -p icmp -m icmp any -j ACCEPT
> -A RH-Firewall-1-INPUT -p esp -j ACCEPT
> -A RH-Firewall-1-INPUT -p ah -j ACCEPT
> -A RH-Firewall-1-INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j
> ACCEPT
> -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j
> ACCEPT
> -A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited

Regards,

Antony.

-- 
Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.


