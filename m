From: "Jeffrey D. Brower" <jeff@pointhere.net>
Subject: Re: real-time monitor question
Date: Wed, 6 Aug 2003 11:49:04 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <04b001c35c32$436a5c70$0b02a8c0@pointhere.net>
References: <Pine.LNX.4.44.0308061022320.21531-100000@localhost>
Reply-To: "Jeffrey D. Brower" <jeff@pointhere.net>
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
To: Chris Wilson <chris@netservers.co.uk>
Cc: netfilter@lists.netfilter.org

Hi Chris,

You are a big help again!  Thanks for your replies.

> If you set the O_NONBLOCK option on your end of the pipe, then if the pipe
> is full the operating system will just return an EAGAIN error immediately,
> instead of waiting for the pipe to empty. In any case, it doesn't matter
> much if the input process blocks, since packet processing will continue
> anyway without interference from your process.

Very cool.  I would want to continue processing packets even if my process
was falling behind so that works for me.

Let me be sure I understand all my input from the list:  (1) By setting the
O_NONBLOCK option on my end of the pipe, all I would loose would be the
information on the packets that hit while the pipe is full,  (2) but the
packets that hit while the pipe was full would process correctly anyway,
and (3) the input process can block and the output process nonblock so that
the packet filter can run full speed and I can potentially not miss anything
since the input side blocks and give me more time.

Do you know if ULOG can send an entry once a second with a summary of # of
packets that hit rules which would give me fewer reads on the pipe?

    Jeff



