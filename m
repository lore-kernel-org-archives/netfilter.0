From: "Cedric Blancher" <blancher@cartel-securite.fr>
Subject: Re: De-SNAT-ing and DNAT
Date: Tue, 25 Feb 2003 20:03:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003a01c2dd00$9750d230$0e0aa8c0@Nussele>
References: <200302251659.h1PGxO005284@ithaca.mcs.le.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-Printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: "J. A. Landamore" <jal@mcs.le.ac.uk>, netfilter@lists.netfilter.org

----- Original Message -----
From: "J. A. Landamore" <jal@mcs.le.ac.uk>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, February 25, 2003 5:59 PM
Subject: De-SNAT-ing and DNAT


> I have a lan of machines on a 192.168. network with an iptables box to =
the
real
> world.  If I apply SNAT I can map all the internal addresses to the one
real
> world facing assigned address.  I assume that when packets come back th=
ey
are
> "de-SNAT"ed before passing back onto the private lan, and that this
happens in
> the "PREROUTING" path.

You're right.

> My question is, does the "de-SNAT" happen before or
> after the "PREROUTING" DNAT?

As far as I understand NAT stuff, it happens far before, handled by
conntrack which has precedence over any table.

Moreover, only packets with state NEW are going through nat table and its
chains. Further packets will be handled transparently by conntrack and wi=
ll
not cross nat table. That means if you have a PREROUTING DNAT, it will no=
t
interfere with your SNAT stuff.

> Why, because I need to make a DNAT decision based on the original _sour=
ce_
> address, i.e. which machine originally sourced the packet.

I do not understand what you mean. De-SNAT stuff (which is an "automatic"
DNAT) sends packets to original source address without doing anything els=
e.
Are you trying to set something more tricky up ?

--
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE



