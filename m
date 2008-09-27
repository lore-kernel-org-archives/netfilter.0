From: Benny Amorsen <benny+usenet@amorsen.dk>
Subject: Re: ULOG/NFLOG on a non-forwarding machine
Date: Sat, 27 Sep 2008 15:42:10 +0200
Message-ID: <m3iqsh66z1.fsf@ursa.amorsen.dk>
References: <m38wtjur74.fsf@ursa.amorsen.dk> <48DC3036.1010103@snapgear.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48DC3036.1010103@snapgear.com> (Philip Craig's message of "Fri\, 26 Sep 2008 10\:43\:34 +1000")
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philip Craig <philipc@snapgear.com>
Cc: netfilter@vger.kernel.org

Philip Craig <philipc@snapgear.com> writes:

> Benny Amorsen wrote:
>> Is there a way to catch incoming traffic which is neither INPUT nor
>> FORWARD with netfilter?
>
> Have you tried PREROUTING?

Yes, I have tried PREROUTING and I've tried the nat and mangle tables.
No luck.


/Benny

