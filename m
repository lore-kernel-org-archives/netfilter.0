From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re[2]: nftables: introspection capabilities?
Date: Tue, 24 May 2011 11:25:44 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105241122350.15135@frira.zrqbmnf.qr>
References: <3210442595.20110524152136@yandex.ru> <alpine.LNX.2.01.1105241030410.13058@frira.zrqbmnf.qr> <1510322597.20110524161458@yandex.ru>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1510322597.20110524161458@yandex.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gapsf@yandex.ru
Cc: netfilter@vger.kernel.org

On Tuesday 2011-05-24 11:14, gapsf@yandex.ru wrote:

>>>There is no doubt that for nftables frontends will be written too, so the question is:
>>>"Will nfatbles be able to find out various information
>>>about their own current state: tables, chains, rules, etc?"
>
>JE> You can already obtain this information by using libiptc, iterating over 
>JE> all rules and testing for a particular src/dst address (very much like 
>JE> poor man's `grep -s 1.2.3.4\b` on the text output).
>
>According to Wikipedia "libiptc ... shouldn't be used as a public API,
>and is known to change, which breaks programs that use it"

The API ain't beautiful, it is undocumented, and using a standard option 
parser on the text output is much more telling than dealing with the 
binary pieces.
Change is a natural occurrence, Wikipedia overexaggerates on the 
problems.

>and libiptc is a 3d party project - not netfilter.org's and outdated, isn't it?

Certainly not.
