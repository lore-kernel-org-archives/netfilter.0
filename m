From: julien WICQUART <j.wicquart@newtech.fr>
Subject: SNAT and DNAT
Date: Tue, 26 Apr 2005 16:18:20 +0200
Message-ID: <426E4DAC.30900@newtech.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

i have a special situation.


(INTERNET) ===== 210.210.210.210/eth0|firewall|10.0.0.1/eth1 ===== 10.0.0.2|server|


I want to DNAT a port of my firewall on a server inside:
$IPTABLES -t nat -A PREROUTING -i eth0 -d 210.210.210.210 -p tcp --dport 200 -j DNAT
- --to-destination 10.0.0.2:200

but the server inside only accept packets from the IP of the inside interface of the firewall :
10.0.0.1 so i need that the source IP address of the packet sent by someone(x.x.x.x) on the internet
change in 10.0.0.1.

I try the SNAT, the MASQUERADE:
$IPTABLES -t nat -A POSTROUTING -o eth1 -s x.x.x.x -p tcp --dport 20000 -j SNAT --to 10.0.0.1
or
$IPTABLES -t nat -A POSTROUTING -o eth1 -s x.x.x.x -j MASQUERADE
it don't work.


Anyone know how to make this, DNAT and SNAT simultaneously.

Thanks.

- --

- --
Julien
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCbk2syavHQ2fnGwsRAugxAJ9uDT0Vnsai53XB0o7aMdghpz9ZEACeIkI+
rNvI7zZ8iaJcsNRnMCcjkvI=
=jaWr
-----END PGP SIGNATURE-----

