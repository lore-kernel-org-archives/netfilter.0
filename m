From: Karina <kgs@acabtu.com.mx>
Subject: Re: Overriding REDIRECT for certain hosts (SQUID)
Date: Sat, 23 Nov 2002 12:03:43 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DDFC2FF.FE11B55E@acabtu.com.mx>
References: <20021123052657.30417.33449.Mailman@kashyyyk> <1038066385.4859.12.camel@rbhome>
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
To: Ryan Beisner <ryanb@thedataarc.com>
Cc: netfilter@lists.netfilter.org

I had the same problem , and i followed the suggestion from Antony stone
that wrote:

3. Use your existing DNAT rule in the PREROUTING nat chain, but insert some
rules before it which match a destination address using "-d a.b.c.d" and use

the target "-j ACCEPT" so that these packets bypass the DNAT rule.

I did more or less the same...

i use this

IPTABLES -t nat -A PREROUTING -i "myinterface" -p tcp -d ! xxx.xxx.xxx.xxx
--dport 80 -j REDIRECT --to-port 3128 -v

and now the request to the OWA is not passing to squid anymore.

You need to have the IP address of the site using Outlook WebAccess. I don't
know what it's exactly the problem with this service, and in the Microsoft
Web page there's nothing... just a note about troubleshouting the OWA with
the Microsoft Proxy, that basically has the same problems than with squid.

I hope this helps,

karina.


Ryan Beisner wrote:

> I don't know if anyone else has noticed, but SQUID doesn't treat some
> websites very kindly in its http acceleration (transparent proxy).
> Mainly, Microsoft Outlook Webmail (I have a client using it).
>
> [ BTW this is a strange breed of a web based mail system .. it looks
> like you're using Outlook, within a webpage, released by MS.  Their
> firewall info claims that HTTP is the only protocol in use. ]
>
> I have already configured Squid not to cache that entire domain, and it
> doesn't cache it.  I've flushed the cache, then looked at the "All Cache
> Objects" SQUID report, to find none at domain XYZZZ.COM.
>
> OK, so how would one turn this rule around into a couple of rules that
> redirect port 80 to 3128, *unless* it's to/from "any-host.xyzzz.com" or
> "any-host.anotherdomain.com"  etc ?
>
> .......................}SNIP{...........................
> $ipt -t nat -A PREROUTING -i $eth0 -p tcp --dport 80 -j REDIRECT
> --to-port 3128
> .......................}SNIP{...........................
>
> I realize I could create a rule based on their IP range, but I want the
> rule to be based on the domain name -- I haven't yet seen that in
> action.  ;}
>
> All help is appreciated!
>
> TIA
>
> -Ryan Beisner


