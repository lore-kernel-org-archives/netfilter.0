From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Can't DROP spoofed packet. Bug or feature ?
Date: Mon, 06 Oct 2003 17:00:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065452437.822.108.camel@elendil.intranet.cartel-securite.net>
References: <52208.212.239.118.101.1065447313.squirrel@www.frumar.it>
	 <1065448509.815.56.camel@elendil.intranet.cartel-securite.net>
	 <53468.212.239.118.101.1065450686.squirrel@www.frumar.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <53468.212.239.118.101.1065450686.squirrel@www.frumar.it>
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
To: pigi@pigi.org
Cc: netfilter@lists.netfilter.org

Le lun 06/10/2003 =E0 16:31, pigi a =E9crit :
> Anyway this is the workaround, but I would like to DROP it in my rules =
if
> possible, so the packet cannot reach the routing point in kernel.
> Is this possible ?

Yes you can. Just desactivate rp_filters (echo 0 >
/proc/sys/net/ipv4/conf/all/rp_filters) and filter within INPUT and
FORWARD chains, according to your routing table. But you'll have to
handle all cases, what can be tricky if you have many interfaces. Or do
it within PREROUTING chain which is not the prefered place for
filtering.

What I told you before was why your packet did not reach INPUT chain.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

