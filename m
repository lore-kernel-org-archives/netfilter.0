From: dpates@dsdk12.net
Subject: Fixes for libiptc
Date: Sun, 17 Aug 2003 15:03:44 -0600 (MDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1061154224.3f3fedb029b57@www.dsdk12.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="-MOQ10611542242b6a9e6b46db64d0553c53b44c06bb5d"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This message is in MIME format.

---MOQ10611542242b6a9e6b46db64d0553c53b44c06bb5d
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

In the process of developing the IPTables::IPv4 Perl module, I've run up =
against
certain issues in libiptc itself that required some modding on my part to=
 make
it work as it should. Also, in the process of analyzing/debugging, I've m=
ade a
couple minor changes to eliminate warnings from the tools I was using
(specifically valgrind). The changes I've made are:

  - Setting iptc_fn in every externally-accessible function. I've run int=
o cases
where incorrect errors were returned because a function previously called=
 set
iptc_fn, but the one actually causing an error, called afterward, did not=
. This
causes confusing error messages to be returned.

  - memset()'ing memory areas to be passed as arguments to setsockopt().
valgrind points out that not all the memory in these areas was being set =
to
useful values, potentially providing bad data to kernelspace.

  - Adding refcounting on the sockfd file descriptor. If more than one ta=
ble is
open at once, libiptc would happily overwrite the previous file descripto=
r, and
then close it before all open tables got a chance to commit or be release=
d. This
corrects that, only close()'ing it when the last table handle is passed t=
o
TC_FREE().

The patch is attached.

--
Derrik Pates
dpates@dsdk12.net

---MOQ10611542242b6a9e6b46db64d0553c53b44c06bb5d
Content-Type: text/plain; name="my-libiptc-fixes.diff"; charset=ISO-8859-1
Content-Disposition: attachment; filename="my-libiptc-fixes.diff"
Content-Transfer-Encoding: quoted-printable

--- /tmp/libiptc.c	2003-08-17 13:55:24.000000000 -0400
+++ libiptc/libiptc.c	2003-08-17 13:56:23.000000000 -0400
@@ -30,6 +30,7 @@
 #endif
=20
 static int sockfd =3D -1;
+static int sockfd_use =3D 0;
 static void *iptc_fn =3D NULL;
=20
 static const char *hooknames[]
@@ -253,30 +254,33 @@
=20
 	iptc_fn =3D TC_INIT;
=20
-	if (sockfd !=3D -1) {
-		close(sockfd);
-		sockfd =3D -1;
-	}
-
 	if (strlen(tablename) >=3D TABLE_MAXNAMELEN) {
 		errno =3D EINVAL;
 		return NULL;
 	}
 =09
-	sockfd =3D socket(TC_AF, SOCK_RAW, IPPROTO_RAW);
-	if (sockfd < 0)
-		return NULL;
+	if (sockfd_use =3D=3D 0) {
+		sockfd =3D socket(TC_AF, SOCK_RAW, IPPROTO_RAW);
+		if (sockfd < 0)
+			return NULL;
+	}
+	sockfd_use++;
=20
 	s =3D sizeof(info);
=20
 	strcpy(info.name, tablename);
-	if (getsockopt(sockfd, TC_IPPROTO, SO_GET_INFO, &info, &s) < 0)
+	if (getsockopt(sockfd, TC_IPPROTO, SO_GET_INFO, &info, &s) < 0) {
+		sockfd_use--;
 		return NULL;
+	}
=20
 	if ((h =3D alloc_handle(info.name, info.size, info.num_entries))
 	    =3D=3D NULL) {
-		close(sockfd);
-		sockfd =3D -1;
+		sockfd_use--;
+		if (sockfd_use =3D=3D 0) {
+			close(sockfd);
+			sockfd =3D -1;
+		}
 		return NULL;
 	}
=20
@@ -310,8 +314,11 @@
=20
 	if (getsockopt(sockfd, TC_IPPROTO, SO_GET_ENTRIES, &h->entries,
 		       &tmp) < 0) {
-		close(sockfd);
-		sockfd =3D -1;
+		sockfd_use--;
+		if (sockfd_use =3D=3D 0) {
+			close(sockfd);
+			sockfd =3D -1;
+		}
 		free(h);
 		return NULL;
 	}
@@ -323,8 +330,12 @@
 void
 TC_FREE(TC_HANDLE_T *h)
 {
-	close(sockfd);
-	sockfd =3D -1;
+	iptc_fn =3D TC_FREE;
+	sockfd_use--;
+	if (sockfd_use =3D=3D 0) {
+		close(sockfd);
+		sockfd =3D -1;
+	}
 	if ((*h)->cache_chain_heads)
 		free((*h)->cache_chain_heads);
 	free(*h);
@@ -343,6 +354,7 @@
 void
 TC_DUMP_ENTRIES(const TC_HANDLE_T handle)
 {
+	iptc_fn =3D TC_DUMP_ENTRIES;
 	CHECK(handle);
=20
 	printf("libiptc v%s.  %u entries, %u bytes.\n",
@@ -483,6 +495,7 @@
 /* Does this chain exist? */
 int TC_IS_CHAIN(const char *chain, const TC_HANDLE_T handle)
 {
+	iptc_fn =3D TC_IS_CHAIN;
 	return find_label(chain, handle) !=3D NULL;
 }
=20
@@ -527,6 +540,7 @@
 const char *
 TC_FIRST_CHAIN(TC_HANDLE_T *handle)
 {
+	iptc_fn =3D TC_FIRST_CHAIN;
 	if ((*handle)->cache_chain_heads =3D=3D NULL
 	    && !populate_cache(*handle))
 		return NULL;
@@ -541,6 +555,7 @@
 const char *
 TC_NEXT_CHAIN(TC_HANDLE_T *handle)
 {
+	iptc_fn =3D TC_NEXT_CHAIN;
 	(*handle)->cache_chain_iteration++;
=20
 	if ((*handle)->cache_chain_iteration - (*handle)->cache_chain_heads
@@ -556,6 +571,7 @@
 {
 	struct chain_cache *c;
=20
+	iptc_fn =3D TC_FIRST_RULE;
 	c =3D find_label(chain, *handle);
 	if (!c) {
 		errno =3D ENOENT;
@@ -574,6 +590,7 @@
 const STRUCT_ENTRY *
 TC_NEXT_RULE(const STRUCT_ENTRY *prev, TC_HANDLE_T *handle)
 {
+	iptc_fn =3D TC_NEXT_RULE;
 	if ((void *)prev + prev->next_offset
 	    =3D=3D (void *)(*handle)->cache_rule_end)
 		return NULL;
@@ -589,6 +606,7 @@
 	unsigned int off =3D 0;
 	STRUCT_ENTRY *start, *end;
=20
+	iptc_fn =3D TC_NUM_RULES;
 	CHECK(*handle);
 	if (!find_label(&off, chain, *handle)) {
 		errno =3D ENOENT;
@@ -608,6 +626,7 @@
 {
 	unsigned int pos =3D 0, chainindex;
=20
+	iptc_fn =3D TC_GET_RULE;
 	CHECK(*handle);
 	if (!find_label(&pos, chain, *handle)) {
 		errno =3D ENOENT;
@@ -666,6 +685,7 @@
 const char *TC_GET_TARGET(const STRUCT_ENTRY *e,
 			  TC_HANDLE_T *handle)
 {
+	iptc_fn =3D TC_GET_TARGET;
 	return target_name(*handle, e);
 }
=20
@@ -675,6 +695,7 @@
 {
 	unsigned int i;
=20
+	iptc_fn =3D TC_BUILTIN;
 	for (i =3D 0; i < NUMHOOKS; i++) {
 		if ((handle->info.valid_hooks & (1 << i))
 		    && handle->hooknames[i]
@@ -694,6 +715,7 @@
 	STRUCT_ENTRY *e;
 	int hook;
=20
+	iptc_fn =3D TC_GET_POLICY;
 	hook =3D TC_BUILTIN(chain, *handle);
 	if (hook !=3D 0)
 		start =3D (*handle)->info.hook_entry[hook-1];
@@ -1197,6 +1219,7 @@
 		STRUCT_ENTRY *entry,
 		TC_HANDLE_T *handle)
 {
+	iptc_fn =3D TC_CHECK_PACKET;
 	errno =3D ENOSYS;
 	return NULL;
 }
@@ -1234,6 +1257,7 @@
 	unsigned int i, end;
 	struct chain_cache *c;
=20
+	iptc_fn =3D TC_ZERO_ENTRIES;
 	if (!(c =3D find_label(chain, *handle))) {
 		errno =3D ENOENT;
 		return 0;
@@ -1437,6 +1461,7 @@
 {
 	struct chain_cache *c;
=20
+	iptc_fn =3D TC_GET_REFERENCES;
 	if (!(c =3D find_label(chain, *handle))) {
 		errno =3D ENOENT;
 		return 0;
@@ -1627,6 +1652,7 @@
 	unsigned int i;
 	size_t counterlen;
=20
+	iptc_fn =3D TC_COMMIT;
 	CHECK(*handle);
=20
 	counterlen =3D sizeof(STRUCT_COUNTERS_INFO)
@@ -1645,6 +1671,7 @@
 		errno =3D ENOMEM;
 		return 0;
 	}
+	memset(repl, 0, sizeof(*repl) + (*handle)->entries.size);
=20
 	/* These are the old counters we will get from kernel */
 	repl->counters =3D malloc(sizeof(STRUCT_COUNTERS)
@@ -1654,6 +1681,8 @@
 		errno =3D ENOMEM;
 		return 0;
 	}
+	memset(repl->counters, 0, sizeof(STRUCT_COUNTERS)
+			* (*handle)->info.num_entries);
=20
 	/* These are the counters we're going to put back, later. */
 	newcounters =3D malloc(counterlen);
@@ -1663,6 +1692,7 @@
 		errno =3D ENOMEM;
 		return 0;
 	}
+	memset(newcounters, 0, counterlen);
=20
 	strcpy(repl->name, (*handle)->info.name);
 	repl->num_entries =3D (*handle)->new_number;

---MOQ10611542242b6a9e6b46db64d0553c53b44c06bb5d--

