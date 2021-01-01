From: Eyal Birger <eyal.birger@gmail.com>
Subject: [PATCH libnetfilter_conntrack] examples: check return value of nfct_nlmsg_build()
Date: Fri,  1 Jan 2021 10:58:29 +0200
Message-ID: <20210101085829.3234885-1-eyal.birger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3rTFGzMpliTK8eU+crhwZi2oWKxeWCChv9Szw1tH6ls=;
        b=QD+H0uX42igyWks+XcU2Sfw8s4U4aTLUVMSajykjDGOAasKJF0Oaylb+TxDZXybky8
         9/13eGXJIApY0ZtsfgJcVSr3WwHh/BxyFLL+OlW0s4HXY1PdNxNnwTZqGL25D2GWyZTS
         Vik6Tmm3ggZKDU7xdORC/tmqh3W02aNRR9lSwfo3jQMonmtij22KczQZrs76jIqOtwEe
         GiW6t+TDj0DuMJShznEDUBwu9WCrTe7RS4QgvszGKlY/AgSo0hz8d9UmagE+iZjpjh37
         sbe8axnBIP/RhB95y/kCCtpmvG/vPp6wvxqh59rbO09OgThH9GBR8Zge/gkJUA7cvDnT
         ZxLQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Eyal Birger <eyal.birger@gmail.com>

nfct_nlmsg_build() may fail for different reasons, for example if
insufficient parameters exist in the ct object. The resulting nlh would
not contain any of the ct attributes.

Some conntrack operations would still operate in such case, for example
an IPCTNL_MSG_CT_DELETE message would just delete all existing conntrack
entries.

While the example as it is does supply correct parameters, it's safer
as reference to validate the return value.

Signed-off-by: Eyal Birger <eyal.birger@gmail.com>
---
 examples/nfct-mnl-create.c    | 6 +++++-
 examples/nfct-mnl-del.c       | 6 +++++-
 examples/nfct-mnl-get.c       | 6 +++++-
 examples/nfct-mnl-set-label.c | 7 ++++++-
 4 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/examples/nfct-mnl-create.c b/examples/nfct-mnl-create.c
index 64387a7..7fd224d 100644
--- a/examples/nfct-mnl-create.c
+++ b/examples/nfct-mnl-create.c
@@ -60,7 +60,11 @@ int main(void)
 	nfct_set_attr_u8(ct, ATTR_TCP_STATE, TCP_CONNTRACK_SYN_SENT);
 	nfct_set_attr_u32(ct, ATTR_TIMEOUT, 100);
 
-	nfct_nlmsg_build(nlh, ct);
+	ret = nfct_nlmsg_build(nlh, ct);
+	if (ret == -1) {
+		perror("nfct_nlmsg_build");
+		exit(EXIT_FAILURE);
+	}
 
 	ret = mnl_socket_sendto(nl, nlh, nlh->nlmsg_len);
 	if (ret == -1) {
diff --git a/examples/nfct-mnl-del.c b/examples/nfct-mnl-del.c
index 91ad9e4..806d9f8 100644
--- a/examples/nfct-mnl-del.c
+++ b/examples/nfct-mnl-del.c
@@ -55,7 +55,11 @@ int main(void)
 	nfct_set_attr_u16(ct, ATTR_PORT_SRC, htons(20));
 	nfct_set_attr_u16(ct, ATTR_PORT_DST, htons(10));
 
-	nfct_nlmsg_build(nlh, ct);
+	ret = nfct_nlmsg_build(nlh, ct);
+	if (ret == -1) {
+		perror("nfct_nlmsg_build");
+		exit(EXIT_FAILURE);
+	}
 
 	ret = mnl_socket_sendto(nl, nlh, nlh->nlmsg_len);
 	if (ret == -1) {
diff --git a/examples/nfct-mnl-get.c b/examples/nfct-mnl-get.c
index 4858acf..5be3331 100644
--- a/examples/nfct-mnl-get.c
+++ b/examples/nfct-mnl-get.c
@@ -74,7 +74,11 @@ int main(void)
 	nfct_set_attr_u16(ct, ATTR_PORT_SRC, htons(20));
 	nfct_set_attr_u16(ct, ATTR_PORT_DST, htons(10));
 
-	nfct_nlmsg_build(nlh, ct);
+	ret = nfct_nlmsg_build(nlh, ct);
+	if (ret == -1) {
+		perror("nfct_nlmsg_build");
+		exit(EXIT_FAILURE);
+	}
 
 	ret = mnl_socket_sendto(nl, nlh, nlh->nlmsg_len);
 	if (ret == -1) {
diff --git a/examples/nfct-mnl-set-label.c b/examples/nfct-mnl-set-label.c
index c52b267..50bebb0 100644
--- a/examples/nfct-mnl-set-label.c
+++ b/examples/nfct-mnl-set-label.c
@@ -19,6 +19,7 @@ static void set_label(struct nf_conntrack *ct, struct callback_args *cbargs)
 	char buf[MNL_SOCKET_BUFFER_SIZE];
 	struct nlmsghdr *nlh;
 	struct nfgenmsg *nfh;
+	int ret;
 
 	if (b) {
 		if (bit < 0)
@@ -55,7 +56,11 @@ static void set_label(struct nf_conntrack *ct, struct callback_args *cbargs)
 	nfh->version = NFNETLINK_V0;
 	nfh->res_id = 0;
 
-	nfct_nlmsg_build(nlh, ct);
+	ret = nfct_nlmsg_build(nlh, ct);
+	if (ret == -1) {
+		perror("nfct_nlmsg_build");
+		exit(EXIT_FAILURE);
+	}
 
 	if (mnl_socket_sendto(cbargs->nl, nlh, nlh->nlmsg_len) < 0)
 		perror("mnl_socket_sendto");
-- 
2.25.1

