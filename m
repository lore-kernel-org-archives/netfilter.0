From: Alessandro Vesely <vesely@tana.it>
Subject: Re: Extending an IPv4 filter to IPv6
Date: Tue, 22 Aug 2023 20:09:53 +0200
Message-ID: <b736646f-016d-3775-fa06-2babf1612dc1@tana.it>
References: <9d98b203-b22a-898c-1a4f-c83e706bc411@tana.it>
 <ZOKIl6qWCdLCTPPT@calendula> <29680eb6-1004-f1af-38bb-f9da49712d58@tana.it>
 <ZOO2q6mJZQZR+QM7@calendula>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=tana.it;
        s=epsilon; t=1692727794;
        bh=YBQDK2Lkeel5BnweJ7DuxnJcidSvF6rCJ75aCVXgmH4=;
        h=Author:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=Hch+NOEDh/lWf2dVNVlFv/z2LGNLC73J64vRALHGWdtVIQMIirOCKDpuF3Xl21U2c
         Q2G8vfzDnoUYcbcg6g+Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
        t=1692727794; bh=YBQDK2Lkeel5BnweJ7DuxnJcidSvF6rCJ75aCVXgmH4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=ARF7N6mv0mMfVO8g9zsf+h3Ow3HViZta7cdc/6dapORvQre8EymU5xYDb3K0S2PBj
         aFxm1/EhqSbjUuisExu5GAwTJ5iF7+LDIDhG5r6y2j5TIRrPgB1NAuBUmK0KIGrbR6
         CrMhIKE0hmUqmIDHx9HbuPO6BDAZQH0pzZz6bY6tDyYOnsVqdMdVBM3ciMRHS
Subject: Re: Extending an IPv4 filter to IPv6
Content-Language: en-US, it-IT
In-Reply-To: <ZOO2q6mJZQZR+QM7@calendula>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, netfilter@vger.kernel.org

On Mon 21/Aug/2023 21:10:35 +0200 Pablo Neira Ayuso wrote:
> On Mon, Aug 21, 2023 at 07:18:46PM +0200, Alessandro Vesely wrote:
>> On Sun 20/Aug/2023 23:41:43 +0200 Pablo Neira Ayuso wrote:
>>> On Fri, Aug 18, 2023 at 12:56:38PM +0200, Alessandro Vesely wrote:
>>>> [...]
>>>>
>>>> So, the first question: Can I keep using these functions?  What is the alternative?
>>>
>>> The alternative is the libmnl-based API which is the way to go for new 
>>> applications.
>>
>>
>> The nf-queue.c[*] example that illustrates libmnl is strange.  It show a 
>> function nfq_nlmsg_put() (libnetfilter-queue).
>
> Yes, that is a helper function that is provided by libnetfilter_queue 
> to assist a libmnl-based program in building the netlink headers:
>
> EXPORT_SYMBOL
> struct nlmsghdr *nfq_nlmsg_put(char *buf, int type, uint32_t queue_num)
> {
>          [...]
> }
>
> This sets up two headers, one is the netlink header, that tells the 
> subsystem and the type of request. Then it follows the nfgenmsg header 
> which is specific of the nfnetlink_queue subsystem. It stores the 
> queue number, family and version are set up to unspec and version_0 
> respectively.
>
> There helpers function are offered in libnetfilter_queue, it is up to 
> you to opt-in to use them or not.


I'm starting to understand.  The example reuses the big buffer to set up the 
queue parameters via mnl_socket_sendto(), received by nfqnl_recv_config().  The 
old API had specific calls instead, nfq_create_queue(), nfq_set_mode(),... It 
is this style which makes everything look more complicated, as it requires 
several calls.


>> I have two questions about it:
>>
>> 1) In the example it is called twice, the second time after setting attrs.
>> What purpose does the first call serve?
>
> There are two sections in the nf-queue example:
>
> Section #1 (main function)
>    Set up and configure the pipeline between kernel and
>    userspace.  This creates the netlink socket and you send the
>    configuration to the kernel for this pipeline.


Now I gathered the first call creates the queue, the second one sets a flag. 
It's not clear why that needs to be two calls.  Could all have been stuffed in 
a single buffer and delivered by a single call?  Hm... perhaps it is split just 
to show that it doesn't have to be monolithic.  If I want to set queue maxlen 
do I have to add a third call?


> Section #2 (packet processing loop)
>     This is an infinite loop where your software reads for packets
>     to come from the kernel and it calls a callback to handle the
>     netlink message that encapsulates the packet and its metadata.


In this section the example has a single call to mnl_socket_sendto() per packet.


> You full have control on the socket, so you instantiate a non-blocking
> socket and use select()/poll() if your software handles more that one
> single socket for I/O multiplexing. This examples uses a blocking socket.


But I can handle multiple queues using the same socket, can't I?  Are there any 
advantages handling, say a netlink socket for each queue?


>> 2) Is it fine to use a small buffer?  My filter only looks at addresses, so 
>> it should be enough to copy 40 bytes.  Can it be on stack?
>
> You can specify NFQNL_COPY_PACKET in your configuration to tell the 
> kernel to send you 40 bytes only, when setting up the pipeline. The 
> kernel sends you a netlink message that contains attributes to 
> encapsulate packet metadata and the actual payload. The attribute 
> comes as an attribute of the netlink message.


So the buffer must be bigger than just the payload.  libmnl.h defines a large 
MNL_SOCKET_BUFFER_SIZE...


> You can fetch the payload directly from the attribute:
> 
>          data = mnl_attr_get_payload(attr[NFQA_PAYLOAD]);


Yup, that's what the example does.


> This is accessing the data that is stored in the onstack buffer that
> stores the netlink message that your software have received.


It seems a buffer can contain several packets.  Is that related with the queue 
maxlen?


> You can obtain the packet payload length via:
> 
>          len = mnl_attr_get_payload_len(attr[NFQA_PAYLOAD]);


And this should be the length specified with NFQNL_COPY_PACKET (or less), correct?


Thanks
Ale
-- 







