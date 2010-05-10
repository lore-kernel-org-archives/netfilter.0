From: David Favro <netfilter@meta-dynamic.com>
Subject: Re: libnetfilter_queue: mark-value byte ordering?
Date: Mon, 10 May 2010 13:25:37 -0400
Message-ID: <4BE84191.5050808@meta-dynamic.com>
References: <4BE5B9CA.5090606@meta-dynamic.com> <4BE6AC04.5000504@tana.it> <4BE72DD8.1000509@netfilter.org> <4BE76C66.6070701@meta-dynamic.com> <4BE81CAA.8090101@netfilter.org> <4BE81D16.10503@netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020505010902070701090302"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BE81D16.10503@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Alessandro Vesely <vesely@tana.it>, netfilter <netfilter@vger.kernel.org>, Eric Leblond <eleblond@edenwall.com>

This is a multi-part message in MIME format.
--------------020505010902070701090302
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Pablo Neira Ayuso wrote:
> Pablo Neira Ayuso wrote:
>   
>> I have applied your patch but I have mangled this part:
>>
>> @@ -699,10 +705,12 @@ int nfq_set_verdict2(struct nfq_q_handle *qh,
>> u_int32_t id,
>>   * \param qh Netfilter queue handle obtained by call to nfq_create_queue().
>>   * \param id	ID assigned to packet by netfilter.
>>   * \param verdict verdict to return to netfilter (NF_ACCEPT, NF_DROP)
>> - * \param mark mark to put on packet
>> + * \param mark the mark to put on the packet, in network byte order.
>>
>> The mark parameter in nfq_set_verdict2() is in host-byte order. It must
>> be in network-byte order in the deprecated nfq_set_verdict_mark().
>>     
>
> Sorry, it's fine. I got confused with the patch context information.
> That change applies to nfq_set_verdict_mark().
>   
I might have munged it somehow when I rebased it to follow the commit 
that created nfq_set_verdict2(), that context does look strange.  
Anyhow, it was supposed to be on nfq_set_verdict_mark().

While we're at it, here's an update to the documentation which changes 
references to nfq_set_verdict_mark() to nfq_set_verdict2().  Please 
forgive me if it seems picayune, but there's nothing wrong with having 
accurate documentation.

Thanks,
David Favro


--------------020505010902070701090302
Content-Type: text/x-patch;
 name="documentation-verdict2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="documentation-verdict2.patch"

Documentation update: refers to "nfq_set_verdict2()" rather than "nfq_set_verdict_mark()" which is now deprecated.

From: David Favro <netfilter@meta-dynamic.com>

Signed-off-by: David Favro <netfilter@meta-dynamic.com>
---
 src/libnetfilter_queue.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/libnetfilter_queue.c b/src/libnetfilter_queue.c
index 7d0fb45..09cde59 100644
--- a/src/libnetfilter_queue.c
+++ b/src/libnetfilter_queue.c
@@ -216,8 +216,8 @@ struct nfnl_handle *nfq_nfnlh(struct nfq_handle *h)
 		nfq_handle_packet(h, buf, rv);
 	}
 \endverbatim
- * When the decision on a packet has been choosed, the verdict has to be given
- * by calling nfq_set_verdict() or nfq_set_verdict_mark().
+ * When the decision on a packet has been chosen, the verdict has to be given
+ * by calling nfq_set_verdict() or nfq_set_verdict2().
  *
  * Data and information about the packet can be fetch by using message parsing
  * functions (See \link Parsing \endlink).
@@ -673,7 +673,7 @@ static int __set_verdict(struct nfq_q_handle *qh, u_int32_t id,
  *
  * Notifies netfilter of the userspace verdict for the given packet.  Every
  * queued packet _must_ have a verdict specified by userspace, either by
- * calling this function, or by calling the nfq_set_verdict_mark() function.
+ * calling this function, or by calling the nfq_set_verdict2() function.
  *
  * \return -1 on error; >= 0 otherwise.
  */
-- 
1.6.3.3


--------------020505010902070701090302--
