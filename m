From: "Daniel Nogradi" <nogradi@gmail.com>
Subject: Re: updated iptables doesn't work with old rules
Date: Thu, 23 Feb 2006 16:41:41 -0800
Message-ID: <5f56302b0602231641h15f99ebakfa5cebaf8e5aa8f5@mail.gmail.com>
References: <5f56302b0602220158k76b68705p88dd35b4c2782caa@mail.gmail.com>
	<56310.193.173.147.3.1140611713.squirrel@webmail.sterenborg.info>
	<5f56302b0602220539t2ec885acwda00f0f2eb521854@mail.gmail.com>
	<5f56302b0602221253t7157857ejb15f87d9984da59c@mail.gmail.com>
	<43FCCF82.6010402@certicom.com>
	<5f56302b0602221357k27931798n7d521184123bb1c9@mail.gmail.com>
	<43FCE338.4090306@certicom.com>
	<5f56302b0602221513i22ff868et991067e3314998da@mail.gmail.com>
	<43FDC9EC.1050704@certicom.com>
	<5f56302b0602230749v5a56c8c3u6cbbdf832b59c88c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5f56302b0602230749v5a56c8c3u6cbbdf832b59c88c@mail.gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi Chinh, logging all 3 types (prerouting, forwarding, postrouting)
shows that the packets from 'machine B' never get postrouted. When I
ping from 'machine B' anything in the outside world messages are
logged about prerouting and forwarding but not postrouting, but
pinging from 'machine A' does result in logged messages about
postrouting (indeed, 'machine A' works fine). So I guess the problem
is around here, although I don't know exactly what this means.

I tried sniffing with tethereal too and that shows that the packets
actually get through from 'machine B' to the outside world, but never
return. For example sniffing eth0 while pinging from 'machine B' to
the outside world gives

1 29.996623 (my dynamical IP) -> (the IP I ping) ICMP Echo (ping) request
...

So I guess they get out, but can't get back to 'machine B'.

And I'm also quite confused about eth0/ppp0, perhaps a related issue
is that the kernel ip table of 'machine A' is

Destination    Gateway        Genmask         Flags Metric Ref Use  Iface
213.191.89.30     *           255.255.255.255  UH   0     0  0    ppp0
192.168.10.0      *           255.255.255.0    U  0     0  0    eth1
192.168.10.0      *           255.255.255.0    U  0     0  0     eth0
169.254.0.0       *           255.255.0.0      U  0     0  0    eth0
default        213.191.89.30  0.0.0.0          UG  0     0  0   ppp0

and what might be suspicious is that there are two identical lines one
with interface eth0 and the other with eth1. I'm not at all an expert
on routing (which you probably know by now :)) so I'm not sure if this
is a problem or not, but might be related.

Any clues?

On 2/23/06, Daniel Nogradi <nogradi@gmail.com> wrote:
> > It mean your packet traversed the prerouting nat eth1, and so on.
> >
> > I would put 3 log messages, at "prerouting nat eth1", "forward", and
> > "postrouting nat". If your packet is seen at postrouting then it should
> be
> > successfully forwarded.
> >
> > I noticed that your packet's outbound interface is ppp0. However, I
> recall
> > your
> > MASQUERADE rule had "--out-interface eth0". Perhaps this is the cause a=
nd
> > your
> > packet is not masqueraded? Try a simple "iptables -A POSTROUTING -t nat
> -j
> > MASQUERADE" without qualifiers.
> >
> > Other things to try. Use ethereal to sniff eth1, and eth0/ppp0. Is ther=
e
> > traffic?
> >
> > Chinh
> >
>
> Hi Chinh, thank you very much again, I'll try your suggestions tonight.
>

