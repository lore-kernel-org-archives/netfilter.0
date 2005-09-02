From: "Christian Bricart" <christian@bricart.de>
Subject: only SNAT packets originating from local?
Date: Fri, 2 Sep 2005 15:35:07 +0200 (CEST)
Message-ID: <42410.80.87.162.74.1125668107.squirrel@aachalon.de>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

is there a simple way to do SNAT for packets that originate from the
router itself?
I want to set a static IP for a multihomed router that does forwarding, t=
oo.

I've tried to set:

iptables -t nat -I POSTROUTING -p tcp --dport 4711 -j SNAT --to-source
1.2.3.4

but that does SNAT on forwardes packets, too..
Do I miss a rule on "-t filter OUTPUT"? maybe mangle with -j MARK and SNA=
T
packets that have a mark set?

Christian

