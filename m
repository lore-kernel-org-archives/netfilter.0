From: bsilva <bsilva@sonic.net>
Subject: Re: Forward packets from one interface to another?
Date: Tue, 3 Feb 2009 12:24:11 -0800 (PST)
Message-ID: <Pine.LNX.4.58.0902031205200.13208@bolt.sonic.net>
References: <200902031753.59283.Karlis.Repsons@gmail.com>
 <200902031940.09273.Karlis.Repsons@gmail.com> <49889fd0.1c078e0a.6cc4.ffff9618@mx.google.com>
 <200902032004.44533.Karlis.Repsons@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200902032004.44533.Karlis.Repsons@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?windows-1257?q?K=E2rlis_Repsons?= <karlis.repsons@gmail.com>
Cc: 'netfilter' <netfilter@vger.kernel.org>


You can use either routing/forwarding or bridging for this problem,
however, bridging is simpler in many ways.  If you use bridging, there =
is
are fewer impacts on the design of the rest of your network.  If you us=
e
routing, then the router that connects the PC with two interfaces to th=
e
Internet needs to know about the network on the other side of the PC
(in a small network this can be done by adding a static route).

So, in this example:

-----------                -----------                  -----------
| Router/ |                |   PC    |                  |   PC    |
| Firewall|.1    Net A  .10| with 2  |.10    Net B   .11| with 1  |
|   to    |----------------|  NICs   |------------------|  NIC    |
| Internet|  192.168.1.0   -----------   192.168.2.0    -----------
-----------
Each network is /24 (netmask of 255.255.255.0)

So, for this to work you need to do several things, the simplest is tha=
t
you need to assign each PC the appropriate addresses.

=46irewall router:
Local network IP: 192.168.1.1 /24
Internet address is not given in this example, but is assumed to exist =
;-)
Deafult gateway points to Internet.
Static route defining gateway to 192.168.2.0/24 via 192.168.1.10.

Router PC:
Net A NIC: 192.168.1.10 /24
Net B NIC: 192.168.2.10 /24
Default gateway: 192.168.1.1

Other PC:
NIC: 192.168.2.11 /24
Default Gateway: 192.168.2.10

Once configured, you will also need to turn on IPv4 forwarding in the
Linux box. The most universal way is to run this command:
"echo 1 > /proc/sys/net/ipv4/ip_forward"
Although most distributions have thier own method to configure IP
forwarding that persists across reboots.


I hope that helps.

Brad

On Tue, 3 Feb 2009, [windows-1257] K=E2rlis Repsons wrote:

> On Tuesday 03 February 2009 19:49:22 you wrote:
> > > -----Original Message-----
> > >
> > > On Tuesday 03 February 2009 19:21:05 Gilad Benjamini wrote:
> > > > Your description is not very clear, but my guess is that you wa=
nt to
> > >
> > > run a
> > >
> > > > bridge on this PC. "man brctl" is a good place to start.
> > >
> > > It is all very simple: think of one computer with two RJ45 inputs=
, one
> > > connected to LAN, other to laptop, which needs access to LAN too.=
 The
> > > problem
> > > is: I have only one cable to LAN and no extra switch.
> >
> > You say yourself that your problem is the lack of a switch; i.e. yo=
u want
> > your Linux machine to serve as the switch; i.e. you need a Linux br=
idge
>
> Well, most likely you are right and I will spend some more (but maybe=
 not as
> much) time tomorrow to set up that bridge. I just want to know, if it=
s
> absolutely necessary and there is no way to do routing / forwarding?
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
