From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset causes reverse dns lookups?
Date: Mon, 16 Apr 2012 11:55:26 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1204161126050.20321@blackhole.kfki.hu>
References: <4F8B5925.5020307@wildgooses.com> <4F8B72BB.4010307@wildgooses.com> <4F8B90C4.3070600@wildgooses.com> <alpine.DEB.2.00.1204161001040.20321@blackhole.kfki.hu> <4F8BDA57.4090701@wildgooses.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F8BDA57.4090701@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ed W <lists@wildgooses.com>
Cc: netfilter <netfilter@vger.kernel.org>

On Mon, 16 Apr 2012, Ed W wrote:

> On 16/04/2012 09:08, Jozsef Kadlecsik wrote:
> > Hostname and IP address are both supported as input and resolved
> > internally by getaddrinfo. That can generate DNS lookups, depeding on the
> > resolver library. What kind of system do you use, with which
> > resolver/libc version?
> 
> Thanks so much for replying!
> 
> This is a uclibc 0.9.33.1 system, x86. Resolver chain is /etc/hosts, then dns.
> Local dnsmasq is installed.
> 
> I can very clearly observe that on something like "ipset add", if I add
> something that isn't quite an IP address then it generates a name lookup. What
> I'm confused by is why the reverse ip lookup for the ip address?  I have
> traced it back I think to the parser.c code, but I concede I'm stuck
> understanding even what is generating the lookup?  You mention resolver, so
> presumably it's a side effect of some other call, but could you spare a minute
> to explain the trigger please?  (just interested in the background in case it
> occurs elsewhere?)

That comes from the implementation of "getaddrinfo" in uclibc then. ipset 
itself does not force reverse DNS lookups.
 
> > I could suppress DNS lookups with the price of calling twice getaddrinfo.
> 
> You are presumably giving me a clue as the source here!
> 
> It would not appear to be a significant performance decrease for the normal
> situation to call twice?  Given the outside edge case of 1+ min delays I'm
> definitely interested in such a change?
> 
> Is there any chance of a tentative patch or at least a stronger hint at what I
> should change in order that I could deploy something quite imminently?  Its
> become a bit of a blocker here...  Obviously I'm asking with as much icing as
> possible and a huge cherry on top...

Try the following untested patch:

diff --git a/lib/parse.c b/lib/parse.c
index 30efdb6..8b86492 100644
--- a/lib/parse.c
+++ b/lib/parse.c
@@ -8,6 +8,7 @@
 #include <errno.h>				/* errno */
 #include <limits.h>				/* ULLONG_MAX */
 #include <netdb.h>				/* getservbyname, getaddrinfo */
+#include <string.h>				/* str* */
 #include <stdlib.h>				/* strtoull, etc. */
 #include <sys/types.h>				/* getaddrinfo */
 #include <sys/socket.h>				/* getaddrinfo, AF_ */
@@ -687,6 +688,18 @@ call_getaddrinfo(struct ipset_session *session, const char *str,
 	hints.ai_protocol = 0;
 	hints.ai_next = NULL;
 
+	if (family == NFPROTO_IPV6) {
+		if (strchr(str, ':') != NULL)
+			hints.ai_flags |= AI_NUMERICHOST;
+	} else {
+		if (strspn(str, "0123456789.") == strlen(str))
+			hints.ai_flags |= AI_NUMERICHOST;
+	}
+	if ((err = getaddrinfo(str, NULL, &hints, &res)) != 0)
+		hints.ai_flags &= ~AI_NUMERICHOST;
+	else
+		return res;
+
 	if ((err = getaddrinfo(str, NULL, &hints, &res)) != 0) {
 		syntax_err("cannot resolve '%s' to an %s address: %s",
 			   str, family == NFPROTO_IPV6 ? "IPv6" : "IPv4",

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
