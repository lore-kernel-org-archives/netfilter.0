From: "John Black" <black@arbbs.net>
Subject: Re: (No subject header)
Date: Thu, 29 Jul 2004 22:09:08 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007801c475e2$9532a740$f82ffea9@black>
References: <4107cdbf.195.321c.246791223@arbbs.net> <200407282252.25325.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org


> Okay, so you have one public IP address, and all your internal machines
are
> masqueraded behind that one address for outbound connections; also your
> firewall runs DNS (although it's not clear whether you mean it runs
caching
> DNS for internal clients, or also authoritative DNS for external queries
> about your domain).

i have a caching dns sserver for the inside of the lan, but external queries
are
handled by the companies dns server

> What is "the first rule"?
iptables -t nat -A PREROUTING -d X.X.X.X -p tcp --dport 22 -j DNAT \
-- to 192.168.1.89:2222 (ares)

iptables -t nat -A PREROUTING -d X.X.X.X -p tcp --dport 22 -j DNAT \
-- to 192.168.1.90:22222 (zeus)

i asigned that workstation to listen to that port.

when i ssh into zeus from the outside world it says connecting to zeus, but
at the bash prompt it is ares

im running BIND 9 on red hat 9

thanks
john


