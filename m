From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: RST instead of FIN?
Date: Sat, 10 Apr 2004 23:54:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404102354.35949.Antony@Soft-Solutions.co.uk>
References: <05c301c41f2a$4a6ef650$9701a8c0@office>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <05c301c41f2a$4a6ef650$9701a8c0@office>
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

On Saturday 10 April 2004 7:33 pm, Jay Levitt wrote:

> 66.35.250.206, a sourceforge.net box, connects to my mail server to deliver
> an e-mail, as follows:
>
> sourceforge: [SYN]
> me: [SYN, ACK]
> sourceforge: [ACK]
> [SMTP conversation ensues, switches to TLS, sends me an e-mail.  at the
> end..] me: [RST]
> sourceforge: [FIN, ACK]
> me: [RST]
> me: [RST]

Makes no sense to me.   Maybe you could check whether this happens when other 
mail servers send you an email (ie: is it a consistent thing with your mail 
server), or even whether it happens *every* time this particular mail server 
talks to you, or only sometimes?

I can't suggest why it might be happening, but I'd suggest turn on sendmail 
debugging/verbose logging in order to see what it thinks is really going on.   
I think it's an application-layer thing rather than a kernel/networking 
thing, but that's a guess.

Regards,

Antony.

-- 
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the list;
                                                           please don't CC me.


