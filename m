From: Pandu Poluan <pandu@poluan.info>
Subject: Re: How to insert a firewall with "gateway spoofing"?
Date: Tue, 22 Nov 2011 14:46:56 +0700
Message-ID: <CAA2qdGVG8E3Ve5DUwwpBLKLQQYimbbq7LcVMrO7BZF5ms87DgA@mail.gmail.com>
References: <CAA2qdGVFdUfO6GhAHX0Qf6L45_8sG6ZY1m=GquimuatetFWm=w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA2qdGVFdUfO6GhAHX0Qf6L45_8sG6ZY1m=GquimuatetFWm=w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

On Tue, Nov 22, 2011 at 12:43, Pandu Poluan <pandu@poluan.info> wrote:
> Hello, I need some suggestions.
>
> (If the ASCII diagrams get messed up, I've uploaded them to
> http://pastebin.com/SbbWKds0
>
> I have a network that looks like this:
>

---- >8 snip

>
> For some complicated reasons, I can't change the subnet address of th=
e
> LAN, nor can I change the default gateway for the systems in the LAN.
> And since I can't reconf the Router, I have to "spoof" the router.
>
> Is it doable just with iptables and iproute2? Or do I have to also go
> down the route of ebtables?
>
> And if it is doable, what caveats must I be aware of?
>
> Thanks in advance.
>

Some intense research, and I think I might've found the answer:

*) Configure the Linux box with, say, 192.168.0.3
*) Manipulate the routing table
*) Activate proxy_arp
*) Write some arptables rules to discard arp requests for 192.168.0.x
(where x !=3D 1 and x !=3D 3)
*) Write some iptables rules to perform firewalling
*) Activate ip_forward

Reference: http://www.sjdjweis.com/linux/proxyarp/

Do you think this plan will work?

Rgds,
--=20
=46dS Pandu E Poluan
~ IT Optimizer ~

=C2=A0=E2=80=A2 LOPSA Member #15248
=C2=A0=E2=80=A2 Blog : http://pepoluan.tumblr.com
=C2=A0=E2=80=A2 Linked-In : http://id.linkedin.com/in/pepoluan
