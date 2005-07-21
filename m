From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: is this the zillionth mail asking for this detail?
Date: Thu, 21 Jul 2005 10:06:26 -0400
Message-ID: <65aa6af905072107063ebab0bc@mail.gmail.com>
References: <65aa6af905072021501603cfd5@mail.gmail.com>
	<42DF85AE.1000400@gmx.co.uk>
	<Pine.LNX.4.58.0507211511240.27131@blackhole.kfki.hu>
	<Pine.LNX.4.61.0507211521120.17188@yvahk01.tjqt.qr>
	<Pine.LNX.4.58.0507211523100.27131@blackhole.kfki.hu>
Reply-To: Edmundo Carmona <eantoranz@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0507211523100.27131@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

I'm jumping on one leg! Forgive me if I don't sound serious right now.

Yeah... no service on the firewall, right? :-) That's absolutely not
the case of this particular firewall. Not like I have a networking lab
in the firewall... but there's squid and VPN (at least).

I want to make sure I got it right:

Suppose I have three internet connections.

I will load-balance two of them and leave one out just for VPN
connections and other services. According to what you are saying, I
could mark the packets in mangle-output that come from the VPN service
and then force them to go out with a rule that uses that firewall
mark.... right?

Thank you very much for your feedback!

Note:
It's not like I'm freaky and I just want to load balance two of them
leaving one out. I COUDLN'T get to load balance all three. After some
experimentation I noticed that two of the interfaces didn't get along
very well to make a multipath routing. I think it's because they're
both on the same network. Maybe you know of some multipath guru that
could help me with this so I can load-balance all of them.



On 7/21/05, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:
> On Thu, 21 Jul 2005, Jan Engelhardt wrote:
>=20
> > >local process -> routing -> OUTPUT chain -> routing -> POSTROUTING cha=
in
> > >
> > >No problem with policy routing for the locally generated traffic.
> >
> > This sounds like a total overhead calculating the route twice.
>=20
> The first one is required to fill out output device for the packet. The
> second one is there to give chance to play with routing in OUTPUT.
>=20
> This is traffic, generated locally, on the firewall.
> You should run nothing on your firewall ;-)
>=20
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary
>=20
>

