From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Limits higher than 10000/sec
Date: Wed, 9 Jan 2013 21:06:02 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1301092026340.10793@nerf07.vanv.qr>
References: <CAFANWtU9aeFjgUvczjnCETxy4h01aFs6JnDcK_ikxz-ijJ=Adg@mail.gmail.com> <alpine.LNX.2.01.1212092341330.15774@nerf07.vanv.qr> <CAFANWtUCkZWEAeqkLDbdZdWs6dhxzTPzkr4j0rG05fVsS6616A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFANWtUCkZWEAeqkLDbdZdWs6dhxzTPzkr4j0rG05fVsS6616A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Darius Jahandarie <djahandarie@gmail.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2013-01-08 03:13, Darius Jahandarie wrote:

>On Sun, Dec 9, 2012 at 5:41 PM, Jan Engelhardt <jengelh@inai.de> wrote:
>> On Sunday 2012-12-09 21:05, Darius Jahandarie wrote:
>>
>>>Hi all. I currently have an iptables rule like follows in the raw table:
>>>
>>>-A PREROUTING -p tcp --dport 1234 --syn -m limit --limit 10000/sec
>>>--limit-burst 10000 -j ACCEPT
>>>-A PREROUTING -p tcp --syn -j DROP
>>>
>>>Does anyone have thoughts on a way to get some sort of rate-limiting
>>>(TBF or otherwise) that can handle more PPS than the limit module
>>>while still being as efficient as possible?
>>
>>  -j RATEEST, -m rateest
>
>Thanks for the tip Jan -- but I've failed in my attempts to use this
>target/module combo. I'm not entirely sure what my rules should be to
>do something similar to the limit rule I posted.

-m $all_that_which_is_to_be_counted \
	-j RATEEST --rateest-name foo
	--rateest-name bac --rateest-interval 1ms \
	--rateest-ewmalog 2ms

-m $all_that -m rateest --rateest-name foo \
	--rateest1 foo --rateest-gt --rateest-pps1 1000


This at least passes the syntax checks and should match 1000 hits per 
second - in some fashion. Trying to figure out what values to pick for 
--rateest-interval and --rateest-ewmalog without running into "invalid 
values" is the actual trick, because none of it is documented.
