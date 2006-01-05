From: Eduardo Ukstin <ukstin@gmail.com>
Subject: Re: VPN rules
Date: Thu, 5 Jan 2006 10:31:15 -0200
Message-ID: <bb8a5cd0601050431q45d60c55i284c81ca8c38f5a5@mail.gmail.com>
References: <bb8a5cd0601041418t1645bf5cke057e6e371280c45@mail.gmail.com>
	<43bc5996.2a448af9.5d0f.6ff7SMTPIN_ADDED@mx.gmail.com>
	<bb8a5cd0601050351u670ea043k8c155195fe17c0a8@mail.gmail.com>
	<9255886c0601050404r2c09053bo42096794b31fee13@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9255886c0601050404r2c09053bo42096794b31fee13@mail.gmail.com>
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

Yes,

iptables -A INPUT -p 47 ... (or gre)
iptables -A INPUT -p 50 ...
iptables -A INPUT -p 51 ...

and none of these received any package. I'm afraid this is a
proprietary vpn, at least the client is.

Thanks

On 1/5/06, Sp0oKeR <spooker@gmail.com> wrote:
>  Did you allow gre protocol ?
>  Some rule like:
>
>  iptables-I INPUT -p gre ......
>
>
> Regards,
>
>
> On 1/5/06, Eduardo Ukstin <ukstin@gmail.com> wrote:
> > I've created some rules to see what the vpn client is trying to do,
> > and saw some interesting things.
> >
> > In the negociation the client goes throw the vpn server (outside my
> > lan) and everything works, but after this, it tries to ping a
> > 192.43... ip, my firewall doesn't rotate this, and of course this ping
> > requisition cannot goes through. But I'm a little confused about what
> > to do, create a route for this 192 or make a prerouting rule, in any
> > of this cases I'm not certain of what I need to do.
> >
> > My internal network has ip 10.....
> >
> > On 1/4/06, P. Harlow <wolf-r1@wispertel.net> wrote:
> > > It depends on the type of VPN you are using.
> > >
> > > IPSec based VPNs typically use:
> > >
> > > UDP 500 - IPSec negotiation
> > > IP 51 - Authentication Header (AH) for IPSec negotiation
> > > IP 50 - IPSec data
> > >
> > > PPTP based VPNs typically use:
> > >
> > > IP 47 - General Routing Encapsulation (GRE)PPTP data channel
> > > TCP 1723 - PPTP control channel
> > >
> > > You are going to want to figure out which type of VPN you are using a=
nd
> > > allow for those ports. I would assume that since you're getting
> > > authentication requests with port 500 open however your TCP 500 cause=
s me to
> > > wonder what type of VPN you have.
> > >
> >
> >
>
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Rodrigo Ribeiro Montoro
> Desenvolvedor BRMAlinux
>  spooker@brc.com.br
>       RHCE/LPIC-I
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>


--
Eduardo Ukstin
GNU/Linux User #328388

