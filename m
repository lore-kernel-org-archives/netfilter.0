From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Adding a flag to a packet
Date: Wed, 31 Mar 2004 10:19:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080721191.1561.14.camel@anduril.intranet.cartel-securite.net>
References: <20040328155231.32b07799@darna.vectec.net>
	 <200403302150.40632.Antony@Soft-Solutions.co.uk>
	 <20040330170659.3000c03d@darna.vectec.net>
	 <200403302223.33019.Antony@Soft-Solutions.co.uk>
	 <20040330172840.491b9b4a@darna.vectec.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040330172840.491b9b4a@darna.vectec.net>
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
To: Cody Harris <hchs@ns.sympatico.ca>
Cc: netfilter@lists.netfilter.org

Le mar 30/03/2004 =E0 23:28, Cody Harris a =E9crit :
> Would the VPN also transmit the lan-based packets (such as the ones
> needed to run games).

IPSEC VPNs are layer3 based, so they route traffic. They can't transmit
layer 2 frames. If you need this, you have basicly two solutions :

	. ARP proxy / frame diverter / ebtables solution based in order
	  to extract frames from local network and route their IP
	  payload through the tunnel to the destination (see ebtables[1]
	  website for documentation for such a setting)
	. OpenVPN[2] solution that allows layer2 VPN, but without any
	  interroperability


[1] http://ebtables.sourceforge.net/
[2] http://openvpn.sourceforge.net/

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

