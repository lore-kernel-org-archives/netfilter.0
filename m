From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: [PATCH 22/29] : nf_conntrack_sctp: const annotations
Date: Tue, 25 Mar 2008 19:30:14 +0100
Message-ID: <19daf95d422d8bda7c0f3581227412d224eb005a.1206469820.git.jengelh@computergmbh.de>
References: <alpine.LNX.1.10.0803251914060.2240@fbirervta.pbzchgretzou.qr>
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0803251914060.2240@fbirervta.pbzchgretzou.qr>
In-Reply-To: <720350a38b1dbd43c907d5d81decd6edd6725d81.1206469820.git.jengelh@computergmbh.de>
References: <720350a38b1dbd43c907d5d81decd6edd6725d81.1206469820.git.jengelh@computergmbh.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kaber@trash.net
Cc: netfilter@vger.kernel.org, Jan Engelhardt <jengelh@computergmbh.de>

Signed-off-by: Jan Engelhardt <jengelh@computergmbh.de>
---
 net/netfilter/nf_conntrack_proto_sctp.c |   17 +++++++++++------
 1 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/net/netfilter/nf_conntrack_proto_sctp.c b/net/netfilter/nf_conntrack_proto_sctp.c
index e7dab58..ea86de4 100644
--- a/net/netfilter/nf_conntrack_proto_sctp.c
+++ b/net/netfilter/nf_conntrack_proto_sctp.c
@@ -33,7 +33,7 @@ static DEFINE_RWLOCK(sctp_lock);
 
    And so for me for SCTP :D -Kiran */
 
-static const char *sctp_conntrack_names[] = {
+static const char *const sctp_conntrack_names[] = {
 	"NONE",
 	"CLOSED",
 	"COOKIE_WAIT",
@@ -133,7 +133,8 @@ static const u8 sctp_conntracks[2][9][SCTP_CONNTRACK_MAX] = {
 static bool sctp_pkt_to_tuple(const struct sk_buff *skb, unsigned int dataoff,
                               struct nf_conntrack_tuple *tuple)
 {
-	sctp_sctphdr_t _hdr, *hp;
+	const struct sctphdr *hp;
+	struct sctphdr _hdr;
 
 	/* Actually only need first 8 bytes. */
 	hp = skb_header_pointer(skb, dataoff, 8, &_hdr);
@@ -291,8 +292,10 @@ static int sctp_packet(struct nf_conn *ct,
 {
 	enum sctp_conntrack new_state, old_state;
 	enum ip_conntrack_dir dir = CTINFO2DIR(ctinfo);
-	sctp_sctphdr_t _sctph, *sh;
-	sctp_chunkhdr_t _sch, *sch;
+	const struct sctphdr *sh;
+	struct sctphdr _sctph;
+	const struct sctp_chunkhdr *sch;
+	struct sctp_chunkhdr _sch;
 	u_int32_t offset, count;
 	unsigned long map[256 / sizeof(unsigned long)] = { 0 };
 
@@ -393,8 +396,10 @@ static bool sctp_new(struct nf_conn *ct, const struct sk_buff *skb,
                      unsigned int dataoff)
 {
 	enum sctp_conntrack new_state;
-	sctp_sctphdr_t _sctph, *sh;
-	sctp_chunkhdr_t _sch, *sch;
+	const struct sctphdr *sh;
+	struct sctphdr _sctph;
+	const struct sctp_chunkhdr *sch;
+	struct sctp_chunkhdr _sch;
 	u_int32_t offset, count;
 	unsigned long map[256 / sizeof(unsigned long)] = { 0 };
 
-- 
1.5.4.4

