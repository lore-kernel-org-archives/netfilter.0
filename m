From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: How exactly does RELATED work in Connection Tracking?
Date: 23 Oct 2002 15:26:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035379582.8853.69.camel@elendil>
References: <000801c2798e$a7dcfd70$09c809c0@PENT4>
	<1035325277.10494.18.camel@elendil>  <000b01c27aac$d6b2a270$09c809c0@PENT4>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000b01c27aac$d6b2a270$09c809c0@PENT4>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Matthew Donofrio <mdonof2@pride.hofstra.edu>
Cc: netfilter@lists.netfilter.org

Le mer 23/10/2002 =E0 17:57, Matthew Donofrio a =E9crit :
> The tuple is just the source address and destination address for a
> particular packet, correct?

No, because your box can have multiple different flows with the same
destination. A tuple as src address, dst address, layer 4 protocol and
layer 4 datas, such as src and dst ports for TCP or UDP.

> So is it safe to say that the  only fields that are compared for
> connection tracking are the source and destination addresses?

No it's not sufficient. you have to look at layer 4 datas.
=20
> So, if a packet comes in and the source and destination addresses
> match an entry in the conntrack state table, then we can say that
> it is part of some ESTABLISHED connection.

It is established if its tuple (as defined below) matches an entry in
the conntrack table, i.e. if it is the same than the tuples associated
to entries.

Good reading for you are :

http://www.gnumonks.org/presentations/netfilter-knf2002/netfilter-knf2002=
.pdf
http://www.gnumonks.org/presentations/netfilter-internals-lt2002/netfilte=
r-internals-lt2002.pdf

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

