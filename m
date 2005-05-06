From: =?iso-8859-1?q?Albrecht_Dre=DF?= <albrecht.dress@arcor.de>
Subject: Help: iptables NAT broken with pppoe
Date: Fri, 06 May 2005 16:36:16 +0000
Message-ID: <1115397393l.3864l.0l@antares.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-685BPy2WvMVtHwgEBJux"
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
To: netfilter@lists.netfilter.org

--=-685BPy2WvMVtHwgEBJux
Content-Type: multipart/mixed; boundary="=-V2tve2QBcI438JDQM1oR"

--=-V2tve2QBcI438JDQM1oR
Content-Type: text/plain; charset=ISO-8859-15; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I am new to this list, so please xcuse me if this is a dumb question.

I have a small home network looking as follows:

         192.168.42.3
         -----------     -------
        | PMac G4   |   |       |---DSL Modem (ppp0)
ISDN---|ippp0  eth0|---|Switch |---two computers, printer (192.168.42.x)
         -----------     -------

The machine marked as "PMac G4" is a Powermac G4/800 "Silver", running =20
Linux 2.6.11.4 on the Yellowdog 4.01 disto, which includes iptables v1.2.9.

I had an "old" setup with the G4 working as router via the isdn adaptor, =20
which worked flawlessly. I now switched to ADSL, so I removed the ISDN =20
connection and just changed to ppp0 using the kernel-based pppoe driver.

Now the machines in my "local" net can still connect the G4, but =20
nat/masquerading to the outside world fails. I stripped down my ipfilter =20
config to a completely open one (see attached fw.sh script), but still had =
=20
no success.

Running tcpdump on both eth0 and ppp0, I saw that e.g. a http request from =
=20
one of the local machines (see 2nd attachment) is actually passed via ppp0 =
=20
to the remote host. However, all reply packets from that box are never =20
passed back to eth0, so this looks to me as if masquerading somehow fails.

Does anyone know what I missed here? The same iptables setup (actually a =20
lot stricter, i.e. a "real" firewall) worked fine with isdn/ippp0. I also =20
verified that it is at least technically working; running the G4 under =20
MacOS 10.3.9 client, with a little ipfw and natd fiddling the machine is =20
doing nat as expected. However, as I usually use Linux, a running nat =20
setup with iptables is really important for me.

HELP - I am really lost here, so any help/pointer would be really welcome!

Thanks in advance, Albrecht.


--=20
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Albrecht Dre=DF  -  Johanna-Kirchner-Stra=DFe 13  -  D-53123 Bonn (German=
y)
        Phone (+49) 228 6199571  -  mailto:albrecht.dress@arcor.de
    GnuPG public key:  http://home.arcor.de/dralbrecht.dress/pubkey.asc
_________________________________________________________________________

--=-V2tve2QBcI438JDQM1oR
Content-Type: application/x-shellscript; name=fw.sh
Content-Disposition: attachment; filename=fw.sh
Content-Transfer-Encoding: base64

IyEvYmluL2Jhc2gKZm9yIG4gaW4gSU5QVVQgT1VUUFVUIEZPUldBUkQ7IGRvCglpcHRhYmxlcyAt
RiAkbgoJaXB0YWJsZXMgLVAgJG4gQUNDRVBUCmRvbmUKZm9yIG4gaW4gUFJFUk9VVElORyBQT1NU
Uk9VVElORyBPVVRQVVQ7IGRvCglpcHRhYmxlcyAtdCBuYXQgLUYgJG4KCWlwdGFibGVzIC10IG5h
dCAtUCAkbiBBQ0NFUFQKZG9uZQppcHRhYmxlcyAtdCBuYXQgLUEgUE9TVFJPVVRJTkcgLXMgMTky
LjE2OC40Mi4wLzI0IC1vIHBwcDAgLWogTUFTUVVFUkFERQppcHRhYmxlcyAtQSBGT1JXQVJEIC1w
IHRjcCAtLXRjcC1mbGFncyBTWU4sUlNUIFNZTiAtaiBUQ1BNU1MgLS1jbGFtcC1tc3MtdG8tcG10
dQplY2hvICIxIiA+IC9wcm9jL3N5cy9uZXQvaXB2NC9pcF9mb3J3YXJkCmVjaG8gIjIiID4gL3By
b2Mvc3lzL25ldC9pcHY0L2lwX2R5bmFkZHIK

