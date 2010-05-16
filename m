From: Curby <curby@cur.by>
Subject: Re: Playing nice with incoming traceroutes
Date: Sun, 16 May 2010 15:00:16 -0600
Message-ID: <AANLkTinmOW-hhTtsjEO-85RGNnLiJJgox3t2VaYgYclC@mail.gmail.com>
References: <AANLkTimnTBPl5oayp3tprDmROD4bNpIXyAodkZuF_JlS@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimnTBPl5oayp3tprDmROD4bNpIXyAodkZuF_JlS@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Fri, May 14, 2010 at 3:17 PM, Curby <curby@cur.by> wrote:
> Hello, I'm considering allowing inbound traceroutes to find me, in th=
e
> interest of being a good Internet citizen. =A0I could simply open the

So I did some testing, and it seems that my Debian system really does
act as the traceroute program expects.  From the manpage talking about
the default UDP method: "Since the ports are expected to be unused,
the destination host normally returns "icmp unreach port" as a final
response."

Sniffing the ICMP traffic confirms the use of 3/3 "port unreachable" re=
plies.

On Sat, May 15, 2010 at 10:51 AM, Pieter Smit <mlist2010@vigor.co.za> w=
rote:
> You would send an ICMP time exceeded (type 11) packet if you receive =
a
> packet with a ttl=3D1 you will decrement it one realize it is 0 and s=
end
> the ICMP time exceeded.

Documentation suggests that well-behaved routers on the path to the
destination host are meant to respond with ICMP type 11, but it's
perfectly acceptable (and perhaps even expected) that the actual
destination host respond with a ICMP type 3 code 3 (port unreachable)
instead.

Re: multiple scan types, I'm just going to explicitly build in support
for UDP and ICMP scans.  I'm not going to explicitly deny SYNs sent to
all TCP ports. =3D)

--Mike
