From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: how to block packets with specific words inside udp datagram???
Date: Sun, 12 Oct 2003 18:19:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065975594.4914.46.camel@elendil.intranet.cartel-securite.net>
References: <000d01c390d6$89b13900$0201a8c0@leonardo>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000d01c390d6$89b13900$0201a8c0@leonardo>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: "Piotr P." <peterp@poczta.onet.pl>
Cc: netfilter@lists.netfilter.org

Le dim 12/10/2003 =E0 17:35, Piotr P. a =E9crit :
>     Kazza jump over ports, and hosts (if yopu block destinations to
> kazza.com, rr1.kazza.com & rr2.kazza.com kazza uses ip's of other users=
 that
> was cached during last downloading anything from anyone). The key is, k=
azza
> use tah same word "KaZaA" inside an uupd datagram. Does any body know h=
ow to
> block traffic with this word using iptables?

You should have a look to string match that is available in
patch-o-matic. It will allow you to match an arbitrary string within
packet payload.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

