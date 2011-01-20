From: Victor Safronov <vitek@vitek.tomsk.ru>
Subject: Re: iptables/ipset syntax
Date: Fri, 21 Jan 2011 00:52:30 +0600
Message-ID: <4D38846E.9000108@vitek.tomsk.ru>
References: <a1bd277586d221277f8a4566fc37355c@psw.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a1bd277586d221277f8a4566fc37355c@psw.ro>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

  20.01.2011 21:38, Arthur Titeica =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hello
>
> I'm having some trouble understanding the correct syntax for an=20
> iptables rule involving ipset.
>
> I need to forward between IPs within the same ipset. So I've tried=20
> using something like this:
>
> iptables -A FORWARD -i eth0 -o eth0 -m set --match-set testset src,ds=
t=20
> -p tcp --dport 9000:9020 -j ACCEPT
>
> However this allows forwarding to all the eth0 network for the=20
> 'testset' IPs.
>
> Instead
> iptables -A FORWARD -i eth0 -o eth0 -m set --match-set testset src -m=
=20
> set --match-set testset dst -p tcp --dport 9000:9020 -j ACCEPT
> seems to do what I need but I'm not 100% certain.
>
> Anyone with a better understanding?
>
> iptables v1.4.10
> ipset v5.3.
>
> Thank you.
>
Unfortunately, the flags src|dst[, src|dst...] do another work than 90%=
=20
of people that new to ipset suppose to.
Some of them think the rule 'iptables -A FORWARD -m set --set something=
=20
src, dst -j SOMEWHERE'  is a shortcut to 'iptables -A FORWARD -m set=20
--set something src -j SOMEWHERE; iptables -A FORWARD -m set --set=20
something dst -j SOMEWHERE' or something like that.
Just read the man of ipset section of iptables and then you'll know wha=
t=20
these flags do.
