From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Fwd: IPTables and different types of NAT
Date: Thu, 08 Feb 2007 10:05:42 -0500
Message-ID: <1170947142.7172.6.camel@localhost>
References: <45C9F509.8010309@gmail.com>
	<45C9FBFB.9090607@riverviewtech.net>	 <45CA160E.90102@plouf.fr.eu.org>
	<45CA2201.7040205@riverviewtech.net>  <45CB381C.3030301@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45CB381C.3030301@gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Pedro =?ISO-8859-1?Q?Gon=E7alves?= <pedro.pandre@gmail.com>
Cc: netfilter@lists.netfilter.org

When we started automating the creation of NAT rules in the ISCS open
source network security management framework
(http://iscs.sourceforge.net), we were quickly amazed at how complicated
it is once one steps away from the most basic forms.

Ultimately, we did automate the creation of SNAT, DNAT and NETMAP rules
for one-to-one, many-to-one, one-to-many, some-to-many, many-to-some,
overlapping and nested NAT using something we called the "sliding
marble" algorithm.

We did separate access control from NAT so that we could preserve the
highly granular and modular access control rules created by ISCS and
simply integrate it with NAT.  It was a daunting task that set us back
three months but it all works.

The algorithms and logic are all in the development docs in the ISCS CVS
or, if you just want the end result, that part of ISCS is fully
functional and ready for at least beta use.

So, yes, we have done some very complicated NAT setups but have also
separated access control from NAT - John

On Thu, 2007-02-08 at 14:47 +0000, Pedro Gon=C3=A7alves wrote:
> I still don't have a clear answer whether it is possible or not to=20
> implement all types of NAT.
>=20
> So, has anyone implemented *any* kind of NAT?
> If so, how have you done?
>=20
> Best Regards
> Pedro
>=20
>=20
> ---------- Forwarded message ----------
> From: *Grant Taylor* <gtaylor@riverviewtech.net=20
> <mailto:gtaylor@riverviewtech.net>>
> Date: Feb 7, 2007 7:01 PM
> Subject: Re: IPTables and different types of NAT
> To: Mail List - Netfilter <netfilter@lists.netfilter.org=20
> <mailto:netfilter@lists.netfilter.org>>
>=20
> Pascal Hambourg wrote:
>  > No. Please read more carefully the definitions of "restricted cone NAT=
"
>  > and "port restricted cone NAT". Neither can be implemented with iptabl=
es
>  > because they do not fit in the per-connection model.
>=20
> """With restricted cone NAT, all requests from the same internal IP
> address and port are mapped to the same external IP address and port.
> Unlike a full cone NAT, an external host can send a packet to the
> internal host only if the internal host had previously sent a packet to
> it."""
>=20
> """Port restricted cone NAT or symmetric NAT is like a restricted cone
> NAT, but the restriction includes port numbers. Specifically, an
> external host can send a packet to a particular port on the internal
> host only if the internal host had previously sent a packet from that
> port to the external host."""
>=20
> The only other thing that comes to mind is that IPTables by its self
> does not by default filter based on connection(s) and / or state.
> However, there are match extensions that can be used to augment a basic
> IPTables rule to do just that.  I.e.  CONNMARK in conjunction with MARK.
>=20
>  > "Symmetric NAT" works on a per-connection basis and is the NAT form th=
at
>  > is the easiest to implement with iptables using SNAT or MASQUERADE.
>=20
> I understood Symetric NAT to be a form of "one to many" or "many to
> many" NATing.  The key part being the "... to many" in where multiple
> external IPs would be used.  I know that it is possible (though I have
> not done it) to specify a range to SNAT traffic with IPTables to a range
> of IP addresses.  I was not aware that MASQUERADE would do the same
> thing.  I was under the impression that MASQUERADE used the single IP on
> an interface as the IP to SNAT traffic to.
>=20
>=20
>=20
> Grant. . . .
>=20

--=20
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


