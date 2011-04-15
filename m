From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Ipset counters question
Date: Fri, 15 Apr 2011 14:53:05 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1104151442240.26797@blackhole.kfki.hu>
References: <4D91B511.3040005@univ-nantes.fr> <alpine.DEB.2.00.1103302215160.12949@blackhole.kfki.hu> <4D94224B.4050408@univ-nantes.fr> <alpine.DEB.2.00.1103312005580.16579@blackhole.kfki.hu> <4D94D06C.6070201@univ-nantes.fr> <alpine.DEB.2.00.1103312121170.16841@blackhole.kfki.hu>
 <4D94DC17.4040906@univ-nantes.fr> <4DA69F5F.3010004@univ-nantes.fr>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="110391808-17399485-1302871985=:26797"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DA69F5F.3010004@univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jean-Philippe Menil <jean-philippe.menil@univ-nantes.fr>
Cc: netfilter@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--110391808-17399485-1302871985=:26797
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hi,

On Thu, 14 Apr 2011, Jean-Philippe Menil wrote:

> Le 31/03/2011 21:55, Jean-Philippe Menil a =E9crit :
> >=20
> > That's what i tought, and i needed to be sure.
> >=20
> > As i can miss the counters for the moment, i will kept my rules.
> > But as i'm very intereted by ipset, i will think to do otherwise.
>=20
> I return to this story of counters.
> Since, i don't really need some counters, but just to know when there is =
no
> more traffic for a user to decrement an idle timeout;
> i decide to use ipset with the bitmap ip,mac and the timeout value.
>=20
> However, the timeout doesn't do really what i need, i use a dirty hack to=
 set
> the timeout counters every time a packet is matched;
> so when there are no more packet, the timeout value begin to decrement.
>=20
> I do this in the bitmap_ipmac_ttest function, i'm just wondering if it is=
 the
> right place to do this?

The proper way would be to reset the timeout value by the SET target,
which is not supported yet.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
--110391808-17399485-1302871985=:26797--
