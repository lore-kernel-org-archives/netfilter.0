From: "Gaby Schilders" <G.Schilders@ibfd.org>
Subject: RE: DNAT + 2 uplinks + route = nogo
Date: Thu, 16 Oct 2003 07:50:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DAAAFFB7B8C62F40BC87BF3E729F79E10119907C@ibfdmail.ibfd.oin>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Alistair@nerdnet.ca
Cc: netfilter list <netfilter@lists.netfilter.org>

Not off the wall at all. This is a solution that has been suggested by =
more people and is documented on the internet. We are talking about more =
than a handfull of systems with more than one operating system so I =
rather do everything on the firewall if at all possible. It seems now =
that there is a solution that may work and I'm trying it in the next =
hour or so.

Thanks for the suggestion though.

Gaby Schilders
IBFD network admin

-----Original Message-----
From: Alistair Tonner [mailto:Alistair@nerdnet.ca]
Sent: donderdag 16 oktober 2003 1:08
To: Gaby Schilders; netfilter list
Cc: George Vieira
Subject: Re: DNAT + 2 uplinks + route =3D nogo



	Can I make one other (possibly stupid) suggestion?

	if I understand correctly ...=20
=09
	Can you perhaps have TWO ip addresses on the destination systems?
	alias the one on top of the other?
	Then DNAT from inbound interface A to target ip A=20
	         DNAT from inbound interface B to tartget ip B
	and the unDNAT would handle more accurately?

	(or am I utterly off the wall here) and the reply from the target =
system  to=20
the firewall would not nessesarily come BACK from the ip it was sent to?


On October 15, 2003 08:23 am, Gaby Schilders wrote:
> idea. I will check if this works. Is the conmark retained on all =
packets
> associated with the connection?

--=20

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
=09
     Any sufficiently advanced technology will have the appearance of =
magic.
	Lets get magical!

