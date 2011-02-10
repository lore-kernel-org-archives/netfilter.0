From: Helmut Grohne <h.grohne@cygnusnetworks.de>
Subject: Re: What does nflog_unbind_pf actually do?
Date: Thu, 10 Feb 2011 09:52:08 +0100
Message-ID: <20110210085207.GA4042@buero.cygnusnet.de>
References: <20110125125426.GA7749@buero.cygnusnet.de> <20110203120052.GA4217@buero.cygnusnet.de> <4D4AAD40.1060204@netfilter.org> <20110203172429.GA8709@buero.cygnusnet.de> <4D4BCD39.7010503@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D4BCD39.7010503@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo,

On Fri, Feb 04, 2011 at 10:56:09AM +0100, Pablo Neira Ayuso wrote:
> On 03/02/11 18:24, Helmut Grohne wrote:
> > Thanks for the information. Again I'd need more understanding of the
> > matter before I can create a patch. (For instance I fail to see why
> > suppressing ENOBUFS would not help the performane.) The performance
> > issues on my project seem to have solved themselves in the mean time.

Rereading what I wrote I figured that the sentence in braces has a
spurious negation. What I really meant was: For instance I fail to see
why suppressing ENOBUFS would help/improve the performance.

> ENOBUFS means that your application is too slow to handle the amount of
> messages that the kernel sends to user-space. Basically, the socket
> queue between kernel and user-space gets full and the kernel starts
> dropping messages.
> 
> ENOBUFS is a way to know that you're losing messages. In the particular
> case of logging, it's telling that your logging has become not fully
> reliable at some point (because some log lines will be missing).
> 
> In the case of ctnetlink and nfqueue, the general interpretation of
> ENOBUFS is the same, but the action that user-space has to do to handle
> the situation is different.
> 
> Increasing the socket queue (buffer) helps in the case of ENOBUFS, but
> under high stress, increasing indefinitely the buffer size is not the
> way to go.

Yes, I figured the meaning of ENOBUFS and this mitigation with help from
Florian Westphal. Still all your writing does not explain why the
following statement from the Doxygen documentation should be true.

| To improve your libnetfilter_queue application in terms of
| performance, you may consider the following tweaks:
| ...
|  * set NETLINK_NO_ENOBUFS socket option to avoid receiving ENOBUFS
|    errors (requires Linux kernel >= 2.6.30).

I do not need an answer, because my performance issues got solved by
increasing the socket buffer. On the other hand this makes it clear just
how much more knowledge is required to write documentation than I have.

> Hm, I think I need to write some article on ENOBUFS and netlink.

Well for people who never heared about it (like me three weeks ago) your
explanations here are quite helpful. Maybe you should add a note to
explicitly clarify that receiving ENOBUFS does not indicate a permanent
breakage of the file descriptor (in contrast to EBADFD).

Also I do wonder why the manual page for recv(2) does not list ENOBUFS
in the list of possible errors. Since posix[1] seems to specify it, it
looks like a bug in the manual page. *sigh*

Helmut

[1] http://pubs.opengroup.org/onlinepubs/009695399/functions/recv.html