--=-V2tve2QBcI438JDQM1oR
Content-Type: text/plain; charset=us-ascii; name=tcpdump
Content-Disposition: attachment; filename=tcpdump
Content-Transfer-Encoding: quoted-printable

[root@antares root]# tcpdump -nn -i eth0 tcp port 80
18:16:21.012143 IP 192.168.42.4.49223 > 213.95.27.115.80: S 2685214081:2685=
214081(0) win 65535 <mss 1460,nop,wscale 0,nop,nop,timestamp 2148180757 0>
18:16:23.779283 IP 192.168.42.4.49223 > 213.95.27.115.80: S 2685214081:2685=
214081(0) win 65535 <mss 1460,nop,wscale 0,nop,nop,timestamp 2148180762 0>
18:16:26.626863 IP 192.168.42.4.49224 > 213.95.27.115.80: S 2390183934:2390=
183934(0) win 65535 <mss 1460,nop,wscale 0,nop,nop,timestamp 2148180768 0>
18:16:29.278717 IP 192.168.42.4.49224 > 213.95.27.115.80: S 2390183934:2390=
183934(0) win 65535 <mss 1460,nop,wscale 0,nop,nop,timestamp 2148180773 0>
18:16:32.278383 IP 192.168.42.4.49224 > 213.95.27.115.80: S 2390183934:2390=
183934(0) win 65535 <mss 1460,nop,wscale 0,nop,nop,timestamp 2148180779 0>
18:16:35.278053 IP 192.168.42.4.49224 > 213.95.27.115.80: S 2390183934:2390=
183934(0) win 65535 <mss 1460>
18:16:38.277733 IP 192.168.42.4.49224 > 213.95.27.115.80: S 2390183934:2390=
183934(0) win 65535 <mss 1460>
18:16:41.277416 IP 192.168.42.4.49224 > 213.95.27.115.80: S 2390183934:2390=
183934(0) win 65535 <mss 1460>
18:16:47.276686 IP 192.168.42.4.49224 > 213.95.27.115.80: S 2390183934:2390=
183934(0) win 65535 <mss 1460>

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

