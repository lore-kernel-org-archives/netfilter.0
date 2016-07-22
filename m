From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: How does iptables NAT handle IPsec ESP with NAT-T UDP header ?
Date: Fri, 22 Jul 2016 20:11:41 +0200
Message-ID: <fa1bc371-408e-6508-4cf3-e0ee438fc55a@plouf.fr.eu.org>
References: <AM4PR0301MB227595822291E80D8CFB861A910A0@AM4PR0301MB2275.eurprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AM4PR0301MB227595822291E80D8CFB861A910A0@AM4PR0301MB2275.eurprd03.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Guy German <guy_g@rad.com>, "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

Hello,

Short answer to the subject question : like any other UDP "connection".

Le 22/07/2016 =C3=A0 13:45, Guy German a =C3=A9crit :
>
> When we look at the outgoing packets we see the following:
> In some cases, the src UDP port is changed to 1024 as regular SNAT is=
 taking place.
> However, it seems that in most of the times (we performed several tes=
ts, each after rebooting the setup) the
> UDP header is left untouched (i.e. both src/dst ports equal 4500) whi=
le we were expecting that the src UDP port will be changed after SNAT.
(...)
> Why is the src UDP port unchanged ?

Because it does not need to be changed.
Please read the man page about the SNAT target (same behaviour as=20
MASQUERADE wrt source port mangling) :

   --to-source [ipaddr[-ipaddr]][:port[-port]]
       which  can  specify a single new source IP address, an inclusive
       range of IP addresses, and optionally, a port  range  (which  is
       only  valid if the rule also specifies -p tcp or -p udp).  If no
       port range is specified, then source ports  below  512  will  be
       mapped  to  other  ports  below  512: those between 512 and 1023
       inclusive will be mapped to ports below 1024,  and  other  ports
       will  be mapped to 1024 or above. Where possible, no port alter=E2=
=80=90
       ation will occur.

"Where possible, no port alteration will occur".

> Is it possible that iptables is using the ESP SPI field as source ide=
ntifier in the NAT table ?

I don't think so. However you may write rules matching a given field.

> If so, why do we still have situations in which for some tunnels the =
src UDP port 4500 does change ?

Source port alteration occurs to avoid a collision with another existin=
g=20
connection in the connection tracking table.

> Is there a way (i.e. iptable syntax) to control this ?

If you want to force source port alteration, use the --random option or=
=20
specify a port range with --to-ports.

> Is there a way to view the current NAT table contents ?

Run "conntrack -L" or read into /proc/net/nf_conntrack.
