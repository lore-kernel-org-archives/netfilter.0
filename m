From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: tc and CONNMARK
Date: Tue, 6 Oct 2009 13:21:56 +0100
Message-ID: <56378e320910060521m7b2d52fcwccee7d7535ff5d33@mail.gmail.com>
References: <4AC9BD2E.301@duet.it> <4AC9FF4E.5010307@unipex.it>
	 <4ACA04DF.3030006@duet.it> <4ACA1D55.1020304@unipex.it>
	 <4ACB2FA0.30301@duet.it>
	 <56378e320910060516x596cf5abv20e916ae9f694e6d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=rPMMeGkGJZhJP02gmnd3LJwWs/LLqbaDNvj58AII78M=;
        b=OS55AuFk1kHkD75OeQcDlZ3uIjBI5lZWyCLGKDBdiRFWZ4GCj8wyPI3VYwz0G69er9
         dBHhp9ItPY3IhRjgAQ+PA6b/Vxc+hzbJTLM1KQDEALUxUrPZLyx9DTKxgej7Jt7FTylz
         GPNk7WqNQA66xf2yi36qWK2q3oOgCNtE6gOcg=
In-Reply-To: <56378e320910060516x596cf5abv20e916ae9f694e6d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Just realised I'd sent this direct not via list... must remember to
check address lines before sending in future.

2009/10/6 Richard Horton <arimus.uk@googlemail.com>:
> 2009/10/6 Fabio Marcone <fabio.marcone@duet.it>:
>
>> what kind of problems? What do you mean with "I switch to classid" ?
>>
>
> Classid in this context I would assume to mean using the diff serv
> code point field (was the ToS field) in the IP Header and making
> queuing decisions based on the diffserv value rather than using
> marking in the packet structure.
>
> If you use Classid there are two routes you can go do;
>
> Route 1 uses 'class selectors' and provides 8 levels of discriminatio=
n.
> Route 2 goes down the full diffserv path and provides 3 levels of
> traffic - Expedited forwards, Assured Forwarding and 'Best' Effort
> (which is anything but best).
>
> The EF class is designed for real-time jitter (variation of delay)
> sensitive traffic, AF is designed for loss-intolerant traffic and
> provides 4 levels of forwarding each with 3 levels of drop precedence
> and BE is well... whatever is left over.
>
> Using the AFxy (x class, y drop precedence) you can define some
> complex schemes with each class having a guaranteed bandwidth with
> packets being dropped on the basis of their drop precedence...
>
>
> For instance to mark rtp and give it decent bandwidth/priority and si=
p
> slightly lower...
>
> (Using port 20000/20001 for rtp, 5060 for sip)
> iptables -A INPUT -t mangle -p udp -dport 5060 -j DSCP --set-dscp-cla=
ss AF41
> iptables -A INPUT -t mangle -p udp -dport 20000 -j DSCP --set-dscp-cl=
ass EF
> iptables -A INPUT -t mangle -p udp -dport 20001 -j DSCP --set-dscp cl=
ass EF
>
> tc qdisc add dev eth0 root handle 1: htb default 10
> tc class add dev eth0 classid 1:10 parent 1: htb rate 10mbps ceil 10m=
bps prio 10
> tc class add dev eth0 classid 1:20 parent 1: htb rate 30mbps ceil 40m=
bps prio 5
> tc class add dev eth0 classid 1:30 parent 1: htb rate 60mbps ceil 100=
mbps prio 0
>
> tc filter add dev eth0 parent 1:0 protocol ip prio 10 u32 \
> =A0 match ip tos 0x88 0xff flowid 1:20
> tc filter add dev eth0 parent 1:0 protocol ip prio 10 u32 \
> =A0 match ip tos 0xB8 0xff flowid 1:30
>
>
>
> --
> Richard Horton
> Users are like a virus: Each causing a thousand tiny crises until the
> host finally dies.
> http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian =
=46orest Cats
> http://www.pbase.com/arimus - My online photogallery
>



--=20
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Fo=
rest Cats
http://www.pbase.com/arimus - My online photogallery
