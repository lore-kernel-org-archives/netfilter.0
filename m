From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: iptables rules in comparable form
Date: Tue, 01 Jun 2010 15:27:58 +0200
Message-ID: <4C050ADE.60403@chello.at>
References: <20100601081053.GA13943@q.uh.cz> <alpine.LSU.2.01.1006011043190.3431@obet.zrqbmnf.qr> <4C04D07F.6040702@chello.at> <20100601112552.GA15745@q.uh.cz>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100601112552.GA15745@q.uh.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 01.06.2010 13:26, rk@dat.cz wrote:

> I should clarify some facts about my conditions.
> 
> Whole iptables ruleset is represented by few files in /etc. Some of them
> are generated, some of them are hand written. I am able to feed /etc
> rules to iptables-restore or execute them as shell script. This is
> trivial. Although iptables-restore is faster than executing iptables in
> shell script, it is still very slow sometimes. Changes in /etc ruleset
> are small but frequent. But primarily both solutions reset couters if
> used and it is not good for me now. So I ended with script that does
> incremental updates.

iptables[-save/restore] have a -c switch to save/restore counters.


> 
> My script takes iptables-save output as first argument and desired
> ruleset declared in /etc files as second argument (but generally any two
> inputs). In first step it converts both inputs to comparable form and
> builds ruleset in internal representation. Then comes iptables_diff
> method, that is able to generate two rules
> 
>     iptables -D SSH 10
>     iptables -I SSH 10 -j REJECT -s 2.3.2.3
> 

you could use -R here.
if many rules look like that, use ipset?

> if rule 10 in chain SSH differs in first and second ruleset. It mostly
> works but it needs constant maintenance because of changes in iptables
> itself so I am not satisfied. I believe that it works as I intended
> because this utility dramaticaly lower reload times of firewalls on our
> busy routers. As I said, changes are small. Restoring 10000 rules via
> iptables-restore is often more slow than my python processing and
> executing two iptables commands.

using the -n switch of iptables-restore you might be able to create
'smaller' changes.

Best regards

Mart
