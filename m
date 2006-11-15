From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Cannot go out the firewall from internal network (NAT)
Date: Wed, 15 Nov 2006 09:02:23 +0100
Message-ID: <455AC98F.3090606@freemail.hu>
References: <e8c943190611130715g6d88ccabu4d87bc6ecf3826d9@mail.gmail.com>	<4559A9B3.8080205@gmail.com>
	<e8c943190611141158x489ed2feh36fe6fad2cb2fdc8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e8c943190611141158x489ed2feh36fe6fad2cb2fdc8@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Marco Nicoloso <nicolm@gmail.com>, Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>


Marco Nicoloso =EDrta:
>
> 1) POSTROUTING chain is processed after the FORWARD chain, isn't it?
Yes
> But do I really need the FORWARD chain? If yes, do I need to setup my
> rules for filtering the packets coming from my LAN which I want to
> pass through the firewall (using a DROP policy) in the FORWARD or just
> in the INPUT chain, or in both of them?
In the FORWARD chain you filter the packets passing througth the firewall=
=2E..
In the INPUT chain you filter the packets sent to your firewall... (For=20
example to a DNS server that sits on your firewalling machine...)
http://www.netfilter.org/documentation/HOWTO//packet-filtering-HOWTO-6.ht=
ml

>
> 2) Which is the right place for the NATting rules in my script? That
> is, NAT rules must be placed before or after PF rules (for me after,
> but as NAT controls different chains because `nat' is a different
> table... maybe it's the same)
There are chains (PREROUTING, INPUT, FORWARD, OUTPUT, POSTROUTING) and=20
tables (-t raw, -t mangle, -t nat, -t filter <-(default) )
http://www.faqs.org/docs/iptables/traversingoftables.html
NAT rules ARE placed before (PREROUTING) and after (POSTROUTING) PF rules=
=2E..
Take a look on what you have already done with these commands:

iptables -vnL -t nat
iptables -vnL
iptables -vnL -t mangle
>
> 3) Someone can verify the following sentence if I understood
> correctly: "Packet coming from any network connected to the firewall
> enters the chain INPUT:=20
The correct route:

mangle PREROUTING
nat PREROUTING

[Routing decision]

mangle INPUT
filter INPUT

[Local process]

> rules are processed from the first in order to
> the end,=20
yes
> if a suiting rule for it is found, then the faith of the
> packet depends only on that rule;
yes
> if not packet is either dropped or
> accepted, depending on the general policy of the chain
yes

Rules that you may think about (What I prefer :D ):
- The chain policy should be always ACCEPT except in the filter tables...=

- DROP-ing or REJECT-ing should me always done in the filter tables...
- Using user-defined chains makes the iptables run faster...

Also take a look on my script.... :)

https://lists.netfilter.org/pipermail/netfilter/2006-August/066404.html

Swifty


