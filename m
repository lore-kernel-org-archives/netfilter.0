From: Moritz Gartenmeister <moritz@uplink-verein.ch>
Subject: CONNMARK.so
Date: Tue, 23 Nov 2004 22:22:25 +0100
Message-ID: <41A3AA11.5080500@uplink-verein.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

hi all

how can i compile connmark.so? i allready installed iptables with l7-patch =
and patch-o-matic. i=20
forgot to include connmark at the beginning. how can i do this afterwards? =
i just need the=20
appropriate gcc -flags -ld and so on...

i'm now using a lot of -j MARK --set-mark, but i don't use connmark-save an=
d connmark-restore. but i=20
would like to ;-) or does --set-mark set a mark on the connection? imo, it =
makes a mark on the paket=20
and with connmark-save/restore it is possible to keep a mark on the connect=
ion.

regards
moritz

--=20
Uplink student association
Moritz Gartenmeister
B=FClachstrasse 1 F
8057 Z=FCrich
Switzerland

