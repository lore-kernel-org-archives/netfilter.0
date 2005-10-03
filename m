From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Aren't these connections ESTABILISHED? (2nd take)
Date: Mon, 3 Oct 2005 13:44:37 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510031236250.22605@filer.marasystems.com>
References: <dhmn38$hsk$1@sea.gmane.org> <200510011907.27026.rob0@gmx.co.uk>
	<Pine.LNX.4.61.0510020410200.21519@filer.marasystems.com>
	<200510021416.39103.rob0@gmx.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510021416.39103.rob0@gmx.co.uk>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

On Sun, 2 Oct 2005, /dev/rob0 wrote:

> I know 2 things: RTFM and experience. From The Fine Manual: " ...
> RELATED meaning that the packet is starting a new connection, but is
> associated with an existing connection, such as an FTP data transfer,
> or an ICMP error."
>
> How is this association known to conntrack?

By a application protocol helper module registering an expectation of a 
related connection.

The manual is actually slightly incorrect. ICMP errors normally gets 
sorted as ESTABLISHED, not RELATED.

> Experience tells me that my little ssh attack blocking ploy using -m
> limit did not work if a --state RELATED,ESTABLISHED -j ACCEPT rule
> preceded it, but it did/does work if the rule matches only --state
> ESTABLISHED.

This is very odd and should not happen. SSH connections can by definition 
never be RELATED.

> My inference therefrom was that the association is determined from the
> IP addresses. For example if my MTA makes an outbound connection to
> send mail to a remote site, and that site does an identd query, we have
> a RELATED connection.

Nope. That will be a NEW session. Uless ofcourse if you write a conntrack 
application helper module which registers the ident expectation when your 
MTA makes an outbound SMTP request. Not difficult (only a couple of lines 
of code, not counting the common parts looking the same in all these 
helpers) but not normally done.

> Here again conntrack is protocol-agnostic. You and I know that with FTP
> we talk to the server on its 21/tcp, and when we try to GET from it we
> will expect the server to connect back to our port 20/tcp.

conntrack is not protocol agnostic, only the spirit of conntrack is (it 
should track connections, not police the traffic). It knows a great deal 
of TCP, and there is application helper modules for FTP and a number of 
other application protocols needing RELATED connections.

It is these application protocol helper modules which registers the 
expected connections (i.e. FTP data channel) and making them RELATED 
instead of NEW when the connection is seen. When the FTP application 
protocol helper module sees a PORT command or PASV reply it registers the 
connection specified in these as an expected connection RELATED to this 
FTP control connection, and the SYN on that connection will be seen as 
RELATED instead of NEW.

Regards
Henrik

