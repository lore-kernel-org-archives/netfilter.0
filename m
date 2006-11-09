From: Alan Ezust <alan.ezust@presinet.com>
Subject: Re: conntrack -E -i not allowed?
Date: Thu, 9 Nov 2006 12:54:53 -0800
Message-ID: <200611091254.57043.alan.ezust@presinet.com>
References: <200611011043.53370.alan.ezust@presinet.com>
	<200611090852.14878.alan.ezust@presinet.com>
	<455360ED.2030809@netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2903850.kOxvMZBrYQ";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <455360ED.2030809@netfilter.org>
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
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@lists.netfilter.org

--nextPart2903850.kOxvMZBrYQ
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Yes, I'm using svn checked out versions of your libnfnetlink and=20
libnetfilter_conntrack, so let me know when you check in your changes and=20
I'll update. Thanks ! --alan



On Thursday 09 November 2006 09:10, Pablo Neira Ayuso wrote:
> Alan Ezust wrote:
> > Thanks for the reply. Ok, I can see how I can generate some IDs, but I
> > first want to make sure i have all of the information I need.
> >
> > When I run conntrack, I only see one protocol number. I think it is a
> > layer4 protocol (tcp vs udp). If I'm not seeing an l3proto in my output,
> > why might that be?
> >
> > udp      17 12 src=3D10.10.201.2 dst=3D204.174.64.1 sport=3D54475 dport=
=3D53
> > src=3D204.174.64.1 dst=3D209.53.156.2 sport=3D53 dport=3D54475 use=3D1 =
mark=3D0
> > tcp      6 420332 ESTABLISHED src=3D10.10.100.3 dst=3D10.10.1.22 sport=
=3D1356
> > dport=3D5432 src=3D10.10.1.22 dst=3D10.10.100.3 sport=3D5432 dport=3D13=
56 [ASSURED]
> > use=3D1 mark=3D0
>
> Are you using nf_conntrack? If so, l3protonum is not shown yet but it
> would not be hard to cook a patch to show it. I'll introduce this change
> in the new libnetfilter_conntrack API.

=2D-=20
Alan Ezust            www.presinet.com
Presinet, inc         alan.ezust@presinet.com
           Victoria, BC,Canada

--nextPart2903850.kOxvMZBrYQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFU5WhsJbtw6GURksRAsISAKCk91qu1F1N7wdvdSM1CqZm+1gQRwCgjzoA
jvc8fl6c3sbZOs+0oo6NMLE=
=GuWm
-----END PGP SIGNATURE-----

--nextPart2903850.kOxvMZBrYQ--

