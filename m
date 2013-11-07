From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: A question about routing cache (for load balancing).
Date: Thu, 7 Nov 2013 17:59:21 -0300
Message-ID: <CACuyg25xzoDS7wMyc8Ah=ZpoEvRoqbwgMMwA-vtetFFRU0Q9Wg@mail.gmail.com>
References: <5278501B.4040406@ngtech.co.il>
	<CACuyg26oOJY7puRHkH9ZZC5QM--H=EBvZuAGk34WxBTS2mNzpQ@mail.gmail.com>
	<527BC564.1000008@ngtech.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=F8zXcKi4tqIkAxgL6CN+5hnS16hKHogY3ffKciflNvE=;
        b=01UrKsxbL5V5c3TTMoShjYLnd/m/4+Uw/SfoEbLWBLTFiOZHCycBrZ7BxYti0HKPe6
         xE2KDdQNzpLdHGCa8i7lLo0sm4vyFkj87wrB6e0eZ/Hub/YKLM44R+mlRZHwSPm/ICKC
         S6+bja0txUFJrYCT+OW9Jx31JS1/x2wHnU5n2oFULABw6pcKBh/o3sRHoXbUp+8eByOk
         3OeBlToEn+qC6Ea2u6dvzN9O6KvOYzvWlePfQ0dkxIPtTlGzLdA2cpzATFzvZ5qWO9tN
         Ku9M/x1a/f9qRmpBzmVdrLw/tgbX/+JDzTmF8Zn2mc4ktz11fGo0utCslJoYDvmeRCBE
         ryOA==
In-Reply-To: <527BC564.1000008@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: netfilter@vger.kernel.org

2013/11/7 Eliezer Croitoru <eliezer@ngtech.co.il>:
> On 11/07/2013 12:26 PM, Humberto Juc=E1 wrote:
> By load balance I am talking about Route load balance.

Yes, i understand it too. I think! rs


> OK so every 60 secs remove the old entries?

Yes, but...

This also depends of gc_timeout value.
The route system will check/flush the route cache every 60 secs
(gc_interval) and "update" into lb algorithm (round robin, by
default), so:

ip route add default \
    nexthop via 10.1.1.1
    nexthop via 10.1.2.1

echo 1 > /proc/sys/net/ipv4/route/gc_interval

This is the same as (every 1s):
echo 1 > /proc/sys/net/ipv4/route/flush

ip route get 200
# This probe result in 10.1.1.1

# wait 1s and
ip route get 201
# This probe result in 10.1.2.1

# wait 1s and
ip route get 202
# This probe result 10.1.1.1

If you increase this value, all tests can result the same gateway in
gc_interval period.

Each learned path will be maintained by gc_timeout.
But this path will be *checked* only every gc_interval.

The result for 200 will be the same until gc_timeout.
This time expire after *300s of inactivity*.

ip route get 200
ip route get 200
ip route get 200

This probe will return the same path: only 10.1.1.1

But, if you change gc_timeout to 1
echo 1 > /proc/sys/net/ipv4/route/gc_timeout

ip route get 200 # wait 1 or 2s
ip route get 200 # wait 1 or 2s
ip route get 200 # wait 1 or 2s

The result will be balanced - i consider this a aggressive load balance=
=2E
This is not so complicated in TCP (because the protocol is
connection-oriented), but is very much in UDP.
I refer to the persistence of connection, not the application. You
will certainly have problems with https and email sessions.

So, a larger value for gc_timeout will allow you a greater connection
persistence.
