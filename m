From: Michael Gale <mgale@utilitran.com>
Subject: Re: SMTP Routing Based On Recipient
Date: Tue, 23 Dec 2003 08:36:25 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031223083625.142571c7.mgale@utilitran.com>
References: <1072121282.10935.12.camel@localhost.localdomain>
	<1072179452.2184.286.camel@grendel>
	<1072184455.708.2.camel@localhost.localdomain>
	<200312231314.06746.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312231314.06746.Antony@Soft-Solutions.co.uk>
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

Hello,

	Do not use sendmail ... look into Postfix. It is MUCH easier to configure and more secure. It was designed with security and easy of use. You can setup a simple host to accept mail for your domain and then forward it to your exchange server.

It is also easier to use any of the spam tools with Postfix as compared to using them with sendmail.

I am using Postfix and it verifies all the recipients via a LDAP connection to our Exchange 2000 server. So we only accept mail for people who have mail boxes.

I have Razor, DCC and DSPAM for spam filtering.

Michael.



On Tue, 23 Dec 2003 13:14:06 +0000
Antony Stone <Antony@Soft-Solutions.co.uk> wrote:

> On Tuesday 23 December 2003 1:00 pm, Adam Ellis wrote:
> 
> > On Tue, 2003-12-23 at 06:37, Chris Brenton wrote:
> > >
> > > A couple of other options:
> > > I use a combination of Sendmail, ClamAV, MimeDefang and Spamassassin to
> > > clean up all inbound e-mail before passing it off to my mail server. You
> > > can find a great tutorial on setting this up here:
> > > http://www.rudolphtire.com/mimedefang-howto/
> >
> > Chris and everyone else in this thread,
> >
> > Thanks for the information.  I think you all have me going in the right
> > direction now!
> 
> I recommend http://www.mailscanner.info for a similar setup - it uses sendmail 
> or exim, and provides a wonderfully configurable wrapper around any of 15 
> different antivirus engines (including the free ClamAV), and SpamAssassin.
> 
> Antony.
> 
> -- 
> RTFM may be the appropriate reply, but please specify exactly which FM to R.
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

