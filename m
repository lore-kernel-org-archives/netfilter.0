From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Strange behavior
Date: Mon, 14 Jun 2004 11:07:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406141107.44703.Antony@Soft-Solutions.co.uk>
References: <200406140954.i5E9sbbJ002976@ylpvm15.prodigy.net>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406140954.i5E9sbbJ002976@ylpvm15.prodigy.net>
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

On Monday 14 June 2004 10:54 am, Spiro Azkoul wrote:

> OK I've been toying with this all weekend, its 3 A.M and it is still funky,
> thank God some of you are awake.

11am Monday here :)

> Her is the deal, I have over 200 rules in the INPUT chain, which I entered
> using: iptables -I INPUT -s ........ -j DROP.

So, all your DROP rules are at the start of the table (in reverse order of 
entering them, but that's probably immaterial).

> I never used the -I [rulenumber] option. So after entering all the rules, I
> entered iptables -A INPUT  for http, smtp, pop, and other services.

I assume these rules had the ACCEPT target?

-A means these will be appended to the end of all your DROP rules, so anything 
not DROPped stands a chance of being ACCEPTed.

> Now, when I turned it on, nothing was going through.
> I tried to iptables -I 100 INPUT -s 0/0 -p tcp ---dport 80 -j ACCEPT and it
> did not work

Without knowing your ruleset this means little, because 100 could be anywhere, 
and the order of rules is important (especially when mixing DROP and ACCEPT 
rules).

> I tried it but with [1] and it worked.

Do you mean you did "-I 1" instead of "-I 100"?

If so, then that means that (at least) one of your DROP rules is matching the 
packets you want to ACCEPT on port 80.

> I am perplexed!!!
> Any feedback please?

I suggest you use "iptables -L INPUT -nvx" and look for the rules with the 
non-zero packet & byte counts.   That will tell you which rules are matching 
the packets which are arriving, and you should be able to identify which one 
is blocking the packets you want to accept.

By the way, why so many DROP rules at the start of your ruleset?   Most people 
are happy with more like 20 ACCEPT rules and a default DROP policy...

Regards,

Antony.

-- 
I own three Windows books, published by O'Reilly.   They are "Windows 
Annoyances", "Office 97 Annoyances" and "Windows 98 Annoyances".   That 
pretty much sums it up for me.

                                                     Please reply to the list;
                                                           please don't CC me.


