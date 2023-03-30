From: Florian Westphal <fw@strlen.de>
Subject: Re: Programmatically adding an element into a map using libnftnl
Date: Thu, 30 Mar 2023 22:17:46 +0200
Message-ID: <20230330201746.GD22079@breakpoint.cc>
References: <CAOg40qhcAoSdiTV5ievXf5wrQfoh_ZfF+GDVHqZ-Bhpf_JgCPQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOg40qhcAoSdiTV5ievXf5wrQfoh_ZfF+GDVHqZ-Bhpf_JgCPQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kiernan George <kbg98@vt.edu>
Cc: netfilter@vger.kernel.org

Kiernan George <kbg98@vt.edu> wrote:
> I have a map of the following format:
> 
> { type ipv4_addr . inet_service : ipv4_addr }
> 
> How do I add an element into the map using the libnftnl API? I see the
> example nft-set-elem-add.c, but it is not clear on how to modify this
> for different types of elements like concatenated IP/port above or
> IPV6.

There are no different types of elements, the kernel only sees a
bitstring, you only need to increment the size of the key/data as
needed.  Note that for concatenations, the sizes are rounded to one
register, i.e. the above needs 8 bytes for key and 4 bytes for data.

Only exception is concatenation with ranges, where a bit more
information is required (regarding boundaries).

The type information provided is needed for 'nft' to display the correct
content, without it it won't know what 0x123456790abc is supposed to
look like.

The type info bits are in nftables source code, in datatypes.h.

Patch to make set-elem-add example work with the modified example for map-add:

diff --git a/examples/nft-set-elem-add.c b/examples/nft-set-elem-add.c
--- a/examples/nft-set-elem-add.c
+++ b/examples/nft-set-elem-add.c
@@ -29,7 +29,8 @@ int main(int argc, char *argv[])
 	uint32_t portid, seq, family;
 	struct nftnl_set *s;
 	struct nftnl_set_elem *e;
-	uint16_t data;
+	uint32_t data, i;
+	uint32_t key[2];
 	int ret;
 
 	if (argc != 4) {
@@ -70,7 +71,11 @@ int main(int argc, char *argv[])
 	}
 
 	data = 0x1;
-	nftnl_set_elem_set(e, NFTNL_SET_ELEM_KEY, &data, sizeof(data));
+	for (i = 0; i < sizeof(key)/sizeof(*key); i++)
+		key[i] = htonl(i);
+
+	nftnl_set_elem_set(e, NFTNL_SET_ELEM_KEY, key, sizeof(key));
+	nftnl_set_elem_set(e, NFTNL_SET_ELEM_DATA, &data, sizeof(data));
 	nftnl_set_elem_add(s, e);
 
 	e = nftnl_set_elem_alloc();
@@ -78,8 +83,14 @@ int main(int argc, char *argv[])
 		perror("OOM");
 		exit(EXIT_FAILURE);
 	}
+
+
+	for (i = 0; i < sizeof(key)/sizeof(*key); i++)
+		key[i] = htonl(i + 1);
+
 	data = 0x2;
-	nftnl_set_elem_set(e, NFTNL_SET_ELEM_KEY, &data, sizeof(data));
+	nftnl_set_elem_set(e, NFTNL_SET_ELEM_KEY, key, sizeof(key));
+	nftnl_set_elem_set(e, NFTNL_SET_ELEM_DATA, &data, sizeof(data));
 	nftnl_set_elem_add(s, e);
 
 	batch = mnl_nlmsg_batch_start(buf, sizeof(buf));

> I hate to ask again, but is there documentation for the library somewhere?

Not that I know, patches welcome.
