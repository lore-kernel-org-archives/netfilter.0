From: Alessandro Vesely <vesely@tana.it>
Subject: Re: Extending an IPv4 filter to IPv6
Date: Thu, 31 Aug 2023 11:22:13 +0200
Message-ID: <57aa5744-4cf3-ebfa-5f5a-21a630b9c09a@tana.it>
References: <9d98b203-b22a-898c-1a4f-c83e706bc411@tana.it>
 <ZOKIl6qWCdLCTPPT@calendula> <29680eb6-1004-f1af-38bb-f9da49712d58@tana.it>
 <ZOO2q6mJZQZR+QM7@calendula> <b736646f-016d-3775-fa06-2babf1612dc1@tana.it>
 <ZOu2pbmm7mdTC5xQ@calendula>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=tana.it;
        s=epsilon; t=1693473734;
        bh=1rStuMnqX/jeEcC0tJqVcyJvi1s03RwIRcu1F7A8PrM=;
        h=Author:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=Ku0cqrKrW+/IJclvFUgSjicTo6ulWTR7iu5niC1sRbF2TwtZmQtPVi6EXc0ZkxZ2P
         YXpZlqG/bfWbT9lUrlhBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
        t=1693473734; bh=1rStuMnqX/jeEcC0tJqVcyJvi1s03RwIRcu1F7A8PrM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=AoYZs0NuPONNast/0pjI6BAbgbO90i0aeIXuVgcXxEEvliYciCBfQptfEVkTBBPNf
         lL0s/hhjBmo1TXcihKz91m1kBsgE0KgaZsvLgJA5dvHiB/ai+O9jnvAQJB4oOOHWHZ
         7BKsagZOy/gCqxfN+T/CC9gRqtrAsFqfBuBNjyzO72YpYibcg58ddlQhk5y9f
Subject: Re: Extending an IPv4 filter to IPv6
Content-Language: en-US, it-IT
In-Reply-To: <ZOu2pbmm7mdTC5xQ@calendula>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, netfilter@vger.kernel.org

Thanks for all the tips and the comments in the example.  I now seem to be able 
to code something...


Best
Ale


