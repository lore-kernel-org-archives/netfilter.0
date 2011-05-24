From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: nftables: introspection capabilities?
Date: Tue, 24 May 2011 10:33:46 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105241030410.13058@frira.zrqbmnf.qr>
References: <3210442595.20110524152136@yandex.ru>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3210442595.20110524152136@yandex.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gapsf@yandex.ru
Cc: netfilter@vger.kernel.org

On Tuesday 2011-05-24 10:21, gapsf@yandex.ru wrote:

>Hi!
>There is a lot of frontends for iptables like shorewall, ufw, ferm and special firewall distros.
>They all are trying to formalize, simplify, integrate the
>configuration of Linux firewall and traffic control subsystems.
>They also use a certain set of metadata for their own use.
>
>One of the iptables disadvantages - the inability to effectively
>find out the internal state of the iptables.
>There is only one way - parse the "iptables -L" output, isn't it?

iptables -S, iptables-save  is preferred at all times.

>There is no doubt that for nftables frontends will be written too, so the question is:
>"Will nfatbles be able to find out various information
>about their own current state: tables, chains, rules, etc?"

You can already obtain this information by using libiptc, iterating over 
all rules and testing for a particular src/dst address (very much like 
poor man's `grep -s 1.2.3.4\b` on the text output).
