From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: RST instead of FIN?
Date: Sun, 11 Apr 2004 06:00:40 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081677639.2013.11.camel@grendel>
References: <05c301c41f2a$4a6ef650$9701a8c0@office>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: Jay Levitt <lists-netfilter@shopwatch.org>
Cc: netfilter@lists.netfilter.org

On Sat, 2004-04-10 at 14:33, Jay Levitt wrote:
>
> sourceforge: [SYN]
> me: [SYN, ACK]
> sourceforge: [ACK]
> [SMTP conversation ensues, switches to TLS, sends me an e-mail.  at
> the end..]
> me: [RST]

Weird. Are you sure this is not a RST/ACK? 

> sourceforge: [FIN, ACK]

Looks like the RST was ignored (although hard to say since you did not
include time stamps). Does the source MAC on the RST match your system?
When I've seen this in the past its been an IDS or IPS attempting to
reset the session due to a suspicious payload, but they get the sequence
numbers wrong. Thus the RST/ACK gets ignored and the session continues.

> me: [RST]
> me: [RST]

If this is an RST rather than a RST/ACK, it could be your system is
losing session info and handling the ACKs like they are new packets
(maybe some kind of broken IP wrapper application?). The second RST is
*really* odd as its an error packet without any stimulus. That's not
suppose to happen. 

I'm guessing this is not the kernel or Sendmail, but I'm honestly not
sure what it is.

Happy hunting,
Chris



