From: "Allain Yoann" <Yoann.Allain@thomson.net>
Subject: Re: 26sec+forwarding, bug or PEBKAC?
Date: Wed, 6 Apr 2005 10:54:20 +0200
Message-ID: <9C1918067C3BC14C9C351C206D8A8437377852@rennsmail03.eu.thmulti.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

On Tue, 31 Mar 2005 22:16:40, rsnel at cube.dyndns.org wrote
=20
>Hello list,
>=20
>I hope this is the right list, as my problem appears to be about both
>iptables and (native (as in: managed with setkey)) IPSec.
>=20
>Short version:=20
>=20
>packets from ipsec tunnel seem to get lost before they enter the the=20
>FORWARD chain with kernel 2.6.11. There is no problem with 2.6.8-2-k6=20
>(Debian kernel with 26sec) and there is no problem with ipsec turned=20
>off.
>=20
>Long version:
>=20
>Two networks:
>=20
>192.168.2.0/24 wired home network
>192.168.3.0/30 wireless network
>=20
>Three hosts
>=20
>cube, router/firewall: eth1 192.168.2.2 wlan0 192.168.3.1 eth0 82.157..

>eniac, workstation: eth0 192.168.2.1=20
>toppie, laptop: wlan0 192.168.3.2=20
>=20
>On 192.168.3.0/30 ipsec is used, relevant excerpt: ipsec.conf (cube):
>spdflush;
>=20
>spdadd 192.168.3.0/30 0.0.0.0/0 any -P in ipsec
>        esp/tunnel/192.168.3.2-192.168.3.1/require;
>=20
>spdadd 0.0.0.0/0 192.168.3.0/30 any -P out ipsec
>        esp/tunnel/192.168.3.1-192.168.3.2/require;
>=20
>the firewall on cube is configured as follows (only
>for testing, the usual config is more complicated but it
>exhibits the same problem).
>=20
>all the policies are 'ACCEPT'
>and traffic from eth0 is DROPped at INPUT (and forwarding
>is enabled at /proc/sys/net/ipv4/ip_forward).
>=20
>cube and toppie can ping eachother, cube and eniac also. But eniac and=20
>toppie can't ping eachother.
>=20
>For example:
>=20
>eniac pings toppie: (REQ=3Decho request, RPL=3Decho reply and =
ESP=3Dencryped=20
>packet) the log is aquired on cube by prepending a LOG target to all=20
>chains using a script much alike=20
>http://iptables-tutorial.frozentux.net/scripts/rc.test-iptables.txt=20
>and by removing information that I think isn't important, to make it=20
>fit on 80 cols
>=20
>Eniac sends an echo-request.
>=20
>REQ mangle PRE_R:IN=3Deth1 OUT=3D SRC=3D192.168.2.1 DST=3D192.168.3.2 =
LEN=3D84=20
>REQ nat    PRE_R:IN=3Deth1 OUT=3D SRC=3D192.168.2.1 DST=3D192.168.3.2 =
LEN=3D84=20
>REQ mangle FWD:IN=3Deth1 OUT=3Dwlan0 SRC=3D192.168.2.1 =
DST=3D192.168.3.2 LEN=3D84

>REQ filter FWD:IN=3Deth1 OUT=3Dwlan0 SRC=3D192.168.2.1 =
DST=3D192.168.3.2 LEN=3D84

>=20
From here on the packet gets encrypted.
>=20
>ESP mangle POST_R:IN=3D OUT=3Dwlan0 SRC=3D192.168.3.1 DST=3D192.168.3.2 =
LEN=3D152

>ESP nat    POST_R:IN=3D OUT=3Dwlan0 SRC=3D192.168.3.1 DST=3D192.168.3.2 =
LEN=3D152

>=20
>It leaves cube and toppie sends a reply.
>=20
>ESP mangle PRE_R:IN=3Dwlan0 OUT=3D SRC=3D192.168.3.2 DST=3D192.168.3.1 =
LEN=3D152=20
>ESP mangle INPUT:IN=3Dwlan0 OUT=3D SRC=3D192.168.3.2 DST=3D192.168.3.1 =
LEN=3D152
>ESP filter INPUT:IN=3Dwlan0 OUT=3D SRC=3D192.168.3.2 DST=3D192.168.3.1 =
LEN=3D152
>=20
>The packet gets decrypted.
>=20
>RPL mangle PRERT:IN=3Dwlan0 OUT=3D SRC=3D192.168.3.2 DST=3D192.168.2.1 =
LEN=3D84
>=20
>After this the echo reply from toppie does not appear in the log; the=20
>packet does not enter the INPUT chain and it also does not enter the=20
>(expected) FORWARD chain.
>=20
>This happens with linux-2.6.11 (vanilla). The ping works if IPSec is=20
>turned off (i.e. setkey -F -P on cube and toppie). And it also works=20
>in 2.4.27-2-k6 (a Debian kernel (which has 26sec patched in)).=20
>=20
>So, is it a bug, feature, or just misconfiguration? Can you reproduce?
>I would appreciate any insight on this problem.
>=20
>Thanks.
>=20
>Greetings,
>=20
>Rik.=20
=20
Hello Rik,
=20
I got the same problem, with the same kernel version. So I'm asking you
if you resolved it and if someone of the kernel has been awared of this
problem.
I've tried to debug it with an UML version but didn't succeed.
=20
Greetz
=20
Yoann
