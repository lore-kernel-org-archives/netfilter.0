From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Newbie: why is this packet being dropped/logged?
Date: 04 Aug 2003 09:40:39 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059982839.921.10.camel@elendil.intranet.cartel-securite.net>
References: <3F2DEB07.1060801@mega-bucks.co.jp>
	 <1059980959.926.1.camel@elendil.intranet.cartel-securite.net>
	 <3F2E0B71.9010408@mega-bucks.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F2E0B71.9010408@mega-bucks.co.jp>
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
To: Jean-Christian Imbeault <jc@mega-bucks.co.jp>
Cc: netfilter@lists.netfilter.org

Le lun 04/08/2003 =E0 09:29, Jean-Christian Imbeault a =E9crit :
> Cedric Blancher wrote:
> > Do you use patches such as tcp-nopickup that could make an ACK packet
> > fall into INVALID state because not matched against any existing
> > conntrack entry ?
> How can I check? I installed iptables v1.2.8 with no patches so I don't
> think I ahve tcp-nopickup installed.

Well, probably not this. Still, just add a logging rule for INVALID
packets, just to check. I may miss something obvious, but for now, I do
not see anything but an INVALID state to cause this packet get dropped.

Also check if your conntrack table is not full (see
/proc/net/ip_conntrack file) and kernel log entries for some related
errors.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

