From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: Extending an IPv4 filter to IPv6
Date: Sun, 27 Aug 2023 18:34:09 +1000
Message-ID: <ZOsKgctjEQWSARet@slk15.local.net>
References: <9d98b203-b22a-898c-1a4f-c83e706bc411@tana.it>
 <ZOKIl6qWCdLCTPPT@calendula>
 <29680eb6-1004-f1af-38bb-f9da49712d58@tana.it>
 <ZOO2q6mJZQZR+QM7@calendula>
 <b736646f-016d-3775-fa06-2babf1612dc1@tana.it>
Reply-To: duncan_roe@optusnet.com.au
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693125253; x=1693730053;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:reply-to:message-id:subject:cc:to:date:from:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V8bT9iKCuCfhMFOSVYcDj34g3vkPiIgOsoOhioAz4ks=;
        b=bMAIJ1ijSE0/TEgyB6ufD/tiRRCwjwRFQfUGwQhkESVmOIe37S99KQiVm5pKiiANQr
         h/vJFUbC5L6If/+HC3WrVO0gj1XAazlw1PNtyIHzpcLu7RFoOOOYw/5A5V+ZRrdei/Gx
         8OOkpIhKusc9D8lJ6SnAK3YGRljhC9F+Gm4X7OZmaxXy5J/glzysw/kU8sTm1TodszsA
         FUV1gOVoMPq2hgRYRTOlBpJp4/X8DxZamaHF+mIp3rm87NvOPLmNLnQZIAxa3ubq/G4/
         jSqsOunE+zlghIQb5LGZGQBcdsA31UWIJgUJunfWrsqaqDXi1PsAvPjOyuLnsfc4UV8L
         YolA==
Sender: Duncan Roe <duncan.roe2@gmail.com>
Content-Disposition: inline
In-Reply-To: <b736646f-016d-3775-fa06-2babf1612dc1@tana.it>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>

On Tue, Aug 22, 2023 at 08:09:53PM +0200, Alessandro Vesely wrote:
> On Mon 21/Aug/2023 21:10:35 +0200 Pablo Neira Ayuso wrote:
> > On Mon, Aug 21, 2023 at 07:18:46PM +0200, Alessandro Vesely wrote:
> > > On Sun 20/Aug/2023 23:41:43 +0200 Pablo Neira Ayuso wrote:
> > > > On Fri, Aug 18, 2023 at 12:56:38PM +0200, Alessandro Vesely wrote:
> > > > > [...]
> > > > >
> > > > > So, the first question: Can I keep using these functions?  What is the alternative?
> > > >
> > > > The alternative is the libmnl-based API which is the way to go
> > > > for new applications.
> > >
> > >
> > > The nf-queue.c[*] example that illustrates libmnl is strange.  It
> > > show a function nfq_nlmsg_put() (libnetfilter-queue).
> >
> > Yes, that is a helper function that is provided by libnetfilter_queue to
> > assist a libmnl-based program in building the netlink headers:
> >
> > EXPORT_SYMBOL
> > struct nlmsghdr *nfq_nlmsg_put(char *buf, int type, uint32_t queue_num)
> > {
> >          [...]
> > }
> >
> > This sets up two headers, one is the netlink header, that tells the
> > subsystem and the type of request. Then it follows the nfgenmsg header
> > which is specific of the nfnetlink_queue subsystem. It stores the queue
> > number, family and version are set up to unspec and version_0
> > respectively.
> >
> > There helpers function are offered in libnetfilter_queue, it is up to
> > you to opt-in to use them or not.
>
>
> I'm starting to understand.  The example reuses the big buffer to set up the
> queue parameters via mnl_socket_sendto(), received by nfqnl_recv_config().
> The old API had specific calls instead, nfq_create_queue(),
> nfq_set_mode(),... It is this style which makes everything look more
> complicated, as it requires several calls.
>
>
> > > I have two questions about it:
> > >
> > > 1) In the example it is called twice, the second time after setting attrs.
> > > What purpose does the first call serve?
> >
> > There are two sections in the nf-queue example:
> >
> > Section #1 (main function)
> >    Set up and configure the pipeline between kernel and
> >    userspace.  This creates the netlink socket and you send the
> >    configuration to the kernel for this pipeline.
>
>
> Now I gathered the first call creates the queue, the second one sets a flag.
> It's not clear why that needs to be two calls.  Could all have been stuffed
> in a single buffer and delivered by a single call?  Hm... perhaps it is
> split just to show that it doesn't have to be monolithic.  If I want to set
> queue maxlen do I have to add a third call?
>
>
> > Section #2 (packet processing loop)
> >     This is an infinite loop where your software reads for packets
> >     to come from the kernel and it calls a callback to handle the
> >     netlink message that encapsulates the packet and its metadata.
>
>
> In this section the example has a single call to mnl_socket_sendto() per packet.
>
>
> > You full have control on the socket, so you instantiate a non-blocking
> > socket and use select()/poll() if your software handles more that one
> > single socket for I/O multiplexing. This examples uses a blocking socket.
>
>
> But I can handle multiple queues using the same socket, can't I?  Are there
> any advantages handling, say a netlink socket for each queue?
>
>
> > > 2) Is it fine to use a small buffer?  My filter only looks at
> > > addresses, so it should be enough to copy 40 bytes.  Can it be on
> > > stack?
> >
> > You can specify NFQNL_COPY_PACKET in your configuration to tell the
> > kernel to send you 40 bytes only, when setting up the pipeline. The
> > kernel sends you a netlink message that contains attributes to
> > encapsulate packet metadata and the actual payload. The attribute comes
> > as an attribute of the netlink message.
>
>
> So the buffer must be bigger than just the payload.  libmnl.h defines a
> large MNL_SOCKET_BUFFER_SIZE...
>
>
> > You can fetch the payload directly from the attribute:
> >
> >          data = mnl_attr_get_payload(attr[NFQA_PAYLOAD]);
>
>
> Yup, that's what the example does.
>
>
> > This is accessing the data that is stored in the onstack buffer that
> > stores the netlink message that your software have received.
>
>
> It seems a buffer can contain several packets.  Is that related with the
> queue maxlen?
>
man 7 netlink will tell you that netlink messages may be batched. This is
straightforward to observe in a libnetfilter_log program under gdb.

However libnetfilter_queue programs never get batched netlink messages. So the
callback isn't strictly necessary but it would mean extra code to special-case
libnetfilter_queue (among all the other netfilter libraries) so it's been left
there.

If you rely on this behaviour it might be prudent to check that bytes read ==
*(struct nlmsghdr *)buf.nlmsg_len.
>
> > You can obtain the packet payload length via:
> >
> >          len = mnl_attr_get_payload_len(attr[NFQA_PAYLOAD]);
>
>
> And this should be the length specified with NFQNL_COPY_PACKET (or less), correct?
>
You can check for packet truncation by checking `len` above against what you
actually recieved.
>
> Thanks
> Ale
> --
>
Cheers ... Duncan.
