From: zynkx <skydive@megamail.pt>
Subject: (no subject)
Date: Fri, 28 Nov 2003 20:26:46 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070051206.3fc7af86dc233@paris-hme1>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
To: netfilter@lists.netfilter.org

                                _______________
=09=09=09=09| gateway 1   |
=09=09=09=09|192.168.0.253|
=09=09=09=09|81.84.40.XX  |
=09=09=09=09_______________
=09=09=09_______________|
=09=09=09|              |
=09=09_______________        |
=09=09|DHCP SERVER  |=09       |=09
=09
=09=09|192.168.0.1  |        |      =20
=09=09|_____________|=09       |
=09=09=09=09       |
=09=09=09=09________________
=09=09=09=09|GATEWAY2      |
=09=09=09=09|192.168.0.253 |
=09=09=09=09|192.168.100.254
=09=09=09=09|______________|
=09=09=09=09=09|
=09=09=09=09=09|
=09=09
=09_________________________________
=09=09=09|=09=09|=09
=09|=09=09=09
=09=09_______________    _______________ =20
______________
=09=09|192.168.100.1 |   |192.168.100.2| =20
|192.168.100.3|  _______________    ______________
_______________


hi all:


i have this lan i am supposed to use dhcrelay on=20
gateway 2 so the 192.168.100.0/24 machines can get an=20
ip address. i have the input and output chain of the=20
gateway 2 to drop.

my question is:

do those request require input and output to accept? i=20
don't really think so because those packer are not for=20
gateway 2 but are to be routed to 192.168.100.0/24=20
machines...=20

what do you guys think of this??

tanx ;))))
unix is user friendly. it's just selective when=20
choosing=20
friends.

-------------------------------------------------
Email Enviado utilizando o servi=E7o MegaMail


