From: Francois Chenais <francois@chenais.net>
Subject: redirect input SYN before forward to QUEUE
Date: Mon, 10 Jun 2002 18:19:23 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020610181923.2a0030a3.francois@chenais.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org

Hello,=20
       =20


             192.168.76.0                   192.168.0.0
	A  -------------->  GW_Netfilter --------------------> B
                              \      /
                                QUEUE
                                  \
                                user APP



  In fact, I would like to redirect all SYN packet comming from A to B
  in target QUEUE for a user space check.

  Here what I've done but doesn't work !:-|

  on A=20
  -----
      route add -net 192.168.0.0 gw GW_Netfilter netmask 255.255.255.0=20


  on GW_Netfilter
  ---------------
      echo 1 > /proc/sys/net/ipv4/ip_forward
      iptables -t nat -A POSTROUTING -j MASQUERADE
      iptables -A FORWARD -d 192.160.0.0/255.255.255.0 -p tcp --tcp-flags S=
YN SYN -j QUEUE
      iptables -A INPUT -d 192.160.0.0/255.255.255.0 -p tcp --tcp-flags SYN=
 SYN -j QUEUE
 =20

 user APP connected on hook 1 on the ip_queue
 ---------------------------------------------


	What's wrong ?

	Thanks a lot

		Fran=E7ois

--=20
Woody 3.0
Linux tanna 2.4.14 #3 SMP Thu Dec 6 14:04:03 CET 2001 i686 unknown

PGP fingerprint : 9AFA 15EC 96C9 F607 EBC1  DD41 70C5 F0E0 25A5 105B






 =20

	=20

