From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: help me with firewall+drop by default
Date: Fri, 5 Mar 2004 02:43:14 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403050243.14537.Antony@Soft-Solutions.co.uk>
References: <BAY7-F103tpgWtfb8tW0003bc47@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY7-F103tpgWtfb8tW0003bc47@hotmail.com>
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
To: netfilter@lists.netfilter.org

On Friday 05 March 2004 2:28 am, verito verito wrote:

> From: Antony Stone <Antony@Soft-Solutions.co.uk>
>
> >Where are you trying to access the POP3 server from and to?
> >
> >In other words, where is your client (compared to eth0 and eth1 in your
> >rules), and is the server running on the machine with these rules, or on
> >some other server being routed through this one?
>
> eth0=lan
> eth1=internet
> The server pop3 is external I must open the ports 110 and 25
> Since I use the outlook as client of mail in order that it could send and
> receive post office

In that case the ruleset you have posted below should work, because requests 
come from eth0, get routed to eth1, and you have a rule:

> iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT

Replies come back on eth1 and get routed to eth0:

> iptables -A FORWARD -i eth1 -o eth0 -m state --state ESTABLISHED,RELATED
> -j ACCEPT

And you are SNATting packets on their way out to the Internet:

> iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

So, why is this setup not working?

1. Is that your complete ruleset?
2. What does "iptables -L -nvx; iptables -L -t nat -nvx" show for the packet 
counters on each rule?
3. Is your mail client correctly resolving the hostname of the server in order 
to try connecting to it by POP3?

Do other protocols (except for HTTP/port 80, which you are redirecting) work?   
For example, ftp? ssh? traceroute? ping? telnet!? whois?

Hope this helps point you in the right direction.

Regards,

Antony.

-- 
I'm pink, therefore I'm Spam.

                                                     Please reply to the list;
                                                           please don't CC me.


