From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how to redirect certain IPs to specific url
Date: Wed, 30 Jun 2004 10:34:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406301034.44072.Antony@Soft-Solutions.co.uk>
References: <a0f69e504063000446f514e22@mail.gmail.com> <200406300931.16812.Antony@Soft-Solutions.co.uk> <a0f69e5040630021311b0555d@mail.gmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <a0f69e5040630021311b0555d@mail.gmail.com>
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

On Wednesday 30 June 2004 10:13 am, Askar Ali Khan wrote:

> > iptables -A PREROUTING -t nat -p tcp --dport 80 -s a.b.c.d -j DNAT --to
> > w.x.y.z
>
> may i have to replace w.x.y.z with the IP of domain or simply
> www.abc.com will work?

You can use www.abc.com, but you must remember that www.abc.com will be 
resolved to an IP address *at the time you enter the rule*, and the rule will 
then exist on your firewall with that IP address while the firewall is 
running.

Therefore if www.abc.com always resolves to one IP address, it makes no 
difference whether you enter the rule by IP or name.

If www.abc.com resolves to one IP address, but that address changes, your 
firewall wil continue to use the old IP address until you change it.

If www.abc.com resolves to more than one IP address, only one will get entered 
into the rule if you specify the name (and you would need to use multiple 
rules if you specify by IP), and therefore only some of the packets sent to 
ww.abc.com would match the rule.

> > If this is not what you want, and you do indeed need to do stuff at OSI
> > layer 7, working on HTTP rather than TCP and IP, you should probably look
> > into http://www.squid-cache.org
>
> we have firewall it redirect traffic to cache server running "squid"
>
> :) may i put this rule on firewall machine or the cache server ?

If you want to use netfilter rules, put them on the firewall.   If you want to 
do URL redirection and perhaps regular expression matching, or you want to 
make sure that www.abc.com always works in a rule, then use Squid (because 
that will do a DNS lookup of www.abc.com every time it sees it in a URL).

Regards,

Antony.

-- 
There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

                                                     Please reply to the list;
                                                           please don't CC me.


