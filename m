From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables: troubling identifying  devices
Date: Thu, 12 Feb 2004 18:51:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1076608270.1329.148.camel@elendil.intranet.cartel-securite.net>
References: <BFEIJHPOPCCMOPEKHHMOOEDOCNAA.giovanni.costagliola@nexusat.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BFEIJHPOPCCMOPEKHHMOOEDOCNAA.giovanni.costagliola@nexusat.it>
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
To: giovanni costagliola <giovanni.costagliola@nexusat.it>
Cc: netfilter@lists.netfilter.org

Le jeu 12/02/2004 =E0 18:29, giovanni costagliola a =E9crit :
> I've set up a star firewall with 3 physical NIC. I've configured two oh=
 them
> with multi-ip assignement.
> let's go to the core of the problem. it seems that the iface identified=
 by
> eth0_1, eth0_0 are not recognized by iptables.

Aliases are not interfaces, they're just another IP for an interface
answers ARP requests. That's why eth0:0, eth0:1, etc. usage is
deprecated.

Netfilter matches interfaces, real ones. So you can't match aliases
with. You'll have to use affected IP addresses and interface (i.e.
eth0).

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

