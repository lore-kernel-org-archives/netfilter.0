From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: howto bind Mac to ip address
Date: 11 Aug 2003 15:28:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060608510.765.39.camel@elendil.intranet.cartel-securite.net>
References: <007601c35fe1$01eb3d20$142a45ca@shahid>
	 <20030811130508.GA11493@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030811130508.GA11493@cannon.eng.us.uu.net>
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

Le lun 11/08/2003 =E0 15:05, Ramin Dousti a =E9crit :
> You know that the MAC address is only visible on the same ethernet link.
> Having said this, How are the IP addresses being assigned? If it's by
> DHCP, then you can assign each MAC, a well-known IP and filter based on
> that IP...

A malicious user can reconfigure manually its interface, or use ARP
cache poisoning to redirect trafic in order to listen/tamper/redirect
trafic or spoof another host. A good way to enforce IP/MAC associations
is static ARP cache :

	arp -s <HW> <IP> [-i <iface>]

Or :

	arp -f <file> [-i <iface>]

This way, you're sure your firewall won't answer a request from an IP
that uses a wrong MAC address.

> If not, then you must be on the same ethernet link and just
> use the the mac module (see "man iptables" and look for mac).

Netfilter mac match brings a second security layer that is redundant
with static ARP cache (redundancy is good for security stuff) especially
for logging MAC address change attempts.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

