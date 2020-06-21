From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables and connection tracking
Date: Sun, 21 Jun 2020 10:06:14 +0200
Message-ID: <20200621080614.GK26990@breakpoint.cc>
References: <CAChjPdRd1xePA2fesrj8imCo9gfP_B5bko95MEGEwsAWVX6fjw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAChjPdRd1xePA2fesrj8imCo9gfP_B5bko95MEGEwsAWVX6fjw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marek =?iso-8859-15?Q?Gre=A8ko?= <mgresko8@gmail.com>
Cc: netfilter@vger.kernel.org

Marek Gre=A8ko <mgresko8@gmail.com> wrote:
> I have problem to get connection tracking work when using nftables. I
> have this setup on my fedora 32:
>=20
> table ip raw {
>         chain PREROUTING {
>                 type filter hook prerouting priority raw; policy accept;
>                 meta l4proto udp udp dport 5060 # CT helper sip
>         }
>=20
>         chain OUTPUT {
>                 type filter hook output priority raw; policy accept;
>                 meta l4proto udp udp dport 5060 # CT helper sip
>         }

These rules don't do anything (it matches udp 5060, but no action is
given).  I suspect this from xtables-translate, which did not understand
the -j CT --helper sip rule.

This needs something like:
table ip raw {
   ct helper sip {
     type "sip" protocol udp
   }
   chain prerouting {
       meta l4proto udp udp dport 5060 ct helper set "sip"
   }

# same for output
}
