From: svavar@atom01.is
Subject: Passive FTP Problem in NAT.
Date: Wed, 15 Sep 2004 15:13:24 +0000 (GMT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095261204.9082@wormhole.atom.is>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="bound1095261204"
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


This is a multi-part message in MIME format.

--bound1095261204
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail-relay.eunet.no id i8FFK01S017445

Hi.

Could someone help me or give me advice regarding NAT on a FTP server loc=
ated in my DMZ.

This is my setup :

My Firewall(Linux 2.4.22-1) :
|
- eth0 =3D Public Interface (x.x.x.66 / 26 )
|
- eth1 =3D DMZ Interface (172.16.100.254 / 24 )
|
- eth2 =3D My Internal Network ( 192.168.1.1 / 24 )


I have a FTP server located on my DMZ Network. The server is listening on=
 a =93non-standard=94 ftp port. It listens on port : 2121.

To generate my firewall config I use FwBuilder. I=92ve tried many configu=
rations but, I never get the data port to open( e.g. to list a directory)

In my configuration I=92ve allowed, and NAT=92ed the following services t=
o my FTP server located on the DMZ  :

FTP 		=3D 	TCP Destination Port : Start : 2121 =96 End : 2121
FTP_DATA	=3D	TCP Source Port : Start : 20 =96 End : 20
			        Destination : Start : 1024 =96 End : 65535

I can connect, but cannot list the directories.

p.s. I=92m running Proftpd on my FTP server. I have also tried to configu=
re the =93PassivePorts=3D 60000 65534=94 to configure a group of the pass=
ive ports.
But it=92s the same issue with the directory listening.

Any help would be much appreciated.


Best regards to all,=20

Svavar O
Reykjavik - Iceland

--bound1095261204--


