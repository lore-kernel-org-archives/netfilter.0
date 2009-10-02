From: Marcel Laverdet <marcel@laverdet.com>
Subject: Re: Problems getting NOTRACK to do anything at all
Date: Fri, 02 Oct 2009 11:43:55 -0500
Message-ID: <4d3950064f1ab4c86937b59d8a1a3a99@localhost>
References: <0d99e50d4f57cd74439c228559a6738c@localhost> <4AC604F7.6060907@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AC604F7.6060907@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org


=0D
Yes, that was it! This was also the hint I needed to get some more comp=
lex=0D
rules setup and now everything is working just the way I want.=0D
=0D
Merci!=0D
=0D
On Fri, 02 Oct 2009 15:49:43 +0200, Pascal Hambourg=0D
<pascal.mail@plouf.fr.eu.org> wrote:=0D
> Hello,=0D
> =0D
> Marcel Laverdet a =C3=A9crit :=0D
>> =0D
>> For some reason I can't seem to get the NOTRACK iptables rule to do=0D
>> anything at all. Can anyone make sense of the following session whic=
h I=0D
>> think describes the problem better than words could. The session bel=
ow=0D
>> was=0D
>> carried out on a reasonably busy server, and I didn't waste much tim=
e=0D
in=0D
>> between each command.=0D
> [...]=0D
>> fantasma marcel # iptables -t raw -A PREROUTING -i lo -j NOTRACK=0D
> =0D
> I guess the raw/PREROUTING chain is too late for local traffic. Local=
ly=0D
> generated packets are processed by conntrack in the NF_IP_LOCAL_OUT h=
ook=0D
> unless the NOTRACK target was used in the raw/OUTPUT chain.=0D
> =0D
> Try this instead :=0D
> iptables -t raw -A OUTPUT -o lo -j NOTRACK
