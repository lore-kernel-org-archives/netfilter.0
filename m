From: =?UTF-8?Q?P=2Do_L=C3=A9vesque?= <olygraph.po@gmail.com>
Subject: Re: IPTABLES + PREROUTING + --set-mark + Ubuntu
Date: Thu, 15 Jan 2015 22:49:57 -0500
Message-ID: <CAJb3rWC06PWq97tsgY0cK_oSjpkyavyi+faY-VWBqUPSv305XA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=PS34FwQuG7vr3fG3hkQJlUpJekmxFvfQZVoFSyGc374=;
        b=wGkI6Qqm5YiOxELZ87gVzTPXx6x7xrbW8u6A3Jc8n29AIycMAHTVRCuH7/xfZPR8ds
         S9E6KS8af0Ihwg/mu/PDnPYxBTLx4TBf99kkR4npZ0v8ZiWinjt/fqKjaAlkPUS1RA+r
         wh6zJC9KkKo8m2vf8kws8wotCpezP0LBwq8scLxNfOn050DjHQyG7cox25qV4n+78a1r
         p742C1B9RXFd4nBpBgEYqn0/K1DI51ratXMH4cONZxfWkWsNuM9xPbrwKVeaIKBiA70s
         s7KIrXBZSvb4mU0Y98JwTvdDW+fi9faRjAYzGjGZ3rSspDWpBSnmJ3mqzoaeceMYn6c5
         G5cQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> Ok, now I understand your problem :-)
> In this case try this instead of the above (I think this you even had in your
> prev postings):
>  ip rule add fwmark 2 table 2
>
> And add this for marking the pkts based on port(s):
> iptables -t mangle -A PREROUTING -p tcp -m multiport --ports 80,22 -j MARK
> --set-mark 2
>
> Both commands should be placed as early as possible within your script.

That is exactly what I want and what i try to say! but that is also
exactly what is not working!

..my rp_filter is set to 0 in the kernel..

So i assume there is a bug in iptables for ubuntu, something missing
somewhere or a config to enable somewhere.. beacause it is a very
simple set of rules... the OUTPUT rules works fine. and the rule: ip
rule add from 192.168.2.0/24 table 2 all   works..
Just the PREROUTING rules that does not work for me..

Thks
