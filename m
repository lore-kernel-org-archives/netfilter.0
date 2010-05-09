From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: libnetfilter_queue: mark-value byte ordering?
Date: Sun, 09 May 2010 23:49:12 +0200
Message-ID: <4BE72DD8.1000509@netfilter.org>
References: <4BE5B9CA.5090606@meta-dynamic.com> <4BE6AC04.5000504@tana.it>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020604000700080800040200"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BE6AC04.5000504@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Alessandro Vesely <vesely@tana.it>
Cc: David F <netfilter@meta-dynamic.com>, netfilter <netfilter@vger.kernel.org>, Eric Leblond <eleblond@edenwall.com>

This is a multi-part message in MIME format.
--------------020604000700080800040200
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Alessandro Vesely wrote:
> David F wrote:
>>  I changed my code to use htonl() on the mark-value prior to calling
>> nfq_set_verdict_mark(), and it all suddenly started working.
> 
> Since it is not documented, everyone rediscovers it anew. See e.g.
> http://www.gossamer-threads.com/lists/iptables/devel/62591

I have applied the following patch. I think that, at least, new users
will not hit this problem again. I'm very sorry that this was not fixed
before. Let me know if you are OK with it, we're still in time to revert
the patch attached.

--------------020604000700080800040200
Content-Type: text/x-patch;
 name="fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="fix.patch"

nfq: deprecate nfq_set_verdict_mark() in favour of nfq_set_verdict2()

From: Pablo Neira Ayuso <pablo@netfilter.org>

This patch deprecates nfq_set_verdict_mark() in favour of
nfq_set_verdict2() which does exactly the same but it also
convert the mark value from host-byte order to network-byte
order as expected by nfnetlink_queue.

I know, this is hackish, but I prefer adding new functions
instead of API versioning which is also ugly.

Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
---
 include/libnetfilter_queue/libnetfilter_queue.h |   20 ++++++++++++++------
 src/libnetfilter_queue.c                        |   19 +++++++++++++++++++
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/include/libnetfilter_queue/libnetfilter_queue.h b/include/libnetfilter_queue/libnetfilter_queue.h
index 1a72c51..88a9b8c 100644
--- a/include/libnetfilter_queue/libnetfilter_queue.h
+++ b/include/libnetfilter_queue/libnetfilter_queue.h
@@ -62,12 +62,20 @@ extern int nfq_set_verdict(struct nfq_q_handle *qh,
 			     u_int32_t data_len,
 			     unsigned char *buf);
 
-extern int nfq_set_verdict_mark(struct nfq_q_handle *qh, 
-				  u_int32_t id,
-			   	  u_int32_t verdict, 
-				  u_int32_t mark,
-			   	  u_int32_t datalen,
-				  unsigned char *buf);
+extern int nfq_set_verdict2(struct nfq_q_handle *qh,
+			    u_int32_t id,
+			    u_int32_t verdict, 
+			    u_int32_t mark,
+			    u_int32_t datalen,
+			    unsigned char *buf);
+
+extern __attribute__((deprecated))
+int nfq_set_verdict_mark(struct nfq_q_handle *qh, 
+			 u_int32_t id,
+			 u_int32_t verdict, 
+			 u_int32_t mark,
+			 u_int32_t datalen,
+			 unsigned char *buf);
 
 /* message parsing function */
 
diff --git a/src/libnetfilter_queue.c b/src/libnetfilter_queue.c
index df19519..7e62317 100644
--- a/src/libnetfilter_queue.c
+++ b/src/libnetfilter_queue.c
@@ -679,6 +679,22 @@ int nfq_set_verdict(struct nfq_q_handle *qh, u_int32_t id,
 }	
 
 /**
+ * nfq_set_verdict2 - like nfq_set_verdict, but you can set the mark.
+ * \param qh Netfilter queue handle obtained by call to nfq_create_queue().
+ * \param id	ID assigned to packet by netfilter.
+ * \param verdict verdict to return to netfilter (NF_ACCEPT, NF_DROP)
+ * \param mark mark to put on packet
+ * \param data_len number of bytes of data pointed to by #buf
+ * \param buf the buffer that contains the packet data
+ */
+int nfq_set_verdict2(struct nfq_q_handle *qh, u_int32_t id,
+		     u_int32_t verdict, u_int32_t mark,
+		     u_int32_t data_len, unsigned char *buf)
+{
+	return __set_verdict(qh, id, verdict, htonl(mark), 1, data_len, buf);
+}
+
+/**
  * nfq_set_verdict_mark - like nfq_set_verdict, but you can set the mark.
  * \param qh Netfilter queue handle obtained by call to nfq_create_queue().
  * \param id	ID assigned to packet by netfilter.
@@ -686,6 +702,9 @@ int nfq_set_verdict(struct nfq_q_handle *qh, u_int32_t id,
  * \param mark mark to put on packet
  * \param data_len number of bytes of data pointed to by #buf
  * \param buf the buffer that contains the packet data
+ *
+ * This function is deprecated since it is broken, its use is highly
+ * discouraged. Please, use nfq_set_verdict2 instead.
  */
 int nfq_set_verdict_mark(struct nfq_q_handle *qh, u_int32_t id,
 		u_int32_t verdict, u_int32_t mark,

--------------020604000700080800040200--
