From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: introspection capabilities?
Date: Thu, 26 May 2011 19:33:45 +0200
Message-ID: <4DDE8EF9.8090208@netfilter.org>
References: <3210442595.20110524152136@yandex.ru> <alpine.LNX.2.01.1105241030410.13058@frira.zrqbmnf.qr> <1510322597.20110524161458@yandex.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1510322597.20110524161458@yandex.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: gapsf@yandex.ru
Cc: netfilter@vger.kernel.org, Jan Engelhardt <jengelh@medozas.de>

On 24/05/11 11:14, gapsf@yandex.ru wrote:
>>> There is no doubt that for nftables frontends will be written too, so the question is:
>>> "Will nfatbles be able to find out various information
>>> about their own current state: tables, chains, rules, etc?"
> 
> JE> You can already obtain this information by using libiptc, iterating over 
> JE> all rules and testing for a particular src/dst address (very much like 
> JE> poor man's `grep -s 1.2.3.4\b` on the text output).
> According to Wikipedia "libiptc ... shouldn't be used as a public API,
> and is known to change, which breaks programs that use it"
> and libiptc is a 3d party project - not netfilter.org's and outdated, isn't it?
> 
> As for nftables: means native capabilities of it's kernelspace code (aka virtual machine).

just to clarify, that's not a virtual machine but a pseudo-state machine
in the BPF fashion, OK?
