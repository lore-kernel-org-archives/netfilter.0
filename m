From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Delay in responding caused by netfilter ? [Completely Solved]
Date: Wed, 04 May 2005 11:23:36 -0500
Message-ID: <4278F708.4080607@riverviewtech.net>
References: <42721F84.6080503@mnemon.de>	<200504290937.49507.Alistair@nerdnet.ca>	<20050429142517.GA1074@bender.817west.com>	<4273031B.20009@riverviewtech.net>
	<4278B1B9.9040302@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4278B1B9.9040302@mnemon.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> Which is what I did on one server (SuSE) and it solved the problem there.

*nod*

> The other server was different in that the problem occured not always,
> only about 80% of all connections were affected and only POP3. The real
> solution can be found here:
> 
> http://www.washington.edu/imap/IMAP-FAQs/index.html issue 7.24

This article is written from the System Administrator's point of view, i.e. from the server end of the connection where as what I did was written from the end users point of view from the client end of the connection.  The solution that this article talks about is how to configure the server to not even query for Ident (Auth) information.  What I did was configure my firewall to do an automatic REJECT of any Ident (Auth) queries that come in to my firewall from an SMTP server that I have just recently spoken to.  It is entirely possible that I could set up an SMTP server on my home server (that I would send all my outbound mail at the house through) that would connect to the ultimate MX for each peice of mail that I send out.  The ultimate that I would talk to could be configured to send Ident (Auth) queries or it could just as easily be configured not to.  This is the situation that I h
 ave no control over the server (ultimate MX) that would be sending the Ident (Auth) queri
es and this is the situation that I was addressing.  Personally IMHO these are two distinct problems that are EXTREMELY closely related to each other both having to do with Ident (Auth) and SMTP (or POP3 in your case) for the same connection, but on the opposite end of said connection.

> Thanks to all providing ideas and pointing me to ident.

No problem and you are welcome.  :)



Grant. . . .

