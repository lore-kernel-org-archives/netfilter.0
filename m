From: shawn wilson <ag4ve.us@gmail.com>
Subject: Re: Hardware benchmark list (was: Recommended hardware for iptables
 based firewall/router)
Date: Sun, 9 Nov 2014 17:20:20 -0500
Message-ID: <CAH_OBic-hFvnyQ1AJhatYzrbvxGvCFMRukt1tL1CbYMUvbL1mw@mail.gmail.com>
References: <CAH_OBic9zg25y16HKhkHqBCvujrHXoGhb8E4tY+Z99CO0WrEAw@mail.gmail.com>
 <44240553.NhkgktUa2l@nb003>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=LW+gB8vN+l7Y7P5D3Pcorn+S3nvWQ/TFN0Q8RFR3TNM=;
        b=uCUfMAdrXjfe6vB4edljwbJgMgNe//N1Apv7XU6qduN422lQ9yxsnofIobQw0ckmup
         B8nDI+Z25NPNjKdWBqys7ra6QpFcyKs5/fqjwXvp9nh+29ElQytYgYW6W7rC4WIaMiT5
         wQnkNctA2jrEyrNypoTQAM7Qby9z4yP1Q8uH2J8BvgFPJ0bBd41Y1DuUmNZnAVwQWh+P
         Na10YqXz2xvHZR4NSQlJN5rIx7Yvp7Qot0+SNCbL4O6fgPORqhvYFzyHKfYMyfscHKxh
         3CaUydG2QGiYkjUk6+QMNAiMvbycniqqIiZ/xweTitnMYmB5Cln5Vqj4KoaENM6KWBKh
         dHfg==
In-Reply-To: <44240553.NhkgktUa2l@nb003>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ms@sys4.de
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sun, Nov 9, 2014 at 4:08 PM, Michael Schwartzkopff <ms@sys4.de> wrote:
> Am Sonntag, 9. November 2014, 15:39:35 schrieb shawn wilson:
>> (I include the original email subjec to show what spawned this)
>>
>> What would be cool is to have a hardware benchmark list for network
>> cards and processors (similar to JTR's list for hashes per second
>> [1]).
>>
>> What I've been thinking for a while is how to benchmark network
>> hardware. Obviously there's issues with doing this and in order for
>> this to work everyone would need to be on the same page (or there'd
>> need to be a link showing settings used that someone could revise if
>> they found something that was off).
>>
>> I think the biggest issue with this idea is figuring out affordable
>> hardware to test cards with. I'm unsure if this is possible so just
>> figured I'd throw this out there. Though since most machines have two
>> stacked interfaces, a decent benchmark might just be to plug one
>> interface into the other as that should shoe hardware noise issues,
>> PCI bus limitations (on that board), and driver issue.
>>
>> 1. http://openwall.info/wiki/john/benchmarks
>
> Cool idea. Anyway some work to do:
>
> 1) You (we) would have to define some standard tests (paket size, size
> distribution, ...), some defined testbed, ...
>

Yes, though this wouldn't need to be static - it could be changed in
sysctl on the fly (I think - without taking down an
interface/reloading the driver?)

> 4) Add tests for IPsec encryption. I did some tests for VIA Eden processor:
>

Hadn't even thought about IPsec - though I'm sure there are other
things that can be offloaded into hardware or kernel space drivers
that we'd want to test. (Nice short posts you have too - thanks)


I am however mainly concerned with the hardware aspect of doing this -
if plugging one stacked if into another works most of the time, the
rest should just be simple scripting/util choices (and a home for the
stats).
