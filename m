From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: howto bind Mac to ip address
Date: 11 Aug 2003 16:08:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060610932.765.52.camel@elendil.intranet.cartel-securite.net>
References: <007601c35fe1$01eb3d20$142a45ca@shahid>
	 <20030811130508.GA11493@cannon.eng.us.uu.net>
	 <1060608510.765.39.camel@elendil.intranet.cartel-securite.net>
	 <20030811134839.GC11493@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030811134839.GC11493@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: Tariq Anwer <alien@aol.com.pk>, netfilter@lists.netfilter.org

Le lun 11/08/2003 =E0 15:48, Ramin Dousti a =E9crit :
> Absolutely. But let's back off a bit and take a look at the picture as =
a whole.
> We're talking about the internal users here. If someone is so ambisious=
 to do
> what you said, be sure they can do even more harm to you.

Without any doubt. This is a paranoid mesure to prevent mighty lusers or
big evil 3lle7 crackers who managed to get into the LAN to mess around
;)

> Besides, are you going to implement this at every single router on any
> LAN segment you have internally? Or is this solution meant for VSOHO?

Well, I do not think implementing a static ARP cache on the Linux NAT
box will be more a burden than doing almost the same using iptables with
mac match (as far as I understand what OP wants).

I mean once you have done this for one purpose (e.g. DHCP MAC based
assignement), there's not much left to do to generate a /etc/ethers like
file for filling ARP cache or generate a basic iptables ruleset.

> But, your point taken :-)

Was just for info and discussion, not for contradiction. Most of the
time, DHCP assignement as you told before is far sufficient to provide
an acceptable way to associate MAC and IP.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

