From: Oskar Andreasson <oan@frozentux.net>
Subject: Re: HELP!!! (ip_conntrack: table full)
Date: Mon, 27 Oct 2003 21:09:10 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0310272108130.26196@oskar-lap.agatha>
References: <web-171329066@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-171329066@mail01.infosat.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Warren P <warrenp@websurfer.co.za>
Cc: security@ezsm.net, Alpha Technologies <alphaside@yahoo.com>, netfilter@lists.netfilter.org

On Mon, 27 Oct 2003, Warren P wrote:

> hi
>
> WRT echo ## > /proc/net/ip_conntrack
>
> Considering i've got 1gig of RAM ... what is a safe value i
> can set ip_conntrack_max to? The current value is 65528

No problem, I've run as high as 140000 without a hitch on 512 meg, without
too much performance loss.

>
> Also when you refer to dropping ip_conntrack ... do mean
> like rmmod ip_conntrack.o?
>

Yes.

> Regards,
> Warren P
>
> -----------------------------------------------------------
>
>
> On Fri, 19 Sep 2003 11:11:53 -0400
>  Security <security@ezsm.net> wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > First...here is what is happening:
> >
> > Your max setting on the conntrack table can be seen at:
> > cat /proc/sys/net/ipv4/ip_conntrack_max
> >
> > Your current number of entries in the conntrack table can
> > be found like this:
> > cat /proc/net/ip_conntrack | wc -l
> >
> > Now, you have 2 choices on how to sort this out...
> >
> > 1) raise the limit in /proc/net/ip_conntrack
> > To raise that limit:
> > echo ## > /proc/net/ip_conntrack
> > (where ## is the new max you wish to set).
> >
> > or
> > 2) flush the conntrack table
> > (for that.I am going to paste in from an earlier post to
> > this list)
> >
> > Just simply remove the mod ip_conntrac and any dependices
> > and re-apply it.
> >
> > **Warning** this will require you to drop iptables while
> > you do it...which may
> > not be a good option depening on your network
> > configuration. **/Warning**
> >
> > NH
> >
> > On Thursday 11 September 2003 4:19 pm, Warren P wrote:
> > > hi
> > >
> > > does anyone know how to clear/flush the ip_conntrack
> > table. Every 4 to 6
> > > months i need to reboot my server because it drops
> > packets and complains
> > > that the table is full ...
> > >
> > > Regards,
> > > Warren P
> >
> >
> >
> > On Friday 19 September 2003 10:43 am, Alpha Technologies
> > wrote:
> > > Recently I am having this messages on my system:
> > "ip_conntrack: table
> > > full". Please i need help. what is happening?
> > >
> > > This is my info:
> > >
> > > RedHat 9.0
> > > Kernel: 2.4.20-18.9
> > >
> > >
> > > I really apreciate any help.
> > >
> > > Thanks
> > >
> > > Pablo Tamayo
> > >
> > >
> > >
> > >
> > >
> > > ---------------------------------
> > > Do You Yahoo!?
> > > Todo lo que quieres saber de Estados Unidos, Am=E9rica
> > Latina y el resto del
> > > Mundo. Vis=EDta Yahoo! Noticias.
> > -----BEGIN PGP SIGNATURE-----
> > Version: GnuPG v1.2.1 (GNU/Linux)
> >
> >
> iD8DBQE/axy6PEfiOMhBaIMRAq2CAKCaZ94odX9aX3KaPhqF6pL340poRACffclm
> > ySIf03dKHYvJy46KGQpM5M0=3D
> > =3DcBZI
> > -----END PGP SIGNATURE-----
> >
>
>
>
>

----
Oskar Andreasson
http://www.frozentux.net
http://iptables-tutorial.frozentux.net
http://ipsysctl-tutorial.frozentux.net
mailto:blueflux@koffein.net

