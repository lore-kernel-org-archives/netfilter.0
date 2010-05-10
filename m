From: David F <netfilter@meta-dynamic.com>
Subject: Re: libnetfilter_queue: mark-value byte ordering?
Date: Sun, 09 May 2010 22:16:06 -0400
Message-ID: <4BE76C66.6070701@meta-dynamic.com>
References: <4BE5B9CA.5090606@meta-dynamic.com> <4BE6AC04.5000504@tana.it> <4BE72DD8.1000509@netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040706070400010807090801"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BE72DD8.1000509@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Alessandro Vesely <vesely@tana.it>, netfilter <netfilter@vger.kernel.org>, Eric Leblond <eleblond@edenwall.com>

This is a multi-part message in MIME format.
--------------040706070400010807090801
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Pablo Neira Ayuso wrote:
> Alessandro Vesely wrote:
>   
>> David F wrote:
>>     
>>>  I changed my code to use htonl() on the mark-value prior to calling
>>> nfq_set_verdict_mark(), and it all suddenly started working.
>>>       
>> Since it is not documented, everyone rediscovers it anew. See e.g.
>> http://www.gossamer-threads.com/lists/iptables/devel/62591
>>     
>
> I have applied the following patch. I think that, at least, new users
> will not hit this problem again. I'm very sorry that this was not fixed
> before. Let me know if you are OK with it, we're still in time to revert
> the patch attached.
>   
For what it's worth, I had previously prepared this patch which just 
clarifies the documentation on this parameter.  I think it still has 
value since I also added some missing return-value docs and changed the 
descriptions of a few parameters that I had found to be confusing.

-- David Favro


--------------040706070400010807090801
Content-Type: text/x-patch;
 name="0001-Documentation-enhancements.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-Documentation-enhancements.patch"

From 29f601afdd546b75f6b5d64a654b1c60780899f9 Mon Sep 17 00:00:00 2001
From: David Favro <netfilter@meta-dynamic.com>
Date: Mon, 3 May 2010 21:28:55 -0400
Subject: [PATCH] Documentation enhancements.

 * Several parameters are clarified.
 * Several previously undocumented return-values are documented.
 * nfq_set_verdict_mark() [now deprecated]: notes that mark is in network
   byte order.
---
 src/libnetfilter_queue.c |   31 +++++++++++++++++--------------
 1 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/src/libnetfilter_queue.c b/src/libnetfilter_queue.c
index 7e62317..7d0fb45 100644
--- a/src/libnetfilter_queue.c
+++ b/src/libnetfilter_queue.c
@@ -541,6 +541,8 @@ int nfq_handle_packet(struct nfq_handle *h, char *buf, int len)
  * - NFQNL_COPY_NONE - do not copy any data
  * - NFQNL_COPY_META - copy only packet metadata
  * - NFQNL_COPY_PACKET - copy entire packet
+ *
+ * \return -1 on error; >=0 otherwise.
  */
 int nfq_set_mode(struct nfq_q_handle *qh,
 		u_int8_t mode, u_int32_t range)
@@ -571,6 +573,8 @@ int nfq_set_mode(struct nfq_q_handle *qh,
  * Sets the size of the queue in kernel. This fixes the maximum number
  * of packets the kernel will store before internally before dropping
  * upcoming packets.
+ *
+ * \return -1 on error; >=0 otherwise.
  */
 int nfq_set_queue_maxlen(struct nfq_q_handle *qh,
 				u_int32_t queuelen)
@@ -670,6 +674,8 @@ static int __set_verdict(struct nfq_q_handle *qh, u_int32_t id,
  * Notifies netfilter of the userspace verdict for the given packet.  Every
  * queued packet _must_ have a verdict specified by userspace, either by
  * calling this function, or by calling the nfq_set_verdict_mark() function.
+ *
+ * \return -1 on error; >= 0 otherwise.
  */
 int nfq_set_verdict(struct nfq_q_handle *qh, u_int32_t id,
 		u_int32_t verdict, u_int32_t data_len, 
@@ -699,10 +705,12 @@ int nfq_set_verdict2(struct nfq_q_handle *qh, u_int32_t id,
  * \param qh Netfilter queue handle obtained by call to nfq_create_queue().
  * \param id	ID assigned to packet by netfilter.
  * \param verdict verdict to return to netfilter (NF_ACCEPT, NF_DROP)
- * \param mark mark to put on packet
+ * \param mark the mark to put on the packet, in network byte order.
  * \param data_len number of bytes of data pointed to by #buf
  * \param buf the buffer that contains the packet data
  *
+ * \return -1 on error; >= 0 otherwise.
+ *
  * This function is deprecated since it is broken, its use is highly
  * discouraged. Please, use nfq_set_verdict2 instead.
  */
@@ -848,11 +856,10 @@ u_int32_t nfq_get_physoutdev(struct nfq_data *nfad)
  * was received through
  * \param nlif_handle pointer to a nlif interface resolving handle
  * \param nfad Netlink packet data handle passed to callback function
- * \param name pointer that will be set to the interface name string 
+ * \param name pointer to the buffer to receive the interface name;
+ *  not more than \c IFNAMSIZ bytes will be copied to it.
  * \return -1 in case of error, >0 if it succeed. 
  *
- * The #name variable will point to the name of the input interface.
- *
  * To use a nlif_handle, You need first to call nlif_open() and to open
  * an handler. Don't forget to store the result as it will be used 
  * during all your program life:
@@ -894,10 +901,8 @@ int nfq_get_indev_name(struct nlif_handle *nlif_handle,
  * packet was received through
  * \param nlif_handle pointer to a nlif interface resolving handle
  * \param nfad Netlink packet data handle passed to callback function
- * \param name pointer that will be set to the interface name string 
- *
- * The #name variable will point to the name of the input physical
- * interface.
+ * \param name pointer to the buffer to receive the interface name;
+ *  not more than \c IFNAMSIZ bytes will be copied to it.
  *
  * See nfq_get_indev_name() documentation for nlif_handle usage.
  *
@@ -915,9 +920,8 @@ int nfq_get_physindev_name(struct nlif_handle *nlif_handle,
  * packet will be sent to
  * \param nlif_handle pointer to a nlif interface resolving handle
  * \param nfad Netlink packet data handle passed to callback function
- * \param name pointer that will be set to the interface name string 
- *
- * The #name variable will point to the name of the output interface.
+ * \param name pointer to the buffer to receive the interface name;
+ *  not more than \c IFNAMSIZ bytes will be copied to it.
  *
  * See nfq_get_indev_name() documentation for nlif_handle usage.
  *
@@ -935,9 +939,8 @@ int nfq_get_outdev_name(struct nlif_handle *nlif_handle,
  * packet will be sent to
  * \param nlif_handle pointer to a nlif interface resolving handle
  * \param nfad Netlink packet data handle passed to callback function
- * \param name pointer that will be set to the interface name string 
- * The #name variable will point to the name of the physical
- * output interface.
+ * \param name pointer to the buffer to receive the interface name;
+ *  not more than \c IFNAMSIZ bytes will be copied to it.
  *
  * See nfq_get_indev_name() documentation for nlif_handle usage.
  *
-- 
1.6.3.3


--------------040706070400010807090801--