On Sun 27/Aug/2023 22:48:37 +0200 Pablo Neira Ayuso wrote:
> On Tue, Aug 22, 2023 at 08:09:53PM +0200, Alessandro Vesely wrote:
>> On Mon 21/Aug/2023 21:10:35 +0200 Pablo Neira Ayuso wrote:
>> > On Mon, Aug 21, 2023 at 07:18:46PM +0200, Alessandro Vesely wrote:
>> > > On Sun 20/Aug/2023 23:41:43 +0200 Pablo Neira Ayuso wrote:
>> > > > On Fri, Aug 18, 2023 at 12:56:38PM +0200, Alessandro Vesely wrote:
>> > > > > [...]
>> > > > > 
>> > > > > So, the first question: Can I keep using these functions?  What is the alternative?
>> > > > 
>> > > > The alternative is the libmnl-based API which is the way to go
>> > > > for new applications.
>> > > 
>> > > 
>> > > The nf-queue.c[*] example that illustrates libmnl is strange.  It
>> > > show a function nfq_nlmsg_put() (libnetfilter-queue).
>> > 
>> > Yes, that is a helper function that is provided by libnetfilter_queue to
>> > assist a libmnl-based program in building the netlink headers:
>> > 
>> > EXPORT_SYMBOL
>> > struct nlmsghdr *nfq_nlmsg_put(char *buf, int type, uint32_t queue_num)
>> > {
>> >          [...]
>> > }
>> > 
>> > This sets up two headers, one is the netlink header, that tells the
>> > subsystem and the type of request. Then it follows the nfgenmsg header
>> > which is specific of the nfnetlink_queue subsystem. It stores the queue
>> > number, family and version are set up to unspec and version_0
>> > respectively.
>> > 
>> > There helpers function are offered in libnetfilter_queue, it is up to
>> > you to opt-in to use them or not.
>> 
>> 
>> I'm starting to understand.  The example reuses the big buffer to set up the
>> queue parameters via mnl_socket_sendto(), received by nfqnl_recv_config().
>> The old API had specific calls instead, nfq_create_queue(),
>> nfq_set_mode(),... It is this style which makes everything look more
>> complicated, as it requires several calls.
> 
> I agree it is more low level.
> 
>> > > I have two questions about it:
>> > > 
>> > > 1) In the example it is called twice, the second time after setting attrs.
>> > > What purpose does the first call serve?
>> > 
>> > There are two sections in the nf-queue example:
>> > 
>> > Section #1 (main function)
>> >    Set up and configure the pipeline between kernel and
>> >    userspace.  This creates the netlink socket and you send the
>> >    configuration to the kernel for this pipeline.
>> 
>> Now I gathered the first call creates the queue, the second one sets a flag.
>> It's not clear why that needs to be two calls.  Could all have been stuffed
>> in a single buffer and delivered by a single call?  Hm... perhaps it is
>> split just to show that it doesn't have to be monolithic.  If I want to set
>> queue maxlen do I have to add a third call?
> 
> It should be possible to batch three netlink messages in one single
> buffer, there is a batch API in libmnl. You will have to assign
> different sequence numbers to each message in the batch to identify
> errors, because kernel tells you what message has failed (including
> the original sequence number) and the reason (expressed as errno).
> 
> Since this is only called once to set up the data pipeline between
> kernel and userspace, I do not think the batching is worth the effort.
> 
>> > Section #2 (packet processing loop)
>> >     This is an infinite loop where your software reads for packets
>> >     to come from the kernel and it calls a callback to handle the
>> >     netlink message that encapsulates the packet and its metadata.
>> 
>> 
>> In this section the example has a single call to mnl_socket_sendto() per packet.
> 
> This is to send a verdict back to kernel space on the packet that
> userspace has received.
> 
>> > You full have control on the socket, so you instantiate a non-blocking
>> > socket and use select()/poll() if your software handles more that one
>> > single socket for I/O multiplexing. This examples uses a blocking socket.
>> 
>> But I can handle multiple queues using the same socket, can't I?  Are there
>> any advantages handling, say a netlink socket for each queue?
> 
> Yes you can handle all queues with one single socket.
> 
> Splitting queues in sockets combined with CPU pinning allows you to
> improve CPU utilization. There is a number of options to fan out
> packets between several queues, see documntation.
> 
>> > > 2) Is it fine to use a small buffer?  My filter only looks at
>> > > addresses, so it should be enough to copy 40 bytes.  Can it be on
>> > > stack?
>> > 
>> > You can specify NFQNL_COPY_PACKET in your configuration to tell the
>> > kernel to send you 40 bytes only, when setting up the pipeline. The
>> > kernel sends you a netlink message that contains attributes to
>> > encapsulate packet metadata and the actual payload. The attribute comes
>> > as an attribute of the netlink message.
>> 
>> So the buffer must be bigger than just the payload.  libmnl.h defines a
>> large MNL_SOCKET_BUFFER_SIZE...
> 
> That is a generic buffer definition. In the specific case of nfqueue,
> you have to allocate a buffer to accomodate enough data to be received
> from the kernel.
> 
>> > You can fetch the payload directly from the attribute:
>> > 
>> >          data = mnl_attr_get_payload(attr[NFQA_PAYLOAD]);
>> 
>> 
>> Yup, that's what the example does.
>> 
>> > This is accessing the data that is stored in the onstack buffer that
>> > stores the netlink message that your software have received.
>> 
>> 
>> It seems a buffer can contain several packets.  Is that related with the
>> queue maxlen?
> 
> Linux provides GSO/GRO support, if it is turned on as it is by
> default, then you might be receiving a large large whose size might be
> larger than your device MTU. The nfqueue subsystem reports this via
> NFQA_CFG_F_GSO flag.
> 
>> > You can obtain the packet payload length via:
>> > 
>> >          len = mnl_attr_get_payload_len(attr[NFQA_PAYLOAD]);
>> 
>> 
>> And this should be the length specified with NFQNL_COPY_PACKET (or less), correct?
> 
> Exactly.
