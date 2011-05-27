From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables-restore - does  it breaks existing connections?
Date: Sat, 28 May 2011 00:37:08 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105280036250.7651@frira.zrqbmnf.qr>
References: <1748026766.20110525102949@yandex.ru> <4DDFBDE8.8010808@arpa.org> <alpine.LNX.2.01.1105271758030.6326@frira.zrqbmnf.qr> <4DE02652.9020104@arpa.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DE02652.9020104@arpa.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Erik Schorr <erik-lists@arpa.org>
Cc: netfilter@vger.kernel.org, gapsf@yandex.ru

On Saturday 2011-05-28 00:31, Erik Schorr wrote:

> On 5/27/2011 8:58 AM, Jan Engelhardt wrote:
>> Though these dates,-m conntrack --ctstate ESTABLISHED,RELATED is used.
>
> Is there a practical, performance, or functional difference between using -m
> state and -m conntrack?

It has many more checks available; perhaps the second most handy (to me, 
at least) one after the usual EST/REL clause is --ctstate DNAT.
