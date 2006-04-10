From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: IP masquerade + squid problem
Date: Mon, 10 Apr 2006 20:43:35 +0200
Message-ID: <000c01c65cce$ad299640$0101000a@sterenborg.info>
References: <51851.192.168.2.7.1144653554.squirrel@mail2.medcol.mw>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <51851.192.168.2.7.1144653554.squirrel@mail2.medcol.mw>
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

> Dear list,
> 
> I have a problem with my squid + ip masquerading setup. My box has two
> interfaces one internal one external. I masquerade all internal
traffic
> on this box which also runs squid proxy.
> 
> When my iptables runs, and I point my client to the proxy on this box
> I do not seem to get anywhere even though the squid box accepts and
> logs a request.

So your INPUT rules seem to be fine for your LAN.

> When I go direct I can get the page.
>
> My gut feeling is that the squid box does get the request,
> processses but due to some nating problem fails to identify the client
> which made the request. Could anyone help to arrest the rot?

Well, you could start by adding iptables LOG rules to see what happens.
- Does squid actually try to perform the request (try a tcpdump or
something) ?
- Is the request getting through your (OUTPUT) rules (hence the logging)
?
- Is the reply being allowed ?
- What have you looked at / what have you tried ?
- Maybe some rules we need to look at ?

If you don't have any logging yet, add a rule to the bottom of your
OUTPUT ruleset saying something like :
$ipt -A OUTPUT -m limit --limit 1/sec -j LOG --log-prefix "_ipt_OUTPUT:
"
and see if it's logging http requests from squid. If it is and your
OUTPUT policy is DROP, the requests are most likely not getting out of
your box.
But since you didn't tell much about your setup and what you tried,
that's only a wild guess.


Gr,
Rob


