From: Jay Levitt <lists-netfilter@shopwatch.org>
Subject: Re: RST instead of FIN?
Date: Sun, 11 Apr 2004 01:41:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <065d01c41f87$9c48f6d0$9701a8c0@office>
References: <05c301c41f2a$4a6ef650$9701a8c0@office> <200404102354.35949.Antony@Soft-Solutions.co.uk>
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

It happens on many servers, not just sourceforge - in fact, I get it on the
netfilter server as well.  And it's only sometimes for any given server, not
all the time...

I'll try turning on sendmail logging.  I wasn't sure if there was anything
an application could even do to trigger an RST, but I haven't done tcp
programming in quite a while...
----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Saturday, April 10, 2004 6:54 PM
Subject: Re: RST instead of FIN?


> On Saturday 10 April 2004 7:33 pm, Jay Levitt wrote:
>
> > 66.35.250.206, a sourceforge.net box, connects to my mail server to
deliver
> > an e-mail, as follows:
> >
> > sourceforge: [SYN]
> > me: [SYN, ACK]
> > sourceforge: [ACK]
> > [SMTP conversation ensues, switches to TLS, sends me an e-mail.  at the
> > end..] me: [RST]
> > sourceforge: [FIN, ACK]
> > me: [RST]
> > me: [RST]
>
> Makes no sense to me.   Maybe you could check whether this happens when
other
> mail servers send you an email (ie: is it a consistent thing with your
mail
> server), or even whether it happens *every* time this particular mail
server
> talks to you, or only sometimes?
>
> I can't suggest why it might be happening, but I'd suggest turn on
sendmail
> debugging/verbose logging in order to see what it thinks is really going
on.
> I think it's an application-layer thing rather than a kernel/networking
> thing, but that's a guess.
>
> Regards,
>
> Antony.
>
> --
> Software development can be quick, high quality, or low cost.
>
> The customer gets to pick any two out of three.
>
>                                                      Please reply to the
list;
>                                                            please don't CC
me.
>
>
>


