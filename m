From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: conntrack for samba/netbios-ns
Date: Wed, 05 Nov 2003 08:23:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068017027.807.15.camel@elendil.intranet.cartel-securite.net>
References: <20031105003401.GA11702@shell.blacknet.de>
	 <1067999419.7813.38.camel@tarkus>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1067999419.7813.38.camel@tarkus>
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
To: tedkaz@optonline.net
Cc: Goetz Bock <netfilter@blacknet.de>, netfilter <netfilter@lists.netfilter.org>

Le mer 05/11/2003 =E0 03:30, Ted Kaczmarek a =E9crit :
> udp is connectionless, not sure where you can get a state on it.

Connection <> state

State tracking applies to UDP and is based on timers. See Iptables
Tutorial for UDP state tracking :

http://iptables-tutorial.frozentux.net/chunkyhtml/udpconnections.html

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

