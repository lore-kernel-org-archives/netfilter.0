From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: libnetfilter_queue: mark-value byte ordering?
Date: Mon, 10 May 2010 16:48:10 +0200
Message-ID: <4BE81CAA.8090101@netfilter.org>
References: <4BE5B9CA.5090606@meta-dynamic.com> <4BE6AC04.5000504@tana.it> <4BE72DD8.1000509@netfilter.org> <4BE76C66.6070701@meta-dynamic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BE76C66.6070701@meta-dynamic.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David F <netfilter@meta-dynamic.com>
Cc: Alessandro Vesely <vesely@tana.it>, netfilter <netfilter@vger.kernel.org>, Eric Leblond <eleblond@edenwall.com>

David F wrote:
> Pablo Neira Ayuso wrote:
>> Alessandro Vesely wrote:
>>  
>>> David F wrote:
>>>    
>>>>  I changed my code to use htonl() on the mark-value prior to calling
>>>> nfq_set_verdict_mark(), and it all suddenly started working.
>>>>       
>>> Since it is not documented, everyone rediscovers it anew. See e.g.
>>> http://www.gossamer-threads.com/lists/iptables/devel/62591
>>>     
>>
>> I have applied the following patch. I think that, at least, new users
>> will not hit this problem again. I'm very sorry that this was not fixed
>> before. Let me know if you are OK with it, we're still in time to revert
>> the patch attached.
>>   
> For what it's worth, I had previously prepared this patch which just
> clarifies the documentation on this parameter.  I think it still has
> value since I also added some missing return-value docs and changed the
> descriptions of a few parameters that I had found to be confusing.

I have applied your patch but I have mangled this part:

@@ -699,10 +705,12 @@ int nfq_set_verdict2(struct nfq_q_handle *qh,
u_int32_t id,
  * \param qh Netfilter queue handle obtained by call to nfq_create_queue().
  * \param id	ID assigned to packet by netfilter.
  * \param verdict verdict to return to netfilter (NF_ACCEPT, NF_DROP)
- * \param mark mark to put on packet
+ * \param mark the mark to put on the packet, in network byte order.

The mark parameter in nfq_set_verdict2() is in host-byte order. It must
be in network-byte order in the deprecated nfq_set_verdict_mark().
