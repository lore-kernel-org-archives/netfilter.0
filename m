From: "Adam D. Barratt" <netfilter.list@adam-barratt.org.uk>
Subject: Re: Rules for blocking Email from libero.it domain
Date: Tue, 29 Oct 2002 10:40:41 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0a9501c27f37$a0cf6370$eb00010a@andromeda>
References: <200210281507.g9SF70e08704@vulcan.rissington.net> <42647.192.168.7.14.1035847030.squirrel@iw.k1k2.com> <20021029085004.FRPW1554.mta07-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Antony Stone wrote Tuesday, October 29, 2002 8:50 AM

> The latter is correct.   Before an email is transmitted, the sender tells
the
> receiver what size it is so that the receiver can decide whether it has
space
> to accept it.

In most cases, no such decision takes place. Specifically, there are very
few servers (IME) that actually implement the SIZE extension, as defined in
RFC1870.

Note that RFC2821 discourages decisions based on message size:

"Since the introduction of Internet standards for multimedia mail [12],
message lengths on the Internet have grown dramatically, and message size
restrictions should be avoided if at all possible.  SMTP server systems that
must impose restrictions SHOULD implement the "SIZE" service extension [18],
and SMTP client systems that will send large messages SHOULD utilize it when
possible."

Adam


