From: kenr@redergaard-it.no
Subject: Loosing bytes in package
Date: Mon, 20 Oct 2003 21:55:27 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <61426.80.202.215.52.1066679727.squirrel@nymedia.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi,

I'm having problems with packages that are larger than 80 some bytes.

The packages come from a IPSec tunnel on the ipsec0 interface and are
routed to a host in the DMZ. The problem is that the package is
"truncated" at the end. When using ulogd and adding a rule in the FORWARD
chain to send the package to netlink I can see the complete pacakge,
nothing missing. But when running tcpdump at both the host in the DMZ and
eth1(DMZ) on the "router" the package is 40 bytes short.

Any suggestions on what might be happening?

With regards,
Ken A. Rederg=E5rd