[root@antares root]# tcpdump -nn -i ppp0 tcp port 80 2> tcpdump.ppp0
18:16:21.012206 IP 84.44.131.113.49223 > 213.95.27.115.80: S 2685214081:268=
5214081(0) win 65535 <mss 1452,nop,wscale 0,nop,nop,timestamp 2148180757 0>
18:16:21.085651 IP 213.95.27.115.80 > 84.44.131.113.49223: S 2677460604:267=
7460604(0) ack 2685214082 win 5792 <mss 1460,nop,nop,timestamp 1472713132 2=
148180757,nop,wscale 2>
18:16:21.085748 IP 84.44.131.113.49223 > 213.95.27.115.80: R 2685214082:268=
5214082(0) win 0
18:16:23.779332 IP 84.44.131.113.49223 > 213.95.27.115.80: S 2685214081:268=
5214081(0) win 65535 <mss 1452,nop,wscale 0,nop,nop,timestamp 2148180762 0>
18:16:23.841268 IP 213.95.27.115.80 > 84.44.131.113.49223: S 2680216981:268=
0216981(0) ack 2685214082 win 5792 <mss 1460,nop,nop,timestamp 1472715888 2=
148180762,nop,wscale 2>
18:16:23.841326 IP 84.44.131.113.49223 > 213.95.27.115.80: R 2685214082:268=
5214082(0) win 0
18:16:26.626918 IP 84.44.131.113.49224 > 213.95.27.115.80: S 2390183934:239=
0183934(0) win 65535 <mss 1452,nop,wscale 0,nop,nop,timestamp 2148180768 0>
18:16:26.689960 IP 213.95.27.115.80 > 84.44.131.113.49224: S 2688743097:268=
8743097(0) ack 2390183935 win 5792 <mss 1460,nop,nop,timestamp 1472718737 2=
148180768,nop,wscale 2>
18:16:26.690000 IP 84.44.131.113.49224 > 213.95.27.115.80: R 2390183935:239=
0183935(0) win 0
18:16:29.278746 IP 84.44.131.113.49224 > 213.95.27.115.80: S 2390183934:239=
0183934(0) win 65535 <mss 1452,nop,wscale 0,nop,nop,timestamp 2148180773 0>
18:16:29.343266 IP 213.95.27.115.80 > 84.44.131.113.49224: S 2691397130:269=
1397130(0) ack 2390183935 win 5792 <mss 1460,nop,nop,timestamp 1472721391 2=
148180773,nop,wscale 2>
18:16:29.343295 IP 84.44.131.113.49224 > 213.95.27.115.80: R 2390183935:239=
0183935(0) win 0
18:16:32.278425 IP 84.44.131.113.49224 > 213.95.27.115.80: S 2390183934:239=
0183934(0) win 65535 <mss 1452,nop,wscale 0,nop,nop,timestamp 2148180779 0>
18:16:32.341042 IP 213.95.27.115.80 > 84.44.131.113.49224: S 2694396243:269=
4396243(0) ack 2390183935 win 5792 <mss 1460,nop,nop,timestamp 1472724390 2=
148180779,nop,wscale 2>
18:16:32.341114 IP 84.44.131.113.49224 > 213.95.27.115.80: R 2390183935:239=
0183935(0) win 0
18:16:35.278094 IP 84.44.131.113.49224 > 213.95.27.115.80: S 2390183934:239=
0183934(0) win 65535 <mss 1452>
18:16:35.339906 IP 213.95.27.115.80 > 84.44.131.113.49224: S 2697395925:269=
7395925(0) ack 2390183935 win 5840 <mss 1460>
18:16:35.339928 IP 84.44.131.113.49224 > 213.95.27.115.80: R 2390183935:239=
0183935(0) win 0
18:16:38.277765 IP 84.44.131.113.49224 > 213.95.27.115.80: S 2390183934:239=
0183934(0) win 65535 <mss 1452>
18:16:38.334399 IP 213.95.27.115.80 > 84.44.131.113.49224: S 2700391695:270=
0391695(0) ack 2390183935 win 5840 <mss 1460>
18:16:38.334470 IP 84.44.131.113.49224 > 213.95.27.115.80: R 2390183935:239=
0183935(0) win 0
18:16:41.277463 IP 84.44.131.113.49224 > 213.95.27.115.80: S 2390183934:239=
0183934(0) win 65535 <mss 1452>
18:16:41.334072 IP 213.95.27.115.80 > 84.44.131.113.49224: S 2703391278:270=
3391278(0) ack 2390183935 win 5840 <mss 1460>
18:16:41.334119 IP 84.44.131.113.49224 > 213.95.27.115.80: R 2390183935:239=
0183935(0) win 0
18:16:47.276735 IP 84.44.131.113.49224 > 213.95.27.115.80: S 2390183934:239=
0183934(0) win 65535 <mss 1452>
18:16:47.333126 IP 213.95.27.115.80 > 84.44.131.113.49224: S 2709392375:270=
9392375(0) ack 2390183935 win 5840 <mss 1460>
18:16:47.333171 IP 84.44.131.113.49224 > 213.95.27.115.80: R 2390183935:239=
0183935(0) win 0



--=-V2tve2QBcI438JDQM1oR--

--=-685BPy2WvMVtHwgEBJux
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCe50Rn/9unNAn/9ERAsXqAKCPMfof6142tIqXgCTR+eXehe91oACfV4/c
W7sUK7Wv4cDYkT5GBhS583k=
=wuQI
-----END PGP SIGNATURE-----

--=-685BPy2WvMVtHwgEBJux--


