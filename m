From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [PATCH libnetfilter_queue 2/3] Payload buffer datatypes are consistent.
Date: Thu, 10 Jun 2010 15:06:29 +0200
Message-ID: <4C10E355.4020305@netfilter.org>
References: <1275720020-14058-1-git-send-email-netfilter@meta-dynamic.com> <1275720020-14058-2-git-send-email-netfilter@meta-dynamic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1275720020-14058-2-git-send-email-netfilter@meta-dynamic.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Favro <netfilter@meta-dynamic.com>
Cc: netfilter@vger.kernel.org

David Favro wrote:
> The 'data' parameter to nfq_get_payload() returns pointer to unsigned
> char (rather than signed char) to make it consistent with the 'buf'
> parameter of nfq_set_verdict(), nfq_set_verdict2(), and
> nfq_set_verdict_mark(), all of which refer to the same data.  Either
> signed or unsigned is fine, but they should be consistent as the output
> of nfq_get_payload() may be passed back into nfq_set_verdict*(); in that
> case, this change eliminates the need for typecasting in the calling
> code when using compilers that enforce strict typecasting.

Applied, I have also added this chunk to avoid a warning in the example
file.

diff --git a/utils/nfqnl_test.c b/utils/nfqnl_test.c
index 036bdab..9eebd9b 100644
--- a/utils/nfqnl_test.c
+++ b/utils/nfqnl_test.c
@@ -16,7 +16,7 @@ static u_int32_t print_pkt (struct nfq_data *tb)
        struct nfqnl_msg_packet_hw *hwph;
        u_int32_t mark,ifi;
        int ret;
-       char *data;
+       unsigned char *data;

        ph = nfq_get_msg_packet_hdr(tb);
        if (ph) {
