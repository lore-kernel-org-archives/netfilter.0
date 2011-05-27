From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables-restore - does  it breaks existing connections?
Date: Fri, 27 May 2011 17:58:48 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105271758030.6326@frira.zrqbmnf.qr>
References: <1748026766.20110525102949@yandex.ru> <4DDFBDE8.8010808@arpa.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DDFBDE8.8010808@arpa.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Erik Schorr <erik-lists@arpa.org>
Cc: netfilter@vger.kernel.org, gapsf@yandex.ru

On Friday 2011-05-27 17:06, Erik Schorr wrote:

> On 05/24/2011 08:29 PM, gapsf@yandex.ru wrote:
>> For example, when (re)loading the same set of rules?
>
> When using iptables-restore or a similar method, the new table is loaded
> atomically.  As long as the new ruleset permits the traffic, there should be no
> dropped connections (or connection states).  The kernel keeps connection state
> information independently of firewall rules.
>
> The best way to explicitly guarantee that all your connections stay up if you
> plan on loading a different ruleset, is to make sure there's a rule near the
> top of each of your INPUT/OUTPUT/FORWARD chains that accepts
> established/related connections:
>
> iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -I OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -I FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>

Though these dates,-m conntrack --ctstate ESTABLISHED,RELATED is used.
