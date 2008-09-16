From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: netfilter/dansguardian/polipo slow
Date: Tue, 16 Sep 2008 13:27:55 -0500
Message-ID: <48CFFAAB.2000004@riverviewtech.net>
References: <656617.35927.qm@web52002.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <656617.35927.qm@web52002.mail.re2.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/14/08 09:49, Doug Kehn wrote:
> I have an AMCC PPC-440 based board running Monta Vista Linux 2.6.18, 
> dansguardian 2.9.8.5, and polipo 1.0.4.  dansguardian is used for URL 
> and content filtering.  polipo is serving as the http proxy.  The 
> iptables rule to redirect port 80 packets to dansguardian is:

I take it that DansGuardian is talking to Polipo and clients are talking 
(via redirect) to DansGuardian?

> All components are functioning properly.  However, web page load 
> times are 3 to 4 times slower with this rule in place than without. 
> I suspected the delay was with dansguardian/polipo.  Then, I left the 
> rule in place and configured the browser's http proxy settings for 
> 192.168.2.1/3129.  Page load times decreased dramatically.  Packets 
> were still traversing dansguardian/polipo as URL/content filtering 
> rules still worked as expected.  I also changed the PREROUTING policy 
> from ACCEPT to DROP.  After doing this, I could no longer browse the 
> internet (or communicate with the board).  I'm pretty sure the 
> PREROUTING chain is being traversed; the rule is just not matching.
 >
> It appears (???) the delay is only observed when the rule matches.  I 
> tried different variants of the rule to see if writing the rule in 
> different ways produced different results.  For example,
>
> All rule variations resulted in the same increased page load times.

This is as I would expect.  If you write the rules differently and 
compare the output of iptables-save you will see the rules are 
translated to the same thing in kernel.

> Unfortunately, updating the kernel and/or configuring the browser's 
> http proxy settings aren't allowable options. 8(  Does anyone have 
> any information, comments suggestions, tips, or tricks?

Try using a different caching proxy behind DansGuardian to cache the 
filtered content rather than having DansGuardian filter all content each 
and every time someone requests it.

If memory recalls, DansGuardian has to talk to an upstream proxy so, you 
will most likely end up with a proxy on both sides of DansGuardian, with 
at least the one behind it being a caching proxy.



Grant. . . .
