From: Stratos Margaritis <stratism@gmail.com>
Subject: Re: Why is this not working???
Date: Thu, 27 Apr 2006 10:13:15 +0300
Message-ID: <200604271013.18777.stratism@gmail.com>
References: <200604251615.03991.stratism@gmail.com>
	<20060426125726.GI5568@orbitor.ops.internal.tucows.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1713407.3p72PSL0Sz";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060426125726.GI5568@orbitor.ops.internal.tucows.com>
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
To: netfilter@lists.netfilter.org

--nextPart1713407.3p72PSL0Sz
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Well I am trying to forward packets from the outside world to some machines=
=20
inside. All machines have real IP's and when I use:
=2DA FORWARD -j ACCEPT
everything works fine. But what I want to do is to also filter packets as w=
ell=20
as who has access to my internal machines.

On Wed 26 Apr 2006 15:57, Aj Mirani wrote:
> Why not put something like this into your INPUT chain:
>
> -A INPUT -p tcp -m tcp --dport 22 -s xxx.xxx.xxx.xxx/28 -d yyy.yyy.yyy.yyy
> -j ACCEPT
>
> Also for your line:
> -A INPUT -p tcp --syn -m limit --limit 5/s -i eth0 -j ACCEPT
>
> This is a server wide limit not a per host limit which depending on what
> you're trying to prevent may not be the best way to do it.
>
> If you are trying to prevent a syn attack but still want the server to
> respond to legitimate requests try something like this:
> -A INPUT -p tcp -m tcp --tcp-flags SYN,RST,ACK SYN -m recent --set --name
> SYNATTACK --rsource -A INPUT -p tcp -m tcp --tcp-flags SYN,RST,ACK SYN -m
> recent --update --seconds 20 --hitcount 10 --name SYNATTACK --rsource -j
> DROP -A INPUT -p tcp -m tcp --tcp-flags SYN,RST,ACK SYN -j ACCEPT
>
> This dynamically put hosts on a 'blacklist' who are trying to connect
> too fast (more that 10 times in a 20 second period.)  with the use of
> --update it will keep them blacklisted as long as they continue to send
> packets too fast.
>
> On Tue, Apr 25, 2006 at 04:14:59PM +0300, Stratos Margaritis wrote:
> > Can someone help me find out why is this rule does not work?
> >
> > *filter
> >
> > :INPUT DROP [1803:271102]
> > :FORWARD DROP [0:0]
> > :OUTPUT DROP [0:0]
> >
> > -A INPUT -i lo -j ACCEPT
> > -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> > -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
> > -A INPUT -p tcp -m tcp --dport 25 -j ACCEPT
> > -A INPUT -p tcp -m tcp --dport 53 -j ACCEPT
> > -A INPUT -p udp -m udp --dport 53 -j ACCEPT
> > -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
> > -A INPUT -p icmp -j ACCEPT
> > -A INPUT -p tcp -j REJECT --reject-with tcp-reset
> > -A INPUT -p tcp --syn -m limit --limit 5/s -i eth0 -j ACCEPT
> > -A FORWARD -p tcp -i eth0 -s xxx.xxx.xxx.xxx/28 -o eth1 -d
> > yyy.yyy.yyy.yyy -j ACCEPT
> > -A FORWARD -j LOG
> >
> > Where xxx.xxx.xxx.xxx is a real network that should be allowed to conta=
ct
> > the server yyy.yyy.yyy.yyy both of which are having real IP's.
> >
> >
> > --
> > Stratos
> > stratism@gmail.com

=2D-=20
Stratos
stratism@gmail.com

--nextPart1713407.3p72PSL0Sz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBEUG8O8GO3ry/weE4RAuzjAJ9Ll0IrmF1qX0lrJ8qSDK5TyqOFGwCghFNG
I1zUINAs54yIquKGfBHSw/I=
=BN4T
-----END PGP SIGNATURE-----

--nextPart1713407.3p72PSL0Sz--

