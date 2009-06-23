From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How to route per process?
Date: Tue, 23 Jun 2009 11:12:22 +0200
Message-ID: <4A409C76.103@plouf.fr.eu.org>
References: <3cda010470e818a0d5c1c025716ded6e.squirrel@webmail.sonic.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3cda010470e818a0d5c1c025716ded6e.squirrel@webmail.sonic.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

ulmo@sonic.net a =E9crit :
>=20
> The software in question has the capability to bind to specified
> addresses, but not to send packets out over specified interfaces, whi=
ch is
> necessary.

It is easy to do source address-based routing.
ip rule from <address> lookup <table>

> iptables -t mangle -A OUTPUT -m owner --uid-owner asterisk -j MARK
> --set-mark 42 &&
> iptables -t nat -A POSTROUTING -o $dev -m mark --mark 42 -j SNAT
> --to-source $ifaceaddr &&
> ip rule add fwmark 42 table 42 &&
> ip route add default via $gw dev $dev table 42
>=20
> To wit, all the above works, except that when the packets come back, =
the
> process in question doesn't receive them.  tcpdump shows everything
> working as desired up to that point:  the packets go out, they get
> responses which come back.  The disconnect is somewhere between the r=
eturn
> packets coming back and them being put into the process's connection =
as
> desired inside the OS, I'm pretty sure.

Check your iptables filtering rules, and that source validation by=20
reverse path filtering is disabled on the alternate interface=20
(/proc/sys/net/ipv4/conf/<interface>/rp_filter=3D0). It is disabled by=20
default in the kernel, but startup scripts in some distributions enable=
 it.
