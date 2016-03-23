From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: Packets (sometimes) not marked as RELATED/ESTABLISHED
Date: Wed, 23 Mar 2016 14:53:37 -0500
Message-ID: <ncus81$i6b$1@ger.gmane.org>
References: <20160322185530.GA3152@anthem.async.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20160322185530.GA3152@anthem.async.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 03/22/2016 01:55 PM, Christian Robottom Reis wrote:
> Hello there,
>
>      In periodically looking at my firewall logs I've always noticed that
> from time to time a certain pattern will show up in my logs which
> indicates that a legitimate stream which should have been marked
> RELATED/ESTABLISHED isn't. I have the following rules set up to allow
> related incoming traffic:
>
>      -A INPUT -i eth3 -p tcp -m tcp --dport 10000:65535
>          -m state --state RELATED,ESTABLISHED -j ACCEPT
>      -A INPUT -i eth3 -p tcp -m tcp --sport 10000:65535
>          -m state --state RELATED,ESTABLISHED -j ACCEPT
>
> AIUI this is what allows the response from a website request to be
> targeted ACCEPT in the INPUT chain. However, my logs show that sometimes
> this doesn't work. Here's a recent example:
>
>      [89003.161127] IN=eth3 OUT= MAC=XXX SRC=104.73.89.127 DST=XXX
>      LEN=1472 TOS=0x00 PREC=0x00 TTL=53 ID=10958 DF PROTO=TCP SPT=80
>      DPT=44709 WINDOW=3775 RES=0x00 ACK URGP=0
>
>      [89003.497964] IN=eth3 OUT= MAC=XXX SRC=104.73.89.127 DST=XXX
>      LEN=1472 TOS=0x00 PREC=0x00 TTL=53 ID=17058 DF PROTO=TCP SPT=80
>      DPT=44710 WINDOW=3385 RES=0x00 ACK URGP=0
>
>      [89049.561143] IN=eth3 OUT= MAC=XXX SRC=104.73.89.127 DST=XXX
>      LEN=1472 TOS=0x00 PREC=0x00 TTL=53 ID=26347 DF PROTO=TCP SPT=80
>      DPT=44932 WINDOW=1062 RES=0x00 ACK URGP=0

I see those too. When I look back at the packet captures for those times
I never see any other traffic to or from that IP address, so of course
they don't match the RELATED/ESTABLISHED rule.  Just part of the noise.

I routinely capture packets passing through my router, filtering out
ARP noise, Netflix video streaming, Skype calls, and the like.  When
something unusual happens, it's very useful to see what was going on
at that time. I keep the most recent ~1 Gigabyte of that in a rotating
buffer.  In a case like this, I can see what was _not_ going on.

-- 
Bob Nichols     "NOSPAM" is really part of my email address.
                 Do NOT delete it.

