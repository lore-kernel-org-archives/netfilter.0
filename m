From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Best practice: Check --syn in PREROUTING with DNAT
Date: Thu, 28 Apr 2011 16:32:44 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104281631010.7072@obet.zrqbmnf.qr>
References: <9F69795E29C890408AC2DAF646C89BB3799D4F7DC3@MAILBOX.arc.local>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9F69795E29C890408AC2DAF646C89BB3799D4F7DC3@MAILBOX.arc.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fiedler Roman <Roman.Fiedler@ait.ac.at>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thursday 2011-04-28 16:18, Fiedler Roman wrote:

>Hello List,
>
>Is there a significant benefit when checking correct TCP flags in PREROUTING, e.g. with
>
>Iptables -t nat -A PREROUTING --destination a.b.c.d -p tcp -m tcp --dport 80 --syn -j DNAT --to-destination w.x.y.z

It would restrict "NEW" tcp connections to begin with SYN and would not 
consider translating connections that get picked up after a flush of 
the CT table, for example.

>Before accepting in INPUT rulebase:
>
>... -m state --state ESTABLISHED -j ACCEPT
>... --destination w.x.y.z -p tcp -m tcp --dport 80 --syn -j ACCEPT
>... drop/reject with logging

-m state should ideally be -m conntrack.
