From: "Edgar Estrada Lopez" <estradaedgar@hotmail.com>
Subject: Selective Masquerading
Date: Sat, 24 Apr 2004 11:14:04 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY8-F97Fk2H3b98Ktd0002fb6f@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

HI guys:

I have a DSL @ 1mb, and another one @ 256kbps

I've been reading countless hours regarding the split access / load=20
balancing issue (most info in http://lartc.org) but for some strange reason=
,=20
things don't work the way they should.

Sometimes the split access works, other times a DSL begins an ARP flood=20
pointing all the ARP replies to the other DSL, and sometimes they just wont=
=20
work.

While giving a deep thought on why I got the 2 dsl, the answer is simple: S=
o=20
I could have fast downloads, and fast web browsing also.

So I was thinking: is there a way to masquerade  / direct all web browsing =

to the 256dsl, and leave the rest of the communications (higher ports) to=20
the 1 mbps line?

Thanks

_________________________________________________________________
Charla con tus amigos en l=EDnea mediante MSN Messenger: =20
http://messenger.microsoft.com/es


