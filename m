From: Radek Kanovsky <rk@dat.cz>
Subject: Re: iptables rules in comparable form
Date: Tue, 1 Jun 2010 13:25:52 +0200
Message-ID: <20100601112552.GA15745@q.uh.cz>
References: <20100601081053.GA13943@q.uh.cz> <alpine.LSU.2.01.1006011043190.3431@obet.zrqbmnf.qr> <4C04D07F.6040702@chello.at>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4C04D07F.6040702@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Tue, Jun 01, 2010 at 11:18:55AM +0200, Mart Frauenlob wrote:

> Besides there's also iptables-xml (not sure when it came up), which can
> give you a unified output. Reading man iptables-xml the way back is
> possible like:
> Conversion from XML to iptables-save format may be done using the
> iptables.xslt script and xsltproc, or a custom program using libxsltproc
> or similar;  in this fashion:
> 
>        xsltproc iptables.xslt my-iptables.xml | iptables-restore
> 
> >>
> >> I have prototype in python that does such normalization and is able
> >> to output "patch" for existing rules according to given new rules.
> >> Script generates -N/-X/-F/-P/-I/-D/-A rules via standard python difflib
> >> and is pretty effective and simle (90 lines) but requires rules in
> >> comparable form and this is the harder part of my problem (2662 lines).
> 
> I bet python has loads of xml libs.

I should clarify some facts about my conditions.

Whole iptables ruleset is represented by few files in /etc. Some of them
are generated, some of them are hand written. I am able to feed /etc
rules to iptables-restore or execute them as shell script. This is
trivial. Although iptables-restore is faster than executing iptables in
shell script, it is still very slow sometimes. Changes in /etc ruleset
are small but frequent. But primarily both solutions reset couters if
used and it is not good for me now. So I ended with script that does
incremental updates.

My script takes iptables-save output as first argument and desired
ruleset declared in /etc files as second argument (but generally any two
inputs). In first step it converts both inputs to comparable form and
builds ruleset in internal representation. Then comes iptables_diff
method, that is able to generate two rules

    iptables -D SSH 10
    iptables -I SSH 10 -j REJECT -s 2.3.2.3

if rule 10 in chain SSH differs in first and second ruleset. It mostly
works but it needs constant maintenance because of changes in iptables
itself so I am not satisfied. I believe that it works as I intended
because this utility dramaticaly lower reload times of firewalls on our
busy routers. As I said, changes are small. Restoring 10000 rules via
iptables-restore is often more slow than my python processing and
executing two iptables commands.

I know iptables-xml. It is mostly wrapper around iptables-save output.
It doesn't help much, because it doesnt convert '--dport ssh' 
to '--dport 22' during processing /etc/ files. First form I have
in /etc (readability of hand written files should be preserved),
second form I get from kernel via iptables-save. How can I compare them?
I hope that it is more clear now.


Thanks
Radek Kanovsky
