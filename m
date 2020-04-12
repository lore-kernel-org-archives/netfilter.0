From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: nfnetlink: This library is not meant as a public API for
 application developers.
Date: Sun, 12 Apr 2020 18:21:53 +1000
Message-ID: <20200412082153.GG13869@dimstar.local.net>
References: <bcff17cd-1457-7454-e00f-22d798afd7e5@tana.it>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bcff17cd-1457-7454-e00f-22d798afd7e5@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Vesely <vesely@tana.it>
Cc: Netfilter <netfilter@vger.kernel.org>

Hi Ale, and sorry for very late reply

On Thu, Feb 13, 2020 at 12:27:41PM +0100, Alessandro Vesely wrote:
> Has that disclaimer always been in libnfnetlink home page[*]?
>
> It is the first time I see it.
>
> I have a userspace filter[???] working with it, and it currently works well.
>
> If I remove -lnfnetlink from the link command, I get just one undefined
> reference to symbol 'nfnl_rcvbufsiz'.  It is used only if there is a command
> line option to set the buffer size to a given size, to avoid enobufs.  For the
> rest, the daemon uses libnetfilter_queue.
>
> Should I rewrite that?  How?
>
>
> Best
> Ale
> --

Yes you can code to avoid using nfnl_rcvbufsiz() from libnfnetlink.

Thre is no libmnl or libnetfilter_queue function to do it at present, but
libmnl/examples/netfilter/nfct-daemon.c has the code.
In case you haven't git cloned libmnl, here is a summary:

> socklen_t buffersize; // Set by your command-line option
Your code likely already has:
> struct mnl_socket *nl;
> nl = mnl_socket_open(NETLINK_NETFILTER);
(after mnl_socket_bind)
> setsockopt(mnl_socket_get_fd(nl), SOL_SOCKET, SO_RCVBUFFORCE, // You should
>   &buffersize, sizeof(socklen_t));     // check the return code (not shown)
If you like, you can check how big a buffer the kernel gave you
> socklen_t socklen = sizeof buffersize;
> socklen_t read_size = 0;
> getsockopt(mnl_socket_get_fd(nl), SOL_SOCKET, SO_RCVBUF, &read_size, &socklen);
From testing it seems you get a buffer of twice buffersize bytes.

HTH

Cheers ... Duncan.
