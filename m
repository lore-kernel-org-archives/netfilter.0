From: Alan Ezust <alan.ezust@presinet.com>
Subject: Re: problems building conntrack w/ uclibc - no output
Date: Tue, 28 Nov 2006 09:38:19 -0800
Message-ID: <200611280938.23127.alan.ezust@presinet.com>
References: <200611221144.00766.alan.ezust@presinet.com>
	<456BA0B8.3050607@netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1945130.3LbSQcm8zL";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <456BA0B8.3050607@netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@lists.netfilter.org

--nextPart1945130.3LbSQcm8zL
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 27 November 2006 18:36, Pablo Neira Ayuso wrote:

>
> Strange. Unfortunately I don't have access to such environment so I
> would require a considerable amount of time to set it up and I'm
> currently totally burden in many things. Could you run conntrack inside
> gdb and try to figure out what it wrong?

I can run gdb with conntrack on my own box (debian unstable x86), but that'=
s=20
got glibc and all the other modern libraries/tools. When I try to run it=20
there, I now get a segfault (posted about earlier). I wonder if this is=20
caused by one of the patchlets I applied from the patch-o-matic archive. In=
=20
any case, I already posted the stack trace and info about that attempt.

But anyway, to get conntrack running the embedded box, I build conntrack an=
d=20
its related libs in scratchbox, and then I send the binaries over to the=20
embedded box. And that's when I run into this weird problem which up to now=
=20
I've only been able to get strace running.=20

I am not sure how to debug conntrack in scratchbox because when I try to ru=
n=20
it, recalc_rebind_subscriptions: bind(netlink): Operation not permitted
conntrack v1.00beta2: Can't open handler

I'm also not sure yet how to build gdb for the embedded box - so far, every=
=20
time I try, it seems I am missing glibc or something that depends on glibc=
=20
(termcap). Are there instructions for configuring gdb for an embedded syste=
m=20
on top of uclibc anywhere? Or is there another debugger I should build=20
instead?






=2D-=20
Alan Ezust            www.presinet.com
Presinet, inc         alan.ezust@presinet.com
           Victoria, BC, Canada

--nextPart1945130.3LbSQcm8zL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFbHQPsJbtw6GURksRAqMCAJ9lu67auR1w42VXoLxMwaGn/yjp9gCbBBhu
2ueL6V6/daZ9EcQ2s6LdzhY=
=Nfvp
-----END PGP SIGNATURE-----

--nextPart1945130.3LbSQcm8zL--

