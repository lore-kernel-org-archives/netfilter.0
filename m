From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: libnetfilter_queue: mark-value byte ordering?
Date: Mon, 10 May 2010 20:11:44 +0200
Message-ID: <4BE84C60.5070006@netfilter.org>
References: <4BE5B9CA.5090606@meta-dynamic.com> <4BE6AC04.5000504@tana.it> <4BE72DD8.1000509@netfilter.org> <4BE76C66.6070701@meta-dynamic.com> <4BE81CAA.8090101@netfilter.org> <4BE81D16.10503@netfilter.org> <4BE84191.5050808@meta-dynamic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BE84191.5050808@meta-dynamic.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Favro <netfilter@meta-dynamic.com>
Cc: Alessandro Vesely <vesely@tana.it>, netfilter <netfilter@vger.kernel.org>, Eric Leblond <eleblond@edenwall.com>

David Favro wrote:
> Pablo Neira Ayuso wrote:
>> Pablo Neira Ayuso wrote:
>>  
>>> I have applied your patch but I have mangled this part:
>>>
>>> @@ -699,10 +705,12 @@ int nfq_set_verdict2(struct nfq_q_handle *qh,
>>> u_int32_t id,
>>>   * \param qh Netfilter queue handle obtained by call to
>>> nfq_create_queue().
>>>   * \param id    ID assigned to packet by netfilter.
>>>   * \param verdict verdict to return to netfilter (NF_ACCEPT, NF_DROP)
>>> - * \param mark mark to put on packet
>>> + * \param mark the mark to put on the packet, in network byte order.
>>>
>>> The mark parameter in nfq_set_verdict2() is in host-byte order. It must
>>> be in network-byte order in the deprecated nfq_set_verdict_mark().
>>>     
>>
>> Sorry, it's fine. I got confused with the patch context information.
>> That change applies to nfq_set_verdict_mark().
>>   
> I might have munged it somehow when I rebased it to follow the commit
> that created nfq_set_verdict2(), that context does look strange. 
> Anyhow, it was supposed to be on nfq_set_verdict_mark().
> 
> While we're at it, here's an update to the documentation which changes
> references to nfq_set_verdict_mark() to nfq_set_verdict2().  Please
> forgive me if it seems picayune, but there's nothing wrong with having
> accurate documentation.

I'm always happy to receive patches. Oh, it seems that we have clashed,
I pushed this patch a couple of hours ago:

http://git.netfilter.org/cgi-bin/gitweb.cgi?p=libnetfilter_queue.git;a=commit;h=6b4e0a01259a80d91d0eaea01281372b594f05b1
