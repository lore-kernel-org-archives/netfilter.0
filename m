From: Carles Xavier Munyoz =?iso-8859-1?q?Bald=F3?= <carles@descom.es>
Subject: H323 NAT.
Date: Tue, 15 Oct 2002 18:06:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210151806.05183.carles@descom.es>
Reply-To: carles@descom.es
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,
I'm having lot of problems with the ip_nat_h323 and ip_conntrack_h323=20
netfilter modules.

I have applied the patch-o-matic to the 2.4.19 kernel source and compile =
it in=20
my firewall.
I can load the modules with:
# modprobe ip_nat_h323

I have a h323 VoIP device behind my firewall and another one in the inter=
net.=20
When I call from the device behind the NAT-firewall, I can reach the devi=
ce=20
in the Internet. All VoIP data from the device behind the firewall arrive=
s to=20
the device in the internet, but all de VoIP data from the device in the=20
internet is sent to the private addres of the device behind the firewall,=
 and=20
never arrives to it.

It seems that the ip_nat_h323 module is not making its work. It is not=20
changing the source IP at the h323 aplication level.

I have seen the next logs in the /var/log/messages file:
Oct 15 17:47:47 fwtemplate kernel: ASSERT: ip_nat_core.c:838=20
&ip_conntrack_lock not readlocked
Oct 15 17:47:47 fwtemplate kernel: ASSERT ip_conntrack_core.c:93=20
&ip_conntrack_lock_R71150de5 readlocked

I'm using the last iptables version (1.2.7a).

May anyone help me with this ?
Any suggestions ?

Greetings.
- ---
Carles Xavier Munyoz Bald=F3
carles@descom.es
Descom Consulting
Telf: +34 965861024
Fax: +34 965861024
http://www.descom.es/
- ---
-----BEGIN PGP SIGNATURE-----
Version: PGP 6.5.8

iQA/AwUBPaw86jvYAf7VZNaaEQLZNACgn3lsxB5m17khtlSzfRd+OUpMy4gAn0E+
Or8bWYQESsQnb1QK8EFyaGB9
=3Dyrw1
-----END PGP SIGNATURE-----


