From: Ulysses Almeida <ulysses.almeida@gmail.com>
Subject: Two links and a SMTP sever.
Date: Tue, 18 Jan 2005 10:39:04 -0300
Message-ID: <d645356050118053928226673@mail.gmail.com>
Reply-To: Ulysses Almeida <ulysses.almeida@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1331_8127676.1106055544996"
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

------=_Part_1331_8127676.1106055544996
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi folks,

  I have an unsolved problem with iptables + iproute2 that I can't
figure out how to solve it.

  I explaint it on the attachment (i sent this attachment, because I
don't thin it will cause any trouble, since it's text/plain, if does,
say and I won't send again). I wrote this as a mini-HowTo, and I
pretend to publish this, but I need to solve the problem before doing
this ;)

  The strange thing. I have almost the same scenario on other host,
What differs is the fact that on the other host I have 4 Internet
links, not only two, and everything works as I expected.  I tried the
same solution on another two hosts, and on both I had this releated
problem.

  If some one can help-me track this problem, I thank in advance.

  Regars.

-- 
 - Ulysses Almeida

------=_Part_1331_8127676.1106055544996
Content-Type: text/plain; name="lar_with_smtp.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="lar_with_smtp.txt"


  I Have the following scenario:

  - One server with two links:
    * First link has dynamic IP (cheap one)
    * Second links has fixed IP (expensive one)

  - Link(1) is used by my intranet users, they use Internet=20
  services by this link. To do this, I just setuped Link(1)
  as my default gw. And made my server a linux router.
    # echo 1 > /proc/sys/net/ipv4/ip_forward
    # iptables -t nat -A POSTROUTING -s <intranet_net> -o <eth_link(1)> -j =
MASQUERADE=20
    # ip route add default via <link(1)_gw> dev <eth_link(1)>

  - Link(2) is used by some incomming requests from internet
  to this server. This services are HTTP and SMTP services.=20
  To use second link properly, I setuped iproute2
    # echo 100 link2 >> /etc/iproute2/rt_tables
    # ip route add <intranet_net> dev <eth_intranet> src <server_intranet_i=
p> table link2
    # ip route add <link(2)_net> dev <eth_link(2)> src <server_link(2)_ip> =
table link2
    # ip route add default via <link(2)_gw> dev <eth_link(2)> table link2
    # ip rule add from <server_link(2)_ip> lookup link2

 =09      ______
             |      |=09          __________ =20
             | S    | Link(1)    /=09    \=20
             | E  S |<--------->| =09     |
  ________   | R  M |       =09|  INTERNET  |
 |INTRANET|->| V  T | Link(2)   | =09     |
 '--------'  | E  P |<--------->| =09     |
             | R    |=09         \__________/
             |______|=09=09       =09
  =09   =09=09=09     =20
 =20
 =20
  Almost every thing works at this point. All my intranet users, are=20
using Link(1) to navigate on Internet, use MSN/ICQ/Jabber, and etc.
  When someone on Internet want's to access my WEB page, they use=20
server_link(2)_ip to get into. The same when they want to accesse their
e-mails. If some MTA on internet, needs to deliver some e-mail to my
smtp server, it also uses the server_link(2)_ip. And it's work fine.

  There's only one problem. If my MTA wants to deliver an e-mail, it
tries it by Link(1), what's reasonable, because that's the server default
gateway. But  it's not good, when the link(1) (dynamic IP) is a black=20
listed one

  To solve this problem, let's play with iptables and iproute2 a little mor=
e.

  Every outgoing packet, with destination port set to 25, I will mark.
    # iptables -t mangle -A OUTPUT -p tcp --dport 25 -j MARK --set-mark 0x0=
2

  Now I can say to iproute2 use the right routing table.
    # ip rule add fwmark 0x02 lookup link2

  Still not working, if i log outgoing packts, with destination port 25,
I see SMTP packets going through eth_link(2), but with server_link(1)_ip.
Let's handle those packets a little more.
    # iptables -t nat -I POSTROUTING -o <eth_link(2)> -j SNAT --to-source <=
server_link(2)_ip>

  Yes, now I'm sure every outgoing trafic through eth_link(2) is going
with the correct IP.

  =3D=3D UNSOLVED PROBLEM =3D=3D

  But, argh, it still not working. I tried to track connections:

  # iptables -t mangle -m tcp -I OUTPUT -p tcp --dport 25 -j LOG --log-leve=
l 3 --log-prefix 'mangle OUTPUT: '
  # iptables -t nat -m tcp -I POSTROUTING -p tcp --dport 25 -j LOG --log-le=
vel 3 --log-prefix 'nat POSTROUTING:=20
  # iptables -t mangle -m tcp -I PREROUTING -p tcp --sport 25 -j LOG --log-=
level 3 --log-prefix 'mangle PREROUTING: '
  # iptables -t nat -m tcp -I PREROUTING -p tcp --sport 25 -j LOG --log-lev=
el 3 --log-prefix 'nat PREROUTING: '
  # iptables -t mangle -m tcp -I INPUT -p tcp --sport 25 -j LOG --log-level=
 3 --log-prefix 'mangle INPUT: '
  # iptables -t filter -m tcp -I INPUT -p tcp --sport 25 -j LOG --log-level=
 3 --log-prefix 'filter INPUT: '


  To simulate, I started a telnet some_smtp_server 25. I could see:

  - packet on output mangle -> postrouting nat.
  - pachet on prerouting mangle.

  After packet appears on mangle's prerouting, it disappers? I can't
understando why.
  How can I debug this?
  Any one knows what can causinig it?


  I'm using:
# uname -r
2.6.5-63255U10_3cl    (I think is something near 2.6.9, with conectiva patc=
hs)
# iptables -V
iptables v1.2.11
# ip -V =20
ip utility, iproute2-ss020116


------=_Part_1331_8127676.1106055544996--

