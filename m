From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: confusing explanation regarding negation of protocol filtering
Date: Wed, 9 Oct 2002 06:21:55 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210090616270.13444-100000@localhost.localdomain>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@lists.netfilter.org>


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
 
  so it's a but puzzling that andreasson's tutorial claims that
"--protocol ! tcp would mean to match the ICMP and UDP protocols."
really?  i would have assumed it would have matched *every* other
protocol but TCP.

  am i misunderstanding the function of the "!" with respect to 
protocol?

rday


