From: "John G. Norman" <john.g.norman@gmail.com>
Subject: Re: On vanilla Fedora 3, can't do a transparent proxy (-j REDIRECT)
Date: Mon, 2 May 2005 15:04:20 -0400
Message-ID: <df31c404050502120435134f8@mail.gmail.com>
References: <df31c4040505021142197fdcdc@mail.gmail.com>
	<20050502185147.GA12120@bender.817west.com>
Reply-To: john@7fff.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050502185147.GA12120@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

Thanks, Jason. Here's netstat.

[root@preview mysql-standard-4.1.11-pc-linux-gnu-i686]# netstat -lnt
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address               Foreign Address            =
 Stat
e
tcp        0      0 0.0.0.0:32768               0.0.0.0:*                  =
 LIST
EN
tcp        0      0 0.0.0.0:111                 0.0.0.0:*                  =
 LIST
EN
tcp        0      0 127.0.0.1:631               0.0.0.0:*                  =
 LIST
EN
tcp        0      0 127.0.0.1:5335              0.0.0.0:*                  =
 LIST
EN
tcp        0      0 127.0.0.1:25                0.0.0.0:*                  =
 LIST
EN
tcp        0      0 ::ffff:127.0.0.1:8005       :::*                       =
 LIST
EN
tcp        0      0 :::8080                     :::*                       =
 LIST
EN
tcp        0      0 :::22                       :::*                       =
 LIST
EN

On 5/2/05, Jason Opperisano <opie@817west.com> wrote:
> On Mon, May 02, 2005 at 02:42:55PM -0400, John G. Norman wrote:
> > Hi. I've been reading through the FAQ and some of the recent list
> > history, and haven't found much guidance on the problem below.
> >
> > I am trying to do a transparent proxy from port 80 to port 8080. I've
> > had no problem doing this on a recent release of SuSE (iptables
> > 1.2.9), but something's not working on Fedora 3.
> >
> > The version of iptables on this release of Fedora is 1.2.11
> >
> > /proc/sys/net/ipv4/ip_forward shows: 1
> >
> > (any other settings in /proc/sys/net/ipv4 that could affect this?)
> >
> > I've tried it two ways, which I think should be equivalent (the
> > system's IP is 192.168.10.101):
> >
> > /sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
> > REDIRECT --to-port 8080
> >
> > /sbin/iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to 192.=
16
> > 8.10.101:8080
> >
> > Port 8080 is definitely open, and I can browse to that port with no
> > problems. For 80, I get connection refused.
> >
> > My filter table is wide open; nothing in mangle, and I show below
> > what's in nat to show that the setting is at least there. Also below I
> > show the nat table when I use -j REDIRECT.
> >
> > Any ideas? I'm completely stumped.
> >
> > John
>=20
> what's the output of:  netstat -lnt
>=20
> -j
>=20
> --
> "Brian: You got anything on that remote lower than Mute?"
>         --Family Guy
>=20
>

