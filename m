From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: SMTP Routing Based On Recipient
Date: Tue, 23 Dec 2003 06:37:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072179452.2184.286.camel@grendel>
References: <1072121282.10935.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1072121282.10935.12.camel@localhost.localdomain>
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
To: aellis@saberlogic.com
Cc: netfilter@lists.netfilter.org

On Mon, 2003-12-22 at 14:28, Adam Ellis wrote:
>
> What I
> am wondering is this - would it be possible to redirect SMTP to my Linux
> server, use iptables to check that the recipient matches a valid user
> from a list I'd supply, and, if so, route the message to the Exchange
> server? 

As others have mentioned, this is not an optimal choice. You *might* be
able to hack things together using strings and tarpit, but it would be a
kluge at best.

A couple of other options:
I use a combination of Sendmail, ClamAV, MimeDefang and Spamassassin to
clean up all inbound e-mail before passing it off to my mail server. You
can find a great tutorial on setting this up here:
http://www.rudolphtire.com/mimedefang-howto/

If you would rather get something that gives you a support contract, You
might want to check out the CanIT Appliance:
http://www.canit.ca/products.php

Its pretty much the same setup I mention above with a few extra bells
and whistles to make it easier to use. Of course you also have to pay
for it, but it does come with support.

HTH,
C


 



