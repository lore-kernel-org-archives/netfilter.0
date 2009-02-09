From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Second failover failure with conntrackd - INVALID packets
Date: Mon, 09 Feb 2009 12:29:24 +0100
Message-ID: <49901394.30504@netfilter.org>
References: <497760CB.6090008@univ-nantes.fr> <49778AF4.7000201@netfilter.org> <4978425F.1030003@univ-nantes.fr> <4978A4F8.5060901@netfilter.org> <4979BA72.50405@univ-nantes.fr> <497C4440.7050809@netfilter.org> <497CA7A2.2000906@netfilter.org> <497E0EA9.1020408@univ-nantes.fr> <497E40B0.2090709@netfilter.org> <4981D4EB.3060007@univ-nantes.fr> <49881800.20707@netfilter.org> <49896FEA.3050803@univ-nantes.fr> <4989713B.2010502@netfilter.org> <498C004A.20506@univ-nantes.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080805090203030709090201"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <498C004A.20506@univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: yoann.juet@univ-nantes.fr
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------080805090203030709090201
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi again Yoann,

Yoann Juet wrote:
> I'm still facing the same difficulties with conntrack-tools 0.9.10 and
> kernel 2.6.28.
> 
> Log on FW1 after the second failover:
> 
> Feb  6 09:55:46 FW-DSI-1-IRT kernel: [ 1352.601798] RULE -1 -- DENY
> IN=eth0 OUT=eth1 SRC=193.52.101.32 DST=172.18.244.10 LEN=255 TOS=0x00
> PREC=0x00 TTL=62 ID=8698 DF PROTO=TCP SPT=5222 DPT=34189 WINDOW=501
> RES=0x00 ACK PSH URGP=0
> 
> As you can see, this TCP connection is present:
> 
> root@fw1-irt:~# conntrack -L  |grep 34189
> conntrack v0.9.10 (conntrack-tools): 14 flow entries has been shown.
> tcp      6 10581 ESTABLISHED src=172.18.244.10 dst=193.52.101.32
> sport=34189 dport=5222 packets=63 bytes=12039 src=193.52.101.32
> dst=172.18.244.10 sport=5222 dport=34189 packets=58 bytes=22146
> [ASSURED] mark=0 secmark=0 use=1

This is weird, look like some problem in your scripts or the commit is
not working in node fw1-irt. The packet counters of the entry above show
that this is the old entry which is stuck in the cache after the second
failover. This should be deleted when fw1-irt's script issues the commit
(conntrackd -c). Does the log file tells that the commit was successful?

The following attached patch adds more verbose output to tell you that
some old entries has been deleted. Just in case that you need more
information for troubleshooting.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers

--------------080805090203030709090201
Content-Type: text/plain;
 name="y"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="y"

diff --git a/include/cache.h b/include/cache.h
index 371170d..4d2bbe8 100644
--- a/include/cache.h
+++ b/include/cache.h
@@ -82,6 +82,7 @@ struct cache {
 		uint32_t	upd_fail_enoent;
 
 		uint32_t	commit_ok;
+		uint32_t	commit_delete;
 		uint32_t	commit_fail;
 
 		uint32_t	flush;
diff --git a/src/cache_iterators.c b/src/cache_iterators.c
index e16a621..54613b9 100644
--- a/src/cache_iterators.c
+++ b/src/cache_iterators.c
@@ -134,6 +134,7 @@ retry:
 		if (errno == EEXIST && retry == 1) {
 			ret = nl_destroy_conntrack(tmp->h, ct);
 			if (ret == 0 || (ret == -1 && errno == ENOENT)) {
+				tmp->c->stats.commit_delete++;
 				if (retry) {
 					retry = 0;
 					goto retry;
@@ -179,6 +180,7 @@ void cache_commit(struct cache *c)
 {
 	unsigned int commit_ok = c->stats.commit_ok;
 	unsigned int commit_fail = c->stats.commit_fail;
+	unsigned int commit_delete = c->stats.commit_delete;
 	struct __commit_container tmp;
 	struct timeval commit_start, commit_stop, res;
 
@@ -199,6 +201,11 @@ void cache_commit(struct cache *c)
 	/* calculate new entries committed */
 	commit_ok = c->stats.commit_ok - commit_ok;
 	commit_fail = c->stats.commit_fail - commit_fail;
+	commit_delete = c->stats.commit_delete - commit_delete;
+
+	if (commit_delete)
+		dlog(LOG_NOTICE, "%u old entries deleted before "
+				 "commit", c->stats.commit_delete);
 
 	/* log results */
 	dlog(LOG_NOTICE, "Committed %u new entries", commit_ok);

--------------080805090203030709090201--
