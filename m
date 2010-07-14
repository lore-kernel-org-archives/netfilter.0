From: Curby <curby@cur.by>
Subject: Re: Help!!! iptables hashlimit
Date: Wed, 14 Jul 2010 02:39:51 -0600
Message-ID: <AANLkTilFi9WmIWoRQ16N-iG34klTw_IF76hGafpaHTe3@mail.gmail.com>
References: <4694.23493.qm@web32402.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4694.23493.qm@web32402.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ha do <haloha201@yahoo.com>
Cc: netfilter@vger.kernel.org

On Wed, Jul 14, 2010 at 2:03 AM, ha do <haloha201@yahoo.com> wrote:
> i just setup the hashlimit for SIP REGISTER on iptables and the rule =
is:
> -A =A0INPUT -p udp -i eth0 --dport 5060 -m hashlimit --hashlimit 1/mi=
nute
> --hashlimit-burst 2 --hashlimit-mode srcip,srcport =A0--hashlimit-nam=
e =A0"cucku" -m
> string --string "REGISTER sip:" --algo bm --to 80 -j ACCEPT

> i want the iptables just to =A0accept 2 REGISTER packets per minute o=
n per IP
> address:port

There might be other issues, but you need hashlimit 2/minute to accept
2 packets per minute.  Having a burst of 2 by itself is not
sufficient.

Sometimes, due to network latency or other timing issues, you need to
be even more accepting.  For example, I've found that accepting
"well-behaved" pings requires a minimum hashlimit of 61/min with burst
of 2.  When I lower either setting, iptables starts dropping the
occasional ping packet.

--Mike
