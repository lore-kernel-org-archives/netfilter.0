From: "Michael H. Warfield" <mhw@wittsend.com>
Subject: Re: T-Pot (TCP HoneyPot) idea
Date: Thu, 10 Apr 2003 18:36:10 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030410223610.GB26575@alcove.wittsend.com>
References: <20030410220741.GA32442@m1800>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030410220741.GA32442@m1800>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: waltdnes@waltdnes.org
Cc: Netfilter list <netfilter@lists.netfilter.org>


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2003 at 06:07:41PM -0400, waltdnes@waltdnes.org wrote:
>   I'm sure every here has seens lots of SYN-packets in their logs,
> trying to connect to various ports they shouldn't be talking to.  I
> don't run any public servers, and I use passive ftp, so I simply block
> all connection attempts.  The general procedure is to drop the packet,
> and ignore it.  What would be the effect of sending back a SYN-ACK
> packet (and anything else necessary?) to fake the setting up of a
> connection... and then dropping the packet and ignoring it ?

	Please check freshmeat for the following references:

	honeyd
	labrea
	arpd
	portsentry
	deception toolkit

	I think you will find more than you ever imagined.

>   Would an infected machine scanning the net eventually run into
> resource limits and DOS itself ?  I'm sure that professional crackers
> can work around this, but if we can make things a bit more painful for
> skiddies and automatic worms, then let's do it.

>   Can such trickery be pulled off with a current bog-standard iptables,
> or does someone need to write a new "target"?

	Use a user space bodger.  You can do much more amusing things
that way.  Honeyd can even fool nmap thinking it different operating
systems.

> --=20
> Walter Dnes <waltdnes@waltdnes.org>
> An infinite number of monkeys pounding away on keyboards will
> eventually produce a report showing that Windows is more secure,
> and has a lower TCO, than linux.

	Mike
--=20
 Michael H. Warfield    |  (770) 985-6132   |  mhw@WittsEnd.com
  /\/\|=3Dmhw=3D|\/\/       |  (678) 463-0932   |  http://www.wittsend.com/=
mhw/
  NIC whois:  MHW9      |  An optimist believes we live in the best of all
 PGP Key: 0xDF1DD471    |  possible worlds.  A pessimist is sure of it!

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iQCVAwUBPpXx2uHJS0bfHdRxAQGfNQP/T5JAyjEx0W2isoNMn+RuiyEk/lnRUirc
yuQlPCGCs/6imJnNhAhIhLbipFC1ZEuTmf669QI5fQ+UXgohIlvPcPaRzRJ0g+zT
v5ioscLcyc/WCUvoWd5mym4ChWx/ugFhZ6kd2rbeDartH1i3n2ofsvrt/2lnsLlC
bWlrRhJ9xvk=
=CV0p
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--

