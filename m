From: Andreas Kretschmer <andreas_kretschmer@despammed.com>
Subject: Re: [despammed] related to -z option
Date: Wed, 10 Mar 2004 20:00:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040310190020.GA6826@kaufbach.delug.de>
References: <BAY12-F12shalxyPyF10000278a@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BAY12-F12shalxyPyF10000278a@hotmail.com>
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
To: netfilter@lists.netfilter.org

am  Wed, dem 10.03.2004, um 11:47:09 +0000 mailte rohit persaie folgendes:
> Dear All,
>=20
> There is one option in iptables .....-Z , used for  the  packet  and byte=
=20
> counters in all the chains.
>=20
> Please tell me the use of this option, with example.

Please read the man-page:

 -Z, --zero [chain]
       Zero the packet and byte counters in all chains.  It  is  legal  to
       specify  the  -L, --list (list) option as well, to see the counters
       immediately before they are cleared. (See above.)


You can use iptable to count traffic, and you can reset the counters.


Andreas
--=20
Diese Message wurde erstellt mit freundlicher Unterst=FCtzung eines freilau-
fenden Pinguins aus artgerechter Freilandhaltung.   Er ist garantiert frei
von Micro$oft'schen Viren. (#97922 http://counter.li.org)     GPG 7F4584DA
Was, Sie wissen nicht, wo Kaufbach ist? Hier: N 51.05082=B0, E 13.56889=B0 =
;-)

