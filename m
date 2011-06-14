From: John Haxby <john.haxby@oracle.com>
Subject: Re: API to find out wether a IP address is local?
Date: Tue, 14 Jun 2011 10:11:04 +0100
Message-ID: <4DF725A8.7040205@oracle.com>
References: <BANLkTi=fu+bMtOs_xWfaW0rwwDhk4TrSdA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=fu+bMtOs_xWfaW0rwwDhk4TrSdA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Clemens Eisserer <linuxhippy@gmail.com>
Cc: netfilter@vger.kernel.org

On 14/06/11 08:31, Clemens Eisserer wrote:
> I know this question is not really netfilter related, sorry. But I
> didn't know where to ask it instead.
>
> Does Linux have an API to find out wether an IP address is local?

netdevice(7) tells you how to extract all the IPv4 addresses from the
network devices; /proc/net/if_inet6 lists all the local IPv6 addresses.

This is not necessarily useful though: redirection happens in all kinds
of ways and all kinds of places and while getpeeraddr(2) might tell you
that you're connected to one of google.com's addresses, that could be
far from the truth.  (Of course, the inverse is true, just because you
thought you were connecting to a local address doesn't mean that some
wild and woolly iptables configuration didn't send your packets winging
half way around the globe.)

jch
