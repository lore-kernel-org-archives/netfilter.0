From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SMTP Routing Based On Recipient
Date: Tue, 23 Dec 2003 13:14:06 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312231314.06746.Antony@Soft-Solutions.co.uk>
References: <1072121282.10935.12.camel@localhost.localdomain> <1072179452.2184.286.camel@grendel> <1072184455.708.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1072184455.708.2.camel@localhost.localdomain>
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

On Tuesday 23 December 2003 1:00 pm, Adam Ellis wrote:

> On Tue, 2003-12-23 at 06:37, Chris Brenton wrote:
> >
> > A couple of other options:
> > I use a combination of Sendmail, ClamAV, MimeDefang and Spamassassin to
> > clean up all inbound e-mail before passing it off to my mail server. You
> > can find a great tutorial on setting this up here:
> > http://www.rudolphtire.com/mimedefang-howto/
>
> Chris and everyone else in this thread,
>
> Thanks for the information.  I think you all have me going in the right
> direction now!

I recommend http://www.mailscanner.info for a similar setup - it uses sendmail 
or exim, and provides a wonderfully configurable wrapper around any of 15 
different antivirus engines (including the free ClamAV), and SpamAssassin.

Antony.

-- 
RTFM may be the appropriate reply, but please specify exactly which FM to R.

                                                     Please reply to the list;
                                                           please don't CC me.


