From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: ip_conntrack_http?
Date: 09 Dec 2002 22:32:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039469549.20570.24.camel@tux>
References: <1039450606.3df4c1ee704fd@mail.whstuart.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-RRcfIxjiBiXALZO5gxc8"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039450606.3df4c1ee704fd@mail.whstuart.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Chris Shepherd <chriss@whstuart.com>
Cc: Netfilter mailinglist <netfilter@lists.netfilter.org>


--=-RRcfIxjiBiXALZO5gxc8
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2002-12-09 at 17:16, Chris Shepherd wrote:

[big snip]
> What I'm wondering is twofold:
> 1) Did I do something wrong with my configuration?

No, this is how loadbalacing in iptables works, it balances the
individual connections.

> 2) If not, and this is by design, is there any module/could a module be written 
> that would track HTTP requests and forward ALL http requests from the same 
> connection to the same IP?

All http requests from the same connection? What do you mean? All
packets in a connection is forwarded to the same server. But not all
connections are forwarded to the same server.

> What happens now:
> CONN1a -> WS1
> CONN1b -> WS2
> CONN2a -> WS1
> CONN2b -> WS2
> 
> What should happen:
> CONN1a -> WS1
> CONN1b -> WS1
> CONN2a -> WS2
> CONN2b -> WS2
> 
> Provided that CONN1[ab] are related connections, but unrelated to CONN2[ab].

How do you relate http connections to each other?

> Is this possible with the current NetFilter setup? Must a module be written?

Depends on if it's possible to uniquely identify all connections that's
part of the same session or not. Only then it's possible to write a
module to do this. I don't know if that's possible.

One solution would be to forward all connections from a certain ip to a
certain server, this can be done with the SAME module if it's modified a
little (only permits SNAT at the moment IIRC).

I think I should remove this limit from SAME even if maybe you won't use
it, I'll go do that now. (Don't know why I put it in there in the first
place, guess I didn't think that it could be used for this).

Patch is attached, just patchyour kernel with the SAME patch from
patch-o-matic (after running './runme pending'). Then just patchit with
this patch and compile.

then it's just a matter of replacing -j SNAT with -j SAME and hope for
the best :)

(SAME has a --nodst option that makes it not include the destination
ipaddress in the calculation that decides which ip to redirect to,
probably doesn't matter in this situation)

If you try it, please report back and tell me if it works (it's
completely untested, but it should work :)

> I am very interested in knowing, because it could save myself and a few dozen 
> webdevs I know a lot of money that we'd be spending on a hardware connection-
> level load balancer.

Other options may be the LVS, Linux Virtual Server project. I believe
they have loadbalancers and stuff for http.

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

--=-RRcfIxjiBiXALZO5gxc8
Content-Disposition: attachment; filename=ipt_SAME.c-prerouting.diff
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=ipt_SAME.c-prerouting.diff; charset=ISO-8859-15

--- linux-2.4.20-rsn1/net/ipv4/netfilter/ipt_SAME.c.orig	2002-12-09 22:26:2=
0.000000000 +0100
+++ linux-2.4.20-rsn1/net/ipv4/netfilter/ipt_SAME.c	2002-12-09 22:28:10.000=
000000 +0100
@@ -60,7 +60,7 @@
 		DEBUGP("same_check: size %u.\n", targinfosize);
 		return 0;
 	}
-	if (hook_mask & ~(1 << NF_IP_POST_ROUTING)) {
+	if (hook_mask & ~(1 << NF_IP_PRE_ROUTING | 1 << NF_IP_POST_ROUTING)) {
 		DEBUGP("same_check: bad hooks %x.\n", hook_mask);
 		return 0;
 	}
@@ -146,7 +146,8 @@
 	struct ip_nat_multi_range newrange;
 	const struct ip_conntrack_tuple *t;
=20
-	IP_NF_ASSERT(hooknum =3D=3D NF_IP_POST_ROUTING);
+	IP_NF_ASSERT(hooknum =3D=3D NF_IP_PRE_ROUTING ||
+			hooknum =3D=3D NF_IP_POST_ROUTING);
 	ct =3D ip_conntrack_get(*pskb, &ctinfo);
=20
 	t =3D &ct->tuplehash[IP_CT_DIR_ORIGINAL].tuple;

--=-RRcfIxjiBiXALZO5gxc8--

