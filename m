From: Francois Chenais <francois@chenais.net>
Subject: Re: redirect input SYN before forward to QUEUE
Date: Tue, 11 Jun 2002 11:20:33 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020611112033.6db3a9b8.francois@chenais.net>
References: <20020610181923.2a0030a3.francois@chenais.net>
	<20020610184536.354c2fac.francois@chenais.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020610184536.354c2fac.francois@chenais.net>
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

This works fine with another ethernet card !

will netfilter support eth0:0 interfaces in the future ?

	Fran=E7ois




On Mon, 10 Jun 2002 18:45:36 +0200
Francois Chenais <francois@chenais.net> wrote:

  | Now I have put the good rule
  |       iptables -A FORWARD -d 192.168.0.0/255.255.255.0 -p tcp --tcp-fla=
gs SYN SYN -j QUEUE
  |=20
  | A is connected on B but with his own ip addr instead of the GW_Netfilte=
r addr.
  | the iptables -t nat -A POSTROUTING -j MASQUERADE seems to be ignored.
  |=20
  | Just another (important) information
  |=20
  | I use GW_netfilter eth0:0 device to go on network 192.168.0.0
  |            and the eth0:0 device on B so that=20
  |=20
  | A, GW and B are all on the 192.168 network but only GW and B are on the=
 192.168 one !
  |=20
  | =20
  |          192.168.76
  |    .______________.___________________________.
  |    |              |                           |
  |    |              |                           |
  |    |             eth0                        eth0=20
  |    |              |                           |
  |    A             GW                           B
  |                   |                           |
  |               eth0:0------192.168.0----------eth0:0
  |=20
  |=20
  |=20
  |    is a better schema !
  |=20
  |=20
  | 		Fran=E7ois
  |=20
  |=20
  |     =20
  |=20
  |=20
  |=20
  | On Mon, 10 Jun 2002 18:19:23 +0200
  | Francois Chenais <francois@chenais.net> wrote:
  |=20
  |   | Hello,=20
  |   |        =20
  |   |=20
  |   |=20
  |   |              192.168.76.0                   192.168.0.0
  |   | 	A  -------------->  GW_Netfilter --------------------> B
  |   |                               \      /
  |   |                                 QUEUE
  |   |                                   \
  |   |                                 user APP
  |   |=20
  |   |=20
  |   |=20
  |   |   In fact, I would like to redirect all SYN packet comming from A t=
o B
  |   |   in target QUEUE for a user space check.
  |   |=20
  |   |   Here what I've done but doesn't work !:-|
  |   |=20
  |   |   on A=20
  |   |   -----
  |   |       route add -net 192.168.0.0 gw GW_Netfilter netmask 255.255.25=
5.0=20
  |   |=20
  |   |=20
  |   |   on GW_Netfilter
  |   |   ---------------
  |   |       echo 1 > /proc/sys/net/ipv4/ip_forward
  |   |       iptables -t nat -A POSTROUTING -j MASQUERADE
  |   |       iptables -A FORWARD -d 192.160.0.0/255.255.255.0 -p tcp --tcp=
-flags SYN SYN -j QUEUE
  |   |       iptables -A INPUT -d 192.160.0.0/255.255.255.0 -p tcp --tcp-f=
lags SYN SYN -j QUEUE
  |   |  =20
  |   |=20
  |   |  user APP connected on hook 1 on the ip_queue
  |   |  ---------------------------------------------
  |   |=20
  |   |=20
  |   | 	What's wrong ?
  |   |=20
  |   | 	Thanks a lot
  |   |=20
  |   | 		Fran=E7ois
  |   |=20
  |   | --=20
  |   | Woody 3.0
  |   | Linux tanna 2.4.14 #3 SMP Thu Dec 6 14:04:03 CET 2001 i686 unknown
  |   |=20
  |   | PGP fingerprint : 9AFA 15EC 96C9 F607 EBC1  DD41 70C5 F0E0 25A5 105B
  |   |=20
  |   |=20
  |   |=20
  |   |=20
  |   |=20
  |   |=20
  |   |  =20
  |   |=20
  |   | 	=20
  |   |=20
  |   |=20
  |=20
  |=20
  |=20


