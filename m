From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: conntrack module question?
Date: Fri, 5 Nov 2010 12:12:21 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1011051207400.31877@obet.zrqbmnf.qr>
References: <4CD3CCAE.3060707@metu.edu.tr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CD3CCAE.3060707@metu.edu.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Husnu Demir <hdemir@metu.edu.tr>
Cc: Netfilter Developer Mailing List <netfilter@vger.kernel.org>


On Friday 2010-11-05 10:21, Husnu Demir wrote:
>Hi,
>
>I am using conntrack module for a while. As suggested configuration I do add ;
>
>
>-A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
>-A FORWARD -m conntrack --ctstate INVALID -j DROP
>
>At the top of the configuration. After that I added the drop rule as;
>
>-A FORWARD -i eth0 -o eth1 -m set --match-set STOPALL src -j DROP
>
>I added an IP address,
>174.142.179.235 a SPAMMER, to stop its communication. But it did no stop.

How are you determining this?

>I wrote "drop everything from STOPALL list", but the connection is not dropped.

It drops packets, not connections.

>If
>I wrote the the DROP statement above the 1st rule, it will drop all the
>connection. What is wrong?

Perhaps nothing. You clearly accept established connections first,
so only new ones will be ignored. It does not change existing ones.

>I do not want to write DROP statement to the top?

Do you?
