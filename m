From: "curby ." <curby.public@gmail.com>
Subject: Re: ESTABILISHED connections are not that estabilished
Date: Wed, 27 Jul 2005 22:57:05 -0600
Message-ID: <5d2f379105072721577a47da27@mail.gmail.com>
References: <dc8blc$p5s$1@sea.gmane.org> <dc8l5h$qf8$1@sea.gmane.org>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <dc8l5h$qf8$1@sea.gmane.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Gioele Barabucci <dev@gioelebarabucci.com>
Cc: netfilter@lists.netfilter.org

Since no one replied yet, I'll try a few stabs at debugging.

DNS by default uses UDP for most things, so your DNS servers might
simply be rejecting TCP requests.  That said, why are they even
getting to the server and being refused there if the firewall is
dropping the packets?

You might try starting with a very simple ruleset and see if you can
pinpoint where the problem occurs, especially if this is a personal
computer and not a large installation.  For example, just allow DNS in
a stateless fashion, then introduce stateful rules.  Keep track of
packet counters in iptables as you test to see which rules fire.=20
Hopefully this helps, though I'm being rather vague because I don't
know too many details and am rather new myself.

