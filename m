From: "C. L. Martinez" <carlopmart@gmail.com>
Subject: Re: Problems with a forward rule
Date: Mon, 14 May 2012 10:18:23 +0200
Message-ID: <CAEjQA5KY-6k-mFny8g=Gw8v+PZBh6tP9r4TaX+Gv3Y7V6b9aTw@mail.gmail.com>
References: <CAEjQA5JVsMUizFWODGe+OT88owqbPU0=ZjtRugq6Eg8z1U3A=w@mail.gmail.com>
	<4FAECDBA.9030302@saasplaza.com>
	<CAEjQA5LAwmxTwAGWJH5A5Bs57h8=BSXWwiWegYmVKSM7ZtvtmA@mail.gmail.com>
	<201205140326.09455.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=cFsVIXZ1hsz/38WXorkwFHJWt9tU87IGXdTmLx+mLPo=;
        b=aIydGedbhw85KRcU+ER6QYhLF2GgwjH1qqvzM0jY9PGMikOmtz+phUqRjVbnql0j7y
         tbFPBdCmDwyC3ayHvBKT2Ayae6koVIFCtrvrcPu4HXC8KhpSKFUfp1rFZhuDN2lmzIQD
         GVOe0YF1xGzBddktfNWwrrDCBbwmDkOS7MEoIvIi1giZol1RO/KWcOopYIufCxVn3+bP
         w7aH9shk8Jly/mEHhDSuUWP6hJ3xSTmmmzHQL1SasQdnvx6EdumTELSy6gawv+Uh+cz8
         ApgqYXFDhu7dOq9bB+fvZHhHpoo+ip99E69LkJuEaYREe6d5sjYPSPMRAv+Gxo3ER7gn
         Ya0g==
In-Reply-To: <201205140326.09455.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

On Mon, May 14, 2012 at 9:26 AM, Neal Murphy <neal.p.murphy@alum.wpi.ed=
u> wrote:
> On Monday 14 May 2012 01:45:21 you wrote:
>
>> Ok, here they are. I want to allow connections from host 172.24.50.3
>> to one specific network only.
>
> As written, your rules
> =C2=A01. Allow all packets for established conns and the first packet=
 for related
> =C2=A0 =C2=A0 conns to pass.
> =C2=A02. Allow all packets for new conns from the host to pass
> =C2=A03. Drop all other packets. This makes the first rule moot, beca=
use there
> =C2=A0 =C2=A0 will be no established conns from other hosts. NEW pack=
ets are dropped,
> =C2=A0 =C2=A0 thus there cannot be any established conns for a relate=
d connection to
> =C2=A0 =C2=A0 be created.
> But I suspect you already know your rules don't work right. :)
>
> I only looked at the rules in table 'filter'.

Sorry Neal, but exists some things in your answer that I don't understa=
nd ...

In line:
>
> To restrict that host to a particular LAN and allow other hosts throu=
gh, these
> rules in table 'filter':
> -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -s 172.24.50.3/32 -m state --state NEW -j ACCEPT
> -A FORWARD -j LOG --log-prefix "IPT FORWARD packet died: "
>
> should be:
> -A FORWARD -s 172.24.50.3/32 -d a.b.c.d/netmask \
> =C2=A0-m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

Why this rule??:

> -A FORWARD -s a.b.c.d/netmask -d 172.24.50.3/32 \
> =C2=A0-m state --state RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -s 172.24.50.3/32 \
> =C2=A0-j LOG --log-prefix "FORWARD dropped packet from 172.24.50.3: "

Why this rule??: by default all is denied if it is not exists an
established and related connection.

> -A FORWARD -s 172.24.50.3/32 -j DROP
> -A FORWARD -d 172.24.50.3/32 \
> =C2=A0-j LOG --log-prefix "FORWARD dropped packet to 172.24.50.3: "
> -A FORWARD -d 172.24.50.3/32 -j DROP

Why this rule??:

> -A FORWARD -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
>
I only want to allow related and established connections ... not new
if it is not explicit allowed.


> Rule order is important. Thus,
> =C2=A01. Packets from the host to that LAN that are for (1) a new or =
a
> =C2=A0 =C2=A0 new/related conn, and (2) all packets for established c=
onns,
> =C2=A0 =C2=A0 are allowed.
> =C2=A02. Packets to the host from that LAN for (1) a new/related conn
> =C2=A0 =C2=A0 or (2) for established conns are allowed.
> =C2=A03. All other packets forwarded to or from that host are dropped=
=2E
> =C2=A04. All other forwarded packets are allowed.
> =C2=A05. The FORWARD chain's DROP policy is never executed. See #5 (a=
bove).
> =C2=A06. The host is still allowed to access all other hosts on its L=
AN; the
> =C2=A0 =C2=A0 router has no control over that.
> Since no protocols are specified, ICMP will also be allowed.
>
> Remember that:
> =C2=A0- Without ICMP, your internetwork will not function.

Sorry?? Why?? I administer a lot of chkps and bds fws and ALL had icmp
denied by default (with some exceptions), and it works ok ...

> =C2=A0- A 'conn' is a relation between two socket endpoints, be it TC=
P, UDP
> =C2=A0 =C2=A0or another protocol.
> =C2=A0- NEW refers to the *first* packet of a new conn.
> =C2=A0- RELATED refers to the *first* packet of a new, related conn.
> =C2=A0- ESTABLISHED refers to all other packets of established conns,
> =C2=A0 =C2=A0whether they started as NEW or as RELATED.
> =C2=A0- the RELATED state is set by a conntrack helper (FTP, etc.) th=
at
> =C2=A0 =C2=A0snoops and detects when one end of an established conn i=
s attempting
> =C2=A0 =C2=A0to open a new conn (such as FTP's data channel).
> =C2=A0- You may want to allow DNS (UDP port 53) to pass (if needed), =
depending
> =C2=A0 =C2=A0on where your DNS server or 'proxy' is.
> =C2=A0- You may want to add rules to INPUT and OUTPUT to prevent that=
 host
> =C2=A0 =C2=A0from accessing the router itself, if desired.

But according to my default policy, all that it is not allowed is
denied ... Your answers are redundant with my default policy ...
