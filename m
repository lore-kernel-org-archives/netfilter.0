From: =?iso-8859-1?Q?Svavar_=D6rn_Eysteinsson?= <svavar@prmail.atom01.is>
Subject: Passive FTP Problem in NAT.
Date: Wed, 15 Sep 2004 14:51:03 -0000
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <84F19A978A20454D96263C93109EE76937CE@telex.atom01.local>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi.

Could someone help me or give me advice regarding NAT on a FTP server =
located
in my DMZ.

This is my setup :

My Firewall(Linux 2.4.22-1) :
|
- eth0 =3D Public Interface (x.x.x.66 / 26 )
|
- eth1 =3D DMZ Interface (172.16.100.254 / 24 )
|
- eth2 =3D My Internal Network ( 192.168.1.1 / 24 )


I have a FTP server located on my DMZ Network. The server is listening
on a "non-standard" ftp port. It listens on port : 2121.

To generate my firewall config I use FwBuilder. I've tried many =
configurations
but, I never get the data port to open( e.g. to list a directory)

In my configuration I've allowed, and NAT'ed the following services
to my FTP server located on the DMZ  :

FTP 		=3D 	TCP Destination Port : Start : 2121 - End : 2121
FTP_DATA	=3D	TCP Source Port : Start : 20 - End : 20
			        Destination : Start : 1024 - End : 65535

I can connect, but cannot list the directories.

p.s. I'm running Proftpd on my FTP server. I have also tried to =
configure
the "PassivePorts=3D 60000 65534" to configure a group of the passive =
ports.
But it's the same issue with the directory listening.

Any help would be much appreciated.


Best regards to all,=20

Svavar O
Reykjavik - Iceland

