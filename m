From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: How to protect apache benchmarking attack ?
Date: Tue, 12 Jan 2010 10:28:48 +0100
Message-ID: <20100112102848.4b427416@catlap>
References: <4B4C3F37.9010703@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B4C3F37.9010703@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: netfilter@vger.kernel.org

>Hello all,

Hello J.,

>I am dared to see what "ab" (apache benchmarking too) can do  against
>an apache server.  I have used the following against my server to check
>call handling

You can use hashlimit [1] match of iptables to limit concurrent
connections from single IP.

[1] http://linux.die.net/man/8/iptables -> lookup hashlimit; note:
current versions of hashlimit can also use srcip as --hashlimit-mode;
that's probably what you want

Cheers,
Marek Kierdelewicz
