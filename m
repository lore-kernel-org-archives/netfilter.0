From: Helmut Grohne <h.grohne@cygnusnetworks.de>
Subject: ENOBUFS missing in man recv(2) [Initially: What does
	nflog_unbind_pf actually do?]
Date: Mon, 14 Feb 2011 15:31:02 +0100
Message-ID: <20110214143102.GA4392@buero.cygnusnet.de>
References: <20110125125426.GA7749@buero.cygnusnet.de> <20110203120052.GA4217@buero.cygnusnet.de> <4D4AAD40.1060204@netfilter.org> <20110203172429.GA8709@buero.cygnusnet.de> <4D4BCD39.7010503@netfilter.org> <20110210085207.GA4042@buero.cygnusnet.de> <4D5547D0.7020804@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D5547D0.7020804@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, mtk.manpages@gmail.com
Cc: netfilter@vger.kernel.org, linux-man@vger.kernel.org

On Fri, Feb 11, 2011 at 03:29:36PM +0100, Pablo Neira Ayuso wrote:
> On 10/02/11 09:52, Helmut Grohne wrote:
> > Also I do wonder why the manual page for recv(2) does not list ENOBUFS
> > in the list of possible errors. Since posix[1] seems to specify it, it
> > looks like a bug in the manual page. *sigh*
> 
> This is quite netlink specific and nobody probably sent a patch for it
> so far. I encourage you to send a patch to the manpage maintainers. This
> is how things work, it's up to you to help others to fix this situation.

The reference [1] in my previous mail referenced
http://pubs.opengroup.org/onlinepubs/009695399/functions/recv.html.

Pablo, instead of complaining about missing patches, you could comment on the
other patch I sent in. I do send patches when I am confident that I understood
things. This just happens not to be the netfilter-log library.

Let me propose the addition at the end of this email to the recv(2) manual
page.

Helmut

--- recv.2.orig 2011-02-14 15:05:49.000000000 +0100
+++ recv.2      2011-02-14 15:26:13.000000000 +0100
@@ -425,6 +425,17 @@
 Invalid argument passed.
 .\" e.g., msg_namelen < 0 for recvmsg() or addrlen < 0 for recvfrom()
 .TP
+.B ENOBUFS
+A positive number of messages was dropped due to insufficient socket
+buffer space. On Linux this can occur when operating on netlink
+sockets. The
+.BR SO_RCVBUF
+and
+.BR SO_RCVBUFFORCE
+socket options described in
+.BR socket (7)
+can be used to change the socket buffer size.
+.TP
 .B ENOMEM
 Could not allocate memory for
 .BR recvmsg ().
