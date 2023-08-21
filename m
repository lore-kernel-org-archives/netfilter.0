From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Extending an IPv4 filter to IPv6
Date: Mon, 21 Aug 2023 21:10:35 +0200
Message-ID: <ZOO2q6mJZQZR+QM7@calendula>
References: <9d98b203-b22a-898c-1a4f-c83e706bc411@tana.it>
 <ZOKIl6qWCdLCTPPT@calendula>
 <29680eb6-1004-f1af-38bb-f9da49712d58@tana.it>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <29680eb6-1004-f1af-38bb-f9da49712d58@tana.it>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Vesely <vesely@tana.it>
Cc: netfilter@vger.kernel.org

On Mon, Aug 21, 2023 at 07:18:46PM +0200, Alessandro Vesely wrote:
> On Sun 20/Aug/2023 23:41:43 +0200 Pablo Neira Ayuso wrote:
> > On Fri, Aug 18, 2023 at 12:56:38PM +0200, Alessandro Vesely wrote:
> > > [...]
> > >
> > > So, the first question: Can I keep using these functions?  What is the alternative?
> >
> > The alternative is the libmnl-based API which is the way to go for new
> > applications.
>
>
> The nf-queue.c[*] example that illustrates libmnl is strange.  It show a
> function nfq_nlmsg_put() (libnetfilter-queue).

Yes, that is a helper function that is provided by libnetfilter_queue
to assist a libmnl-based program in building the netlink headers:

EXPORT_SYMBOL
struct nlmsghdr *nfq_nlmsg_put(char *buf, int type, uint32_t queue_num)
{
        struct nlmsghdr *nlh = mnl_nlmsg_put_header(buf);
        nlh->nlmsg_type = (NFNL_SUBSYS_QUEUE << 8) | type;
        nlh->nlmsg_flags = NLM_F_REQUEST;

        struct nfgenmsg *nfg = mnl_nlmsg_put_extra_header(nlh, sizeof(*nfg));
        nfg->nfgen_family = AF_UNSPEC;
        nfg->version = NFNETLINK_V0;
        nfg->res_id = htons(queue_num);

        return nlh;
}

This sets up two headers, one is the netlink header, that tells the
subsystem and the type of request. Then it follows the nfgenmsg header
which is specific of the nfnetlink_queue subsystem. It stores the
queue number, family and version are set up to unspec and version_0
respectively.

There helpers function are offered in libnetfilter_queue, it is up to
you to opt-in to use them or not.

> I have two questions about it:
>
> 1) In the example it is called twice, the second time after setting attrs.
> What purpose does the first call serve?

There are two sections in the nf-queue example:

Section #1 (main function)
  Set up and configure the pipeline between kernel and
  userspace.  This creates the netlink socket and you send the
  configuration to the kernel for this pipeline.

Section #2 (packet processing loop)
   This is an infinite loop where your software reads for packets
   to come from the kernel and it calls a callback to handle the
   netlink message that encapsulates the packet and its metadata.

You full have control on the socket, so you instantiate a non-blocking
socket and use select()/poll() if your software handles more that one
single socket for I/O multiplexing. This examples uses a blocking socket.

> 2) Is it fine to use a small buffer?  My filter only looks at addresses, so
> it should be enough to copy 40 bytes.  Can it be on stack?

You can specify NFQNL_COPY_PACKET in your configuration to tell the
kernel to send you 40 bytes only, when setting up the pipeline. The
kernel sends you a netlink message that contains attributes to
encapsulate packet metadata and the actual payload. The attribute
comes as an attribute of the netlink message.

You can fetch the payload directly from the attribute:

        data = mnl_attr_get_payload(attr[NFQA_PAYLOAD]);

This is accessing the data that is stored in the onstack buffer that
stores the netlink message that your software have received.

You can obtain the packet payload length via:

        len = mnl_attr_get_payload_len(attr[NFQA_PAYLOAD]);

> > > Second question: Is there a "mixed mode" parameter, besides PF_INET
> > > and PF_INET6, that allows to capture both types?  In that case, can
> > > a queue receive either packet?
> >
> > Using the 'inet' family in nftables, it should be possible to send both
> > IPv4 and IPv6 packets to one single queue in userspace.
>
> Yes, or two calls to iptables and ip6tables.

Exactly.

> However, nfq_nlmsg_cfg_put_cmd() takes a pf argument, AF_INET in the
> example.  Is that argument used at all?

This is a legacy parameter which is not used by the kernel anymore,
you can specify AF_UNSPEC there.
