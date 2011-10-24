From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: match a few ecn-ip-ect in one rule
Date: Mon, 24 Oct 2011 16:48:56 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1110241647580.15085@frira.zrqbmnf.qr>
References: <CAH3pVZOW=dQ+BrHJOsvQY5DXL-BhnV0uWiTG44JXKdQ_EeXwXA@mail.gmail.com> <alpine.LNX.2.01.1110241344010.21849@frira.zrqbmnf.qr> <CAH3pVZPTgqtPeHRvjQdaq+2Ekm-ZKBaX1TCz7fVX+uAEHoFXAA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAH3pVZPTgqtPeHRvjQdaq+2Ekm-ZKBaX1TCz7fVX+uAEHoFXAA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergey Naumov <sknaumov@gmail.com>
Cc: netfilter@vger.kernel.org

On Monday 2011-10-24 13:59, Sergey Naumov wrote:

>> Since rules are generally combined in ORed, it only makes sense for
>> matches to be ANDed (and submatch parts to be ORed at times).
>
>Yes, I understand, but because of logic of project that I develop it
>is better to use 1 rule than to search places where I have to add
>workarounds to generate 2 iptables rules from 1 user specified rule.
>When I use multiple -m molude inclusions, are specified parameters
>combined as OR, as AND or overrided?

Like I said, AND. Otherwise, packets would be able to match -m statistic 
--mode random --probability 0 [-m something else].
