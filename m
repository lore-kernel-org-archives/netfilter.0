From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Snort Output v. Iptables Log
Date: Wed, 05 Nov 2003 08:19:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068016744.817.10.camel@elendil.intranet.cartel-securite.net>
References: <1067984705.3989.8.camel@main.tqmcube.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1067984705.3989.8.camel@main.tqmcube.com>
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
To: IPTables List <netfilter@lists.netfilter.org>

Le mar 04/11/2003 =E0 23:25, David C. Hart a =E9crit :
> If I run snort, I get tons of these from a neighboring IP (I'm assuming
> "dirty" windows in contrast to anything malicious BTW).
> ----------------------------
> [**] MISC UPnP malformed advertisement [**]
> 11/04-16:25:15.492306 151.202.17.22:1901 -> 239.255.255.250:1900
> UDP TTL:150 TOS:0x0 ID:1 IpLen:20 DgmLen:355
> Len: 327
> ---------------------------

Destination is 239.255.255.250 which is a multicast address.

> None of these packets get logged by IPTables. To be sure, I added a
> "kitchen sink" rule at the very top specific to the offending IP with n=
o
> parameters:
> -A INPUT -s 151.202.17.22 -j LOG  --log-prefix "Firewall: " --log-level
> debug --log-tcp-sequence --log-tcp-options --log-ip-options

You won't see theses packets in INPUT chain unless your box is listening
to this very multicast address. Maybe you can try to catch it on
PREROUTING chain in mangle table...

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

