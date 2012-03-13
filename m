From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: comments about local loopback interface rule granularity
Date: Tue, 13 Mar 2012 16:17:58 +0100
Message-ID: <4F5F6526.2020205@freemail.hu>
References: <CAMmbHwnH1YSW8vFJu2aoFSnY-vSDRS9KtGdhSe2G=tdyhGgmsg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMmbHwnH1YSW8vFJu2aoFSnY-vSDRS9KtGdhSe2G=tdyhGgmsg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: paddy joesoap <paddyjoesoap@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,


2012-03-13 15:28 keltez=E9ssel, paddy joesoap =EDrta:
> I often see the following:
>
> iptables -A INPUT -i lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT
>
> where a default DROP policy is applied to both INPUT and OUTPUT chain=
s.

Just a side note.

I always use these rules because:
  - I just enable something and deny everything else... (ACCEPT the=20
specified and DROP as the policy).
  - I want my local services run "as fas as they can"... (I use the=20
rules above as the first rule in the chain. Be aware that you can use=20
the rules above in the raw, mangle and filter tables too..)
  - I do not think that there is anything filterable on the "lo" interf=
ace.

Swifty
