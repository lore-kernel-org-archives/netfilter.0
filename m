From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Check whether any netfilter rules are set on a host
Date: Tue, 29 Nov 2016 20:00:30 +0100
Message-ID: <e8d84960-0ee1-7659-54bb-218a8ce45bd8@plouf.fr.eu.org>
References: <CAGXs5wU=MBMtTPQ-Ori5RgazkJ=33h5SLaMQMoCTpCZR+Hq6ow@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAGXs5wU=MBMtTPQ-Ori5RgazkJ=33h5SLaMQMoCTpCZR+Hq6ow@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Kevin Wilson <wkevils@gmail.com>
Cc: netfilter@vger.kernel.org

Le 29/11/2016 à 12:33, Kevin Wilson a écrit :
> Hi,
> Is there a way to find out if there any iptables rules set on a machine ?
>
> There are some indirect ways which will not always work; for example,
> I know that on most hosts,
> iptables -S
> will return the following output (when no iptable rules are set)
> -P INPUT ACCEPT
> -P FORWARD ACCEPT
> -P OUTPUT ACCEPT

Consider using iptables-save instead of iptables -S.

iptables -S has two drawbacks :
- it shows only one table at a time (the default table is filter)
- if the table was not loaded, it loads it. This is useless.

iptables-save does not have these drawbacks : when no table is 
specified, it shows all loaded tables and does not load any table.

In either output, rules start with "-A " so you can use grep to check 
whether there are occurences of this pattern.

iptables-save | grep -q "^-A " && echo "rule(s)" || echo "no rule"
