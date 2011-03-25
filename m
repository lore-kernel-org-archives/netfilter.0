From: Pandu Poluan <pandu@poluan.info>
Subject: Re: netfilter pecularities
Date: Fri, 25 Mar 2011 17:31:42 +0700
Message-ID: <AANLkTimcOQd46KDwH5=7Er6Q2yud2N8qUsAgFazbmN4u@mail.gmail.com>
References: <20110325090527.M18530@kdtc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110325090527.M18530@kdtc.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cc <cc@kdtc.net>
Cc: netfilter@vger.kernel.org

On Fri, Mar 25, 2011 at 16:05, cc <cc@kdtc.net> wrote:
> Hi,
>
> I have a netfilter-based firewall running and recently its behaviour
> has been very puzzling (to the point of suspicious). =C2=A0However, t=
his
> can also be attributed to user-error.
>
> Please correct me if I'm wrong here.
>
> I have a filter that forwards (via NAT prerouting) SMTP packets
> to my e-mail server behind the firewall. =C2=A0Here are the
> following rules:
>
> $IPT -t nat -A PREROUTING -p tcp -i $INET_IF -d $INET_IP \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --dport $SMTP -j DNAT --to $DMZ_EM=
:$SMTP
> $IPT -t nat -A PREROUTING -p tcp -i $DMZ_IF -d $INET_IP \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --dport $SMTP -j DNAT --to $DMZ_EM=
:$SMTP
>
> $IPT -t nat -A PREROUTING -p tcp -i $DMZ_IF -d $INET_IP \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-s $LAN_NET --dport $SMTP -j=
 DNAT --to $DMZ_EM:$SMTP
>
> These rules are the only one that has anything to do with
> SMTP port forwarding and it doesn't include SNAT as it's
> obvious from the rules. =C2=A0If you can bear with me for a bit.
>
> Now theoretically speaking, if I comment out the above lines,
> NONE of the SMTP traffic will be going anywhere, am I correct?
>

SMTP traffic from LAN to DMZ should not be affected.

> My setup is this. =C2=A0It's a 2.4.x based netfilter firewall.
> (distribution is Slackware).
>
> Now here's where I need a bit of clarification and/or
> explanation. =C2=A0What happens is the following.
>
> If I comment out the aforementioned rules, =C2=A0the SMTP traffic
> still finds its way to the DMZ_EM machine. =C2=A0(I'm a bit stumped h=
ere.)
>
> If I reset the firewall by flushing the rules, the SMTP traffic
> still finds its way to the DMZ_EM machine.
>

=46rom INET or from LAN?

> When I run iptables, is it supposed to 'insmod' ip_tables, etc
> to the modules list? =C2=A0Even if it's compiled into the kernel?
>

I don't think so. IMO if the modules are compiled into the kernel,
iptables will not load them.

But I'm not a developer, though. I *could* be wrong.

> Any clarifications appreciated.
>
> Ed
>

Rgds,
--
Pandu E Poluan
~ IT Optimizer ~
Visit my Blog: http://pepoluan.posterous.com
