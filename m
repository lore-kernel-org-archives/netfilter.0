From: "Ranjeet Shetye" <ranjeet.shetye@zultys.com>
Subject: RE: unknown arg --syn
Date: Thu, 2 Jan 2003 10:35:38 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005c01c2b28d$bf441c40$0100a8c0@zultys.com>
References: <011e01c2b24a$f7b2a800$13fcc5cb@Housecall>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <011e01c2b24a$f7b2a800$13fcc5cb@Housecall>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org


Don=92t use iptables 1.2.7. The NetFilter team released a 1.2.7a version
cos 1.2.7 introduced some serious bugs.

Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
771 Vaqueros Avenue
Sunnyvale  CA  94085
USA
Ranjeet.Shetye@Zultys.com
http://www.zultys.com/

=20


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org=20
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of hare ram
> Sent: Thursday, January 02, 2003 2:38 AM
> To: Keith Mastin; netfilter@lists.netfilter.org
> Subject: Re: unknown arg --syn
>=20
>=20
> Hi
>=20
> iam using redhat 8.0
> better u upgrate Iptables to 1.2.7
> its works fine
>=20
> hare
> ----- Original Message -----
> From: "Keith Mastin" <kmastin@beechtree.ca>
> To: <netfilter@lists.netfilter.org>
> Sent: Wednesday, January 01, 2003 5:07 AM
> Subject: unknown arg --syn
>=20
>=20
> > This should be so simple, yet it's eluding me... a simple iptables=20
> > script on a protected machine, with a few rules where the=20
> syn flag is=20
> > set returns an error:
> >
> > rule example (lives all on one line in script):
> >  iptables -A INPUT -p tcp -s 0/0 -d 192.168.0.167/32=20
> --destination-port 22
> >   --syn -j ACCEPT
> >
> > the error when the script is run:
> >  [root@spy root]# sh ./iptables-rules
> >  iptables v1.2.5: Unknown arg `--syn'
> >  Try `iptables -h' or 'iptables --help' for more information.
> >
> > sure enough, no mention of --syn in iptables -h
> >
> > from man iptables:
> >  [!] --syn
> >  Only match TCP packets with the SYN bit set and the ACK=20
> and FIN bits =20
> > cleared.  Such packets are used to  request  TCP  connection=20
> > initiation;  for  example,  blocking  such packets coming in an=20
> > interface will prevent  incoming TCP connections, but outgoing TCP=20
> > connections will be  unaffected.  It is equivalent to --tcp-flags=20
> > SYN,RST,ACK SYN. If the "!"  flag  precedes  the  "--syn",=20
> the sense=20
> > of the option is inverted.
> >
> > I also replaced --syn with --tcp-flags SYN,RST,ACK SYN,=20
> which resulted=20
> > in the error:  [root@spy root]# sh ./iptables-rules
> >  iptables v1.2.5: Unknown arg `--tcp-flags'
> >  Try `iptables -h' or 'iptables --help' for more information.
> >
> > I think I'm too close to see the solution, so if anybody can see it=20
> > right off, it would be much appreciated...
> >
> > System info:
> > Redhat 7.3
> > kernel-2.4.18-19.7.x.athlon
> >
> > Also tried on another system with similar results:
> > Redhat 7.3
> > kernel-2.4.18-3smp
> >
> > TIA
> >
> >
> >
> >
>=20
>=20


