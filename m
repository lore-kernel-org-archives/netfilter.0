From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: --iif argument unrecognized by iptables
Date: Mon, 26 Jan 2009 16:12:57 +0100
Message-ID: <497DD2F9.2010004@plouf.fr.eu.org>
References: <f8a02f3e0901251559q6324e3faqc75af6d16eba8038@mail.gmail.com>	 <497D88FA.2060005@plouf.fr.eu.org> <f8a02f3e0901260646p3791088dmb591400469cc2454@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <f8a02f3e0901260646p3791088dmb591400469cc2454@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Andy Theuninck a =E9crit :
> iptables -j ROUTE -h gives identical output to iptables -h.

Even at the very end ? It should display help about the ROUTE target=20
like here :

> ROUTE target v1.11 options:
>     --oif       ifname          Route packet through `ifname' network=
 interface
>     --iif       ifname          Change packet's incoming interface to=
 `ifname'
>     --gw        ip              Route packet via this gateway `ip'
>     --continue                  Route packet and continue traversing =
the
>                                 rules. Not valid with --iif or --tee.
>     --tee                       Duplicate packet, route the duplicate=
,
>                                 continue traversing with original pac=
ket.
>                                 Not valid with --iif or --continue.

Else it means this target is not supported by your iptables build.
I remember that (by default ?) some versions built only shared librarie=
s=20
for matches and target supported in the kernel, so you had to rebuild=20
iptables after enabling a new feature in the kernel.
