From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: basic understanding of iptables - some questions
Date: Sat, 10 Dec 2016 09:11:39 -0600
Message-ID: <20161210151139.GT8339@harrier.slackbuilds.org>
References: <560733058.4361908.1479674705472.JavaMail.zimbra@helmholtz-muenchen.de>
 <a07f78ad-c0f7-21a4-890c-87b9b89269cb@plouf.fr.eu.org>
 <051c01d252c1$8612a3e0$9237eba0$@ngtech.co.il>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <051c01d252c1$8612a3e0$9237eba0$@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

[ top-posting fixed ]
> Pascal Hambourg:
> Le 20/11/2016 =E0 21:45, Lentes, Bernd a =E9crit :
> >
> > Chain ufw-user-input (1 references)
> >  pkts bytes target     prot opt in     out     source               des=
tination
> > 41587 1849K ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0=
.0.0/0            tcp dpt:22
> >     0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0=
.0.0/0            udp dpt:22
>=20
> Silly. SSH does not use UDP.

On Sat, Dec 10, 2016 at 10:43:47AM +0200, Eliezer Croitoru wrote:
> It's not silly that ssh uses UDP since there are implementations of=20
> SSH which utilizes UDP....

This post made me curious.  Clearly in the case of the OP, Pascal is=20
correct; we can see the counters on the udp/22 rule above.

I did a bit of searching and the only "ssh using udp" implementation=20
found was Mosh, <https://mosh.org/>, but Mosh !=3D ssh.

Of what ssh implementation do you speak?  More to the point of this=20
thread, is it using udp/22?  Is it available for GNU/Linux?
--=20
  http://rob0.nodns4.us/
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
