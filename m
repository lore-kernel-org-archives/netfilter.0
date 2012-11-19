From: =?UTF-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>
Subject: Re: xt_hashlimit: max count of 8192 reached
Date: Sun, 18 Nov 2012 21:41:10 -0800
Message-ID: <CAJygYd3+gQxhDgAmjXV80q6667O+8oTuEdcpUZXcnOV+gO++Pg@mail.gmail.com>
References: <50A910B6.4000607@evcz.tk> <CAJygYd3kr9a-LVXAhPyrDyXuPCGo2GZeOj156yLV=Tfen_+09w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=g3WTq3zg/Dg+Y4IsYDKhbn+TdWwBzl6tlno3LcnCeF8=;
        b=gWSrPLm8aBX4XNw+I8JN44ho6GlHJf7Zhh6jQa5ebaOHRlG/T9pxDeGUqozgVQv0gI
         u4q0QXATgvQpdnFxse36MWc9voMVV5zWJh0ANl0qRO7+FDCxfjjQUMcOt3R1hJxgMh84
         Fouf6jYJkh11/T9BaNvbYNqoLNqNHd0CaXAIHY4YZbwQBi3L+A0e6XDkCtUZsxDczkpq
         2xfQ2yCsUtOyeyd0CWO8Qb8JnfG5mF8c1emVxArs1TDfdMD14GLt7AvqYk6WzRgWB508
         kkat0HfZJQDfFxHBoby0Wv2vjQoXsLJF+uVmUYebWMv88PQu8pK6FpcBGDjNO/PHTe/v
         lJWQ==
In-Reply-To: <CAJygYd3kr9a-LVXAhPyrDyXuPCGo2GZeOj156yLV=Tfen_+09w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Marco Padovan <evcz@evcz.tk>
Cc: netfilter <netfilter@vger.kernel.org>

those size means the hashtable size is 8192 and each incoming
connection take one place, because you are hashing by srcip, that
means you are tracking at most 8192 ip at same time.

When hashtable is full and you will see that log and old entries will
be dropped from the table to make room for new one.  that will cause
inaccurate tracking and all sorts of performance problem too

On Sun, Nov 18, 2012 at 6:35 PM, =E5=8F=B6=E9=9B=A8=E9=A3=9E <sunyucong=
@gmail.com> wrote:
> those size means the hashtable size is 8192 and each incoming connect=
ion
> take one place, because you are hashing by srcip, that means you are
> tracking at most 8192 ip at same time.
>
> When hashtable is full and you will see that log and old entries will=
 be
> dropped from the table to make room for new one.
>
>
> On Sun, Nov 18, 2012 at 8:45 AM, Marco Padovan <evcz@evcz.tk> wrote:
>>
>> I'm using this ruleon iptables v1.4.7
>>
>>
>> iptables -A INSYNSRCLIMITER -m hashlimit --hashlimit-htable-expire 1=
0000
>> --hashlimit-htable-size 8192 --hashlimit-htable-max 8192
>> --hashlimit-mode srcip --hashlimit-name insynlimiter --hashlimit 1/s
>> --hashlimit-burst 25 -j RETURN
>>
>>
>> while being "synflooded" and I'm seeing a lot of
>>
>> xt_hashlimit: max count of 8192 reached
>>
>> errors logged... really a lot (just to explain how many of those: go=
t a
>> bunch of "net_ratelimit: 42695 callbacks suppressed"logged too...)
>>
>> What does exactly that errors mean?
>>
>> did there was more then 8192 srcip to track and hashlimit went in
>> overflow or am I using --hashlimit-htable-size and
>> --hashlimit-htable-max in the wrong way?
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
