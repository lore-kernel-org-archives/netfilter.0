From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: unexpected behaviour...?
Date: Thu, 28 Aug 2003 09:29:54 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0308280915190.12704@simba.math.ucla.edu>
References: <20030828113329.32071.qmail@web21404.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030828113329.32071.qmail@web21404.mail.yahoo.com>
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
To: =?iso-8859-1?q?Christof=20Nyffenegger?= <cnyf@yahoo.de>
Cc: netfilter@lists.netfilter.org

On Thu, 28 Aug 2003, Christof Nyffenegger wrote:
> The clients are win 2k and Linux, the servers are running Linux (SuSE 8.2,
> Knoppix) and solaris 8.

(jimc's summary: with a hot failover gateway that shouldn't be passing
random packets, a SSH and a HTTP connection are made, and then the gateway
is exchanged.  The replacement shows an established through-going TCP
connection for SSH, which works as if nothing bad happened, but the HTTP
connection freezes.)

Here at UCLA we had a nasty behavior: another site has a preferred MX and a
failover MX; they panicked over MSBlaster (I'm guessing) and blocked port
25 on the preferred MX.  Sendmail on our Solaris machines considered this a
temporary error, and did not try the failover MX, whereas on Linux,
sendmail did fail over.  It was almost the identical version, just
different OS's and different TCP stacks.

If you could try both ssh and http to the Linux boxes, and both to the
Solaris boxes, and both to the Windows boxes (not that you'd want to :-)
but you could test client-side issues), I'll bet the behavior goes with the
OS, not the port.  Obviously you've tested with both Windows and Linux
clients, so on this hypothesis the server's OS determines what happens.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA  90095-1555
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for PGP key)

