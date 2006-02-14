From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Reading /proc/net/ip_conntrack still slow / causing packet loss?
Date: Tue, 14 Feb 2006 19:39:23 +0200
Message-ID: <20060214173923.GN16512@edu.joroinen.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi!

http://ds9a.nl/klogbot/?year=3D2005&month=3D7&day=3D1&hour=3D16

quote from the url above:

"<Gandalf> cap_: the most extreme experience I have is reading
/proc/net/ip_conntrack on a fairly busy router... that really slows wthin=
gs
down and packets get dropped because of the slowdown"

"<Gandalf> and I had an identd daemon wich forwarding support that read
/p/n/ip_conntrack for each incoming ident request... 200ms forwarding del=
ays
and lots of drops each time an ident request came in :)"

Is that information still valid for the current 2.6 kernels? How about fo=
r
2.4 ?

Thanks!

-- Pasi K=E4rkk=E4inen

