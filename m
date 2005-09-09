From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: Route packets from an interface to another
Date: Fri, 9 Sep 2005 16:35:33 -0400
Message-ID: <65aa6af90509091335d964c45@mail.gmail.com>
References: <1197.83.227.26.235.1126293340.squirrel@webmail.2lug.se>
	<65aa6af905090913223ee05c29@mail.gmail.com>
	<1217.83.227.26.235.1126294378.squirrel@webmail.2lug.se>
	<65aa6af905090913353e0d0150@mail.gmail.com>
Reply-To: eantoranz@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af905090913353e0d0150@mail.gmail.com>
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

Well.. routing in this case is not single point problem.... but both
points have to route correctly to make it "happen". You sure the other
machine is routing through the VPN tunnel when replying?

On 9/9/05, Jonathan <phonic@antisocial.nu> wrote:
> I have already set up routes exactly like that one. :-)
>
> The purpose is that I want to have a static IP on my home box. I have a
> /28 addressed on a box so I thought I could tunnel one of these addresses
> to my box home.
>
> And the problem; when I ping/ssh/whatever 192.121.234.213 from the /28-bo=
x
> (box1), the traffic goes through 10.1.0.1 to 10.1.0.2 and reaches my home
> box. But when I ping/ssh/whatever from outside the traffic goes to box1.
> That's why I think NATing the connections will solve the problem. But
> maybe I'm wrong?
>
> > IPTABLES? I think it's a routing problem, not a firewall one.
> >
> > ip route add 192.121.234.213 via 10.1.0.2
> > I think that would do the first part of your problem.
> >
> > But why do you have an IP address (not 127/8) set on a loopback interfa=
ce?
> >
> > On 9/9/05, Jonathan <phonic@antisocial.nu> wrote:
> >> Hello,
> >> I have the following interface configuration on two boxes:
> >> box1: eth0:5 192.121.234.213 netmask 255.255.255.240 broadcast
> >> 192.121.234.223
> >> box2: lo:0 192.121.234.213 netmask 255.255.255.255
> >> between box1 and box2 I have a OpenVPN tunnel (endpoints 10.1.0.1 and
> >> 10.1.0.2).
> >>
> >> I want to forward all packages on box1 with destination 192.121.234.21=
3
> >> to
> >> tun0 (10.1.0.1), so theWy pass through the tunnel and comes to box2. I
> >> also
> >> want to forward all packages from tun0 (10.1.0.1) to eth0:5
> >> (192.121.234.213). How do I do this with iptables?
> >>
> >> Regards
> >> Jonathan
> >>
> >>
> >>
> >
> >
>
>
>
>

