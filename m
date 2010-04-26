From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Blocking all APNIC addresses vs. per-country list
Date: Mon, 26 Apr 2010 18:10:17 +0300
Message-ID: <1272294617.3750.35.camel@casper.meteor.dp.ua>
References: <0414A4FA-32F4-4D94-92E0-FC5CC9B4D646@zconsulting.net>
	 <q2m56378e321004260719i6685af2arc8faa644f555485b@mail.gmail.com>
	 <4BD5A487.3020407@plouf.fr.eu.org>  <4BD5A85C.1020703@ait.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BD5A85C.1020703@ait.ac.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: netfilter <netfilter@vger.kernel.org>

=F7 =F0=CE=C4, 26/04/2010 =D7 16:51 +0200, Roman Fiedler =D0=C9=DB=C5=D4=
:
> Hello list,
>=20
> Besides connection limits, shouldn't it be possible to place the vari=
ous
> subnet rules in a sort of balanced/optimized tree to decrease the acc=
ess
> time? Are there tools available for that, that use e.g. the DROP log
> entries from an unbalanced list to optimize the tree (like
> huffman-encoding for data streams)? Can ipset do that?

http://ipset.netfilter.org/features.html

I'm not familiar with huffman-encoding, but it seems ipset can store IP=
s
in hashes and trees (with timeout), but NETs are only possible in hash.

Not to say that there is an automatic tool for that, but you can make
any kind of tree with just iptables' user defined CHAINs. It could
probably be slow on insert/delete but definitelly fast on lookup.

If the performance is the point and hight number of rules is the need
one can also look at hipac, didn't tried it myself.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

