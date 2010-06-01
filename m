From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables rules in comparable form
Date: Tue, 1 Jun 2010 10:50:06 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006011043190.3431@obet.zrqbmnf.qr>
References: <20100601081053.GA13943@q.uh.cz>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100601081053.GA13943@q.uh.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Radek Kanovsky <rk@dat.cz>
Cc: netfilter@vger.kernel.org

On Tuesday 2010-06-01 10:10, Radek Kanovsky wrote:

>Hello,
>
>is there some way to get iptables rules in some normalized form?
>What I mean is normalized or canonical form that is convenient
>for rule comparison.

Load em up, then use iptables-save and/or iptables -S.

>When I want update rules on firewall or router with thousands of rules
>I want to do it incrementaly. Reloading whole iptables on small change
>every ten minutes is not acceptable because it takes very long time

That's because you are not using iptables-restore to do an O(n) reload. 

Calling iptables again and again is going to replace tables over and 
over.

>and resets counters defined for accounting purposes. But incremental
>solution requires some comparable rule form so machine can decide
>which rule already exists, which is new and which should be deleted.
>
>I have prototype in python that does such normalization and is able
>to output "patch" for existing rules according to given new rules.
>Script generates -N/-X/-F/-P/-I/-D/-A rules via standard python difflib
>and is pretty effective and simle (90 lines) but requires rules in
>comparable form and this is the harder part of my problem (2662 lines).
>
>I am not sure if I go right way because this concept is a bit fragile.
>Iptables can have plugins not known to this script, every host can
>have different /etc/services, /etc/protocols used by ipatables, there
>are bugs in iptables stdout, etc. How would you solve this?

I'd analyze why I would even need 1000 rules, and if so, why they should 
change behind my back.
