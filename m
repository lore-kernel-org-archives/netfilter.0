From: "Spiro Azkoul" <spiro@snacorp.net>
Subject: RE: Strange behavior
Date: Mon, 14 Jun 2004 03:27:06 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406141026.i5EAQdnI009348@ylpvm01.prodigy.net>
References: <200406141107.44703.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406141107.44703.Antony@Soft-Solutions.co.uk>
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

Thanks for responding

I did an iptables -L -nvx and placed the html file on
http://www.totherescue.org/iptables.html

As for some answers:

>So, all your DROP rules are at the start of the table (in reverse order of 
>entering them, but that's probably immaterial).

From what I read, I figured by using -I you would be pushing the DROP rules
up. This was done to filter a many spammer IPs out of my mail server. I
figured if I add the ACCEPT rules (per protocol) at the end, all the
unwanted would be filtered out. 


>I assume these rules had the ACCEPT target?

Yes correct. That was the plan. To ACCEPT based on protocol at the end of
the rules.

>Without knowing your ruleset this means little, because 100 could be
>anywhere, 
>and the order of rules is important (especially when mixing DROP and ACCEPT

>rules).

If you take a look at the link above, you will see that the only difference
between the ACCEPT rule at the beginning and the one at # 100 is the order.
That is what is strange. 


>Do you mean you did "-I 1" instead of "-I 100"?

Yes, but I left both in the first, and 100th 

>If so, then that means that (at least) one of your DROP rules is matching
>the 
>packets you want to ACCEPT on port 80.

Only the one in the # 1 slot...but why?

>I suggest you use "iptables -L INPUT -nvx" and look for the rules with the 
>non-zero packet & byte counts.   That will tell you which rules are
>matching 
>the packets which are arriving, and you should be able to identify which
>one 
>is blocking the packets you want to accept.

I understand that one rule is blocking it, but why the first and not the
100th? The request is not coming on any of the IPS in the file

>By the way, why so many DROP rules at the start of your ruleset?   Most 
>people 
>are happy with more like 20 ACCEPT rules and a default DROP policy...

The logic is to filter out as many spammers as possible before you get to
the ACCEPT rule for smtp


Regards,
Thanks



