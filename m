From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: 2.6.0-test9, bridge firewall, interface specification
Date: Thu, 06 Nov 2003 22:52:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068155572.818.19.camel@elendil.intranet.cartel-securite.net>
References: <200311061407.23335.timg@tpi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311061407.23335.timg@tpi.com>
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
To: timg@tpi.com
Cc: netfilter@lists.netfilter.org

Le jeu 06/11/2003 =E0 22:07, Tim Gardner a =E9crit :
> I have a well behaved bridge firewall using 2.4.22 with the relevant P-=
O-M=20
> patches applied. In testing 2.6.0-test9 I have determined that interfac=
e=20
> specification on a rule no longer works. For example, the first rule in=
 the=20
> set that should catch 99% of all inbound TCP packets is
>=20
> iptables -A FORWARD -i $EXTIF -m state --state ESTABLISHED,RELATED -j A=
CCEPT
>=20
> If the interface is specifed, then this rule does not accrue any packet=
s. Is=20
> this an expected change in behavior from 2.4.22?

When using a bridged firewall with 2.6 kernels, inbound interface is
bridge interface, i.e. br0, and it is outbound one as well...
That's why you have physdev match that allows one to match the
_physical_ interface, among all ones belonging to the bridge, that
actually received the packet.


cbr@elendil:~$ iptables -m physdev --help
iptables v1.2.8
[...]
physdev v1.2.8 options:
 --physdev-in [!] input name[+] bridge port name ([+] for wildcard)
 --physdev-out [!] output name[+] bridge port name ([+] for wildcard)


So, in your case :

	iptables -A FORWARD -i br0 -m physdev --physdev-in $EXTIF \
		-m state --state ESTABLISHED,RELATED -j ACCEPT

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

