From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Rules for blocking Email from libero.it domain
Date: Tue, 29 Oct 2002 08:50:02 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021029085004.FRPW1554.mta07-svc.ntlworld.com@there>
References: <200210281507.g9SF70e08704@vulcan.rissington.net> <42647.192.168.7.14.1035847030.squirrel@iw.k1k2.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <42647.192.168.7.14.1035847030.squirrel@iw.k1k2.com>
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

On Monday 28 October 2002 11:17 pm, Andrew Smith wrote:

> >> Hi,
> >>
> >> I want to block all incoming mail from the libero.it domain.
> >
> > Configure your mail server to reject it.
> >
> > Netfilter is not the right answer to this question.
> >
> > Antony.
>
> If the problem is that you keep getting large arounts of email
> from libero.it then I think you may have to use the firewall.
> I'm only guessing, but when I view my maillog it always
> seems to know the size of each email that has been blocked,
> so I presume I am actually getting the email then it is
> being rejected (unless the sendmail protocol passes this
> value across and that is what is being displayed?)

The latter is correct.   Before an email is transmitted, the sender tells the 
receiver what size it is so that the receiver can decide whether it has space 
to accept it.   Most mail servers will have some upper limit (probably 10Mb - 
50Mb these days) on the size of mail they will accept.

An email server will typically check the address of the machine trying to 
send the email (in things like ordb.org for example), the sender's address, 
the recipient's address, and the size of the mail before it decides whether 
it's prepared to receive the actual email or not.   Even things like the 
recipient's address can be more complicated than you might expect, because 
you can limit things like the total number of recipients for a single email 
as well as checking individual addresses.

Antony.

-- 

I vote "no" to this proposal to form a committee to investigate whether we 
should or should not hold a ballot on whether to vote yet.

