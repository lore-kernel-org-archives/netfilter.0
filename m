From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: bad tcp packets?
Date: Wed, 2 Feb 2005 08:56:25 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0502020852020.24248@blackhole.kfki.hu>
References: <41FE32D4.4000103@usna.edu>
	<1107193476.9909.4.camel@nostromo.bgsecm.com>
	<Pine.CYG.4.58.0502010731340.544@MI340a.chem.mathsci.usna.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
In-Reply-To: <Pine.CYG.4.58.0502010731340.544@MI340a.chem.mathsci.usna.edu>
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Kevin Van Workum <vanw@MI340a.chem.mathsci.usna.edu>
Cc: Jose Maria Lopez <jkerouac@bgsec.com>, "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Tue, 1 Feb 2005, Kevin Van Workum wrote:

> On Mon, 31 Jan 2005, Jose Maria Lopez wrote:
>
> > El lun, 31 de 01 de 2005 a las 14:29, Kevin Van Workum escribi=C3=B3:
> > > I'm learning about iptables and am working through the example script=
s
> > > in Oskar Andreasson's Iptables Tutorial 1.1.19. So I have the followi=
ng
> > > rules:
> > >
> > > iptables -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LO=
G
> > > --log-prefix "New not syn:"
> > > iptables -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DR=
OP
> > >
> > > My understanding of this rule is that all NEW tcp packets should by S=
YN
> > > also. So if they are not NEW and SYN, then we should log them and dro=
p
> > > them. I guess Andreasson wants to log them because they may indicate =
a
> > > problem of some sort. So in my log file, I get this:
> > >
> > > Jan 30 20:09:27 server kernel: New not syn:IN=3D OUT=3Dlo SRC=3D10.0.=
0.100
> > > DST=3D10.0.0.100 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D7678 D=
F PROTO=3DTCP
> > > SPT=3D34928 DPT=3D143 WINDOW=3D32767 RES=3D0x00 ACK PSH FIN URGP=3D0
> > >
> > > So what's the problem with these packets? It looks like some client i=
s
> > > contacting the imapd (which is running on my firewall) with some bad =
tcp
> > > packets?
> >
> > NEW without SYN packets can occur but they are very uncommon, the
> > rule proposed it's correct in the 99% of the systems, but if you
> > have a program or daemon that doesn't make the SYN/ACK-SYN/ACK
> > correctly then you maybe have to allow this packets.
>
> Is there a way to determine which program or daemon is producing these
> packets?

Any program or daemon may do, considering the following scenario: there
are established connections going through your firewall and you remove
then load in again the ip_conntrack module.

But the packages above are more probably late FIN packets: the conection
was deleted from the conntrack table and then a delayed FIN packet
belonging to the deleted connection arrived.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

