From: David T-G <davidtg-netfilter@justpickone.org>
Subject: Re: SuSEfirewall2 and NAT help : i am so lost!
Date: Thu, 15 May 2003 18:45:46 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030515224546.GB53289@justpickone.org>
References: <20030515203925.GA48230@justpickone.org> <Pine.LNX.4.43.0305151347060.1090-100000@pilchuck.reedmedia.net> <20030515211805.GA53289@justpickone.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NKoe5XOeduwbEQHU"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030515211805.GA53289@justpickone.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: NetFilter Users' List <netfilter@lists.netfilter.org>


--NKoe5XOeduwbEQHU
Content-Type: multipart/mixed; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline


--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi again, all --

=2E..and then David T-G said...
%=20
% ...and then Jeremy C. Reed said...
% %=20
% % On Thu, 15 May 2003, David T-G wrote:
% %=20
=2E..
% % > generally poked and prodded everywhere I can, I've come up with many =
"you
% % > need to turn on NAT" but no pointers to how to do so!
% %=20
% % Go to the netfilter webpage. Click on Documentation.
=2E..
% % Then read the NAT HOWTO for your preferred language. A quick example is=
 at
% % http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-4.html
%=20
% Oooh, perfect.  It actually sounds like I need
%=20
%   Packet Filtering HOWTO: 'Mixing NAT and Packet Filtering'
%=20
% but I'll find that -- unless some kind soul points me to it first :-)

I looked at tldp.org before I realized that it's on the netfilter page as
referred above :-)

I believe I've done the simple setup, but it still doesn't work for me.
I checked and found

  linux:~ # cat /proc/sys/net/ipv4/ip_forward
  1

so that should be fine.

I've attached `iptables -L` so that you can see if anything looks wrong.
Thanks again!


HAND

:-D
--=20
David T-G                      * There is too much animal courage in=20
(play) davidtg@justpickone.org * society and not sufficient moral courage.
(work) davidtgwork@justpickone.org  -- Mary Baker Eddy, "Science and Health"
http://justpickone.org/davidtg/      Shpx gur Pbzzhavpngvbaf Qrprapl Npg!


--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=iptables-L
Content-Transfer-Encoding: quoted-printable

Chain INPUT (policy DROP)
target     prot opt source               destination        =20
ACCEPT     all  --  anywhere             anywhere          =20
ACCEPT     all  --  anywhere             anywhere           state RELATED,E=
STABLISHED=20
ACCEPT     udp  --  anywhere             255.255.255.255    udp spt:bootps =
dpt:bootpc=20
ACCEPT     icmp --  anywhere             anywhere           icmp echo-reque=
st=20
ACCEPT     udp  --  dns1.rcsntx.sbcglobal.net  anywhere           state NEW=
 udp spt:domain dpts:1024:65535=20
ACCEPT     udp  --  dns1.snfcca.sbcglobal.net  anywhere           state NEW=
 udp spt:domain dpts:1024:65535=20
LOG        tcp  --  anywhere             anywhere           tcp flags:SYN,R=
ST,ACK/SYN LOG level warning tcp-options ip-options prefix `SuSE-FW-DROP-NE=
W-CONNECT '=20
ACCEPT     udp  --  anywhere             anywhere           state ESTABLISH=
ED udp dpts:61000:65095=20
input_ext  all  --  anywhere             anywhere          =20
ACCEPT     all  --  anywhere             anywhere          =20

Chain FORWARD (policy DROP)
target     prot opt source               destination        =20
TCPMSS     tcp  --  anywhere             anywhere           tcp flags:SYN,R=
ST/SYN TCPMSS clamp to PMTU=20
reject_func  all  --  anywhere             anywhere          =20
ACCEPT     all  --  anywhere             anywhere          =20

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination        =20
ACCEPT     all  --  anywhere             anywhere           state NEW,RELAT=
ED,ESTABLISHED=20

Chain input_ext (1 references)
target     prot opt source               destination        =20
ACCEPT     tcp  --  anywhere             anywhere           state NEW,RELAT=
ED,ESTABLISHED tcp dpt:mysql=20
ACCEPT     tcp  --  anywhere             anywhere           state NEW,RELAT=
ED,ESTABLISHED tcp dpt:http=20
ACCEPT     tcp  --  anywhere             anywhere           state NEW,RELAT=
ED,ESTABLISHED tcp dpt:ssh=20
ACCEPT     tcp  --  anywhere             anywhere           state NEW,RELAT=
ED,ESTABLISHED tcp dpt:ftp=20
ACCEPT     tcp  --  anywhere             anywhere           state NEW,RELAT=
ED,ESTABLISHED tcp dpt:telnet=20
reject_func  tcp  --  anywhere             anywhere           tcp dpt:ident=
 flags:SYN,RST,ACK/SYN=20
reject_func  all  --  anywhere             anywhere          =20

Chain reject_func (3 references)
target     prot opt source               destination        =20
REJECT     tcp  --  anywhere             anywhere           reject-with tcp=
-reset=20
REJECT     udp  --  anywhere             anywhere           reject-with icm=
p-port-unreachable=20
REJECT     all  --  anywhere             anywhere           reject-with icm=
p-proto-unreachable=20

--VrqPEDrXMn8OVzN4--

--NKoe5XOeduwbEQHU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (FreeBSD)

iD8DBQE+xBiaGb7uCXufRwARAo7RAJ0e9uqX9zVfXNs8FZ4OHbe+X53NdQCg3vAH
X5/Agmu5xvTsburSbmCEjlc=
=GcVJ
-----END PGP SIGNATURE-----

--NKoe5XOeduwbEQHU--

