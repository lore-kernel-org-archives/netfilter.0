From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: SMTP Routing Based On Recipient
Date: Tue, 23 Dec 2003 11:20:46 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312231921.hBNJKkNC007637@server5.bandwidthco.com>
References: <200312231314.06746.Antony@Soft-Solutions.co.uk>
Reply-To: <markee@bandwidthco.com>
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
To: 'Antony Stone' <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

One more vote for MailScanner.  To put it simply, it is an "amazing" piece
of software.  It's easy to install, it requires very little maintenance, it
is highly effective, and the price is fits my budget perfectly ($0.00).  I
find it to be the perfect complement to iptables.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Tuesday, December 23, 2003 5:14 AM
To: netfilter@lists.netfilter.org
Subject: Re: SMTP Routing Based On Recipient

On Tuesday 23 December 2003 1:00 pm, Adam Ellis wrote:

> On Tue, 2003-12-23 at 06:37, Chris Brenton wrote:
> >
> > A couple of other options:
> > I use a combination of Sendmail, ClamAV, MimeDefang and Spamassassin 
> > to clean up all inbound e-mail before passing it off to my mail 
> > server. You can find a great tutorial on setting this up here:
> > http://www.rudolphtire.com/mimedefang-howto/
>
> Chris and everyone else in this thread,
>
> Thanks for the information.  I think you all have me going in the 
> right direction now!

I recommend http://www.mailscanner.info for a similar setup - it uses
sendmail or exim, and provides a wonderfully configurable wrapper around any
of 15 different antivirus engines (including the free ClamAV), and
SpamAssassin.

Antony.

--
RTFM may be the appropriate reply, but please specify exactly which FM to R.

                                                     Please reply to the
list;
                                                           please don't CC
me.




