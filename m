From: Eric Bauman <baumane@livejournal.dk>
Subject: Re: Problem with rdate and iptables
Date: Mon, 26 Apr 2010 19:54:32 +1000
Message-ID: <4BD562D8.9080408@livejournal.dk>
References: <hqstu1$7hm$1@dough.gmane.org> <4BD42D81.1000501@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BD42D81.1000501@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 25/04/2010 21:54, Pascal Hambourg wrote:
> Is this on the server or client ? That rule does not care about the
> protocol, but a rule alone without the rest of the ruleset does not tell
> much.
>
>> Any ideas?
>
> Rather a suggestion. You could trace relevant traffic with a packet
> sniffer and/or iptables LOG rules and try to see what's going on.
> Disable all filtering and check if it works. Does the rdate server
> accept UDP queries ?

Hi there, thank-you for the reply.

This is an rdate client accessing a timeserver.

The only only other rules I have are default policies (DROP for INPUT 
and FORWARD, and ACCEPT for OUTPUT), ACCEPT for all loopback traffic, 
and ACCEPT for various incoming ports (eg. HTTP etc.).

It works fine with all rules removed, and it works fine over TCP with 
all rules enabled.

Cheers,
Eric

