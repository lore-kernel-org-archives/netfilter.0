From: "Ferry van Steen" <ferry.van.steen@InfoPart.nl>
Subject: RE: confusing explanation regarding negation of protocol filtering
Date: Wed, 9 Oct 2002 13:38:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D502122A1694B04EAE0F53D53CC2F764017578@exch2k-01.infopart.nl>
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
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: netfilter@lists.netfilter.org

You are right, -p !tcp matches all but TCP, please note tho' that most
users probably NEVER use these and as such it's hardly worth mentioning
them. ! means not, not tcp is well, not tcp :-) Docs are to be taken
with a grain of salt...=20

In addition to this, I read a book on C++ a little while. They are
purists :-) (the writers that is). They wrote something along the lines
of pure_sort() sorts in non-decreasing order, we say non-decreasing
instead of increasing because there might be duplicates (thus variables
have the same value, technically that's not increasing but it's kinda
obvious ain't it? :-))


-----Oorspronkelijk bericht-----
Van: Robert P. J. Day [mailto:rpjday@mindspring.com]=20
Verzonden: woensdag 9 oktober 2002 12:22
Aan: netfilter mailing list
Onderwerp: confusing explanation regarding negation of protocol
filtering


  (sorry if these are painfully trivial questions, but sometimes the
docs just don't seem to be consistent.)

  based on both the man page and andreasson's tutorial, i can filter
on protocol with some variation of

	-p tcp
	-p udp
	-p udp,icmp
	-p ! tcp
	-p <some protocol number here>

and so on.  while the common filtering protocols are of course
tcp, udp and icmp, there are far more listed in /etc/protocols
that can be selected by name or number.
=20
  so it's a but puzzling that andreasson's tutorial claims that
"--protocol ! tcp would mean to match the ICMP and UDP protocols."
really?  i would have assumed it would have matched *every* other
protocol but TCP.

  am i misunderstanding the function of the "!" with respect to=20
protocol?

rday




