From: Batstru <batstru@email.it>
Subject: problems with alias
Date: Fri, 16 Jul 2004 12:00:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <12a1fd421dcf7411b2acdd8a5da18f59@147.162.2.222>
Reply-To: Batstru <batstru@email.it>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="b1_12a1fd421dcf7411b2acdd8a5da18f59"
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
To: netfilter@lists.netfilter.org


--b1_12a1fd421dcf7411b2acdd8a5da18f59
Content-Type: text/plain; charset = "iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all!
I changed my server running redhat9 (kernel 2.4.x) with a new one with
fedora core 2 (kernel 2.6.x): each one has  2 ethernet interfaces, so I c=
opy
network configuration fron rh9 to fc2=20

eth0 --> 192.168.1.254 / 255.255.255.0
eth1 --> 82.186.92.90 / 255.255.255.254
eth1:1 --> 82.186.92.91 / 255.255.255.254
eth1:2 --> 82.186.92.92 / 255.255.255.254
eth1:3 --> 82.186.92.93 / 255.255.255.254
eth1:4 --> 82.186.92.93 / 255.255.255.254
also, I copy and apply iptables configuration but it does not work well.
now iptables doesn\'t apply rules to virtual interfaces, eth1...eth4.
a line of my configiguration files is:
-A INPUT -p tcp -m tcp -m state -d 82.186.92.91 --dport 20 --state NEW -j
ACCEPT
I tried different rules configuration but it still not work.

can you help me?=20
 --
 Email.it, the professional e-mail, gratis per te: http://www.email.it/f
=20
 Sponsor:
 Lerboristeria.biz: per la tua bellezza e salute il miglior assortimento=20
di prodotti erboristici ed oggettistica online

 Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=3D2152&d=3D20040=
716


--b1_12a1fd421dcf7411b2acdd8a5da18f59
Content-Type: text/html; charset = "iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<P>Hi all!</P>
<P>I changed my server running redhat9 (kernel 2.4.x) with a new one with=
 fedora core 2 (kernel 2.6.x): each one has&nbsp; 2 ethernet interfaces, =
so I copy network configuration fron rh9 to fc2 </P>
<P><BR>eth0 --&gt; 192.168.1.254 / 255.255.255.0<BR>eth1 --&gt; 82.186.92=
.90 / 255.255.255.254<BR>eth1:1 --&gt; 82.186.92.91 / 255.255.255.254<BR>=
eth1:2 --&gt; 82.186.92.92 / 255.255.255.254<BR>eth1:3 --&gt; 82.186.92.9=
3 / 255.255.255.254<BR>eth1:4 --&gt; 82.186.92.93 / 255.255.255.254</P>
<P>also, I copy and apply iptables configuration but it does not work wel=
l.</P>
<P>now iptables doesn't apply rules to virtual interfaces, eth1...eth4.</=
P>
<P>a line of my configiguration files is:<BR>-A INPUT -p tcp -m tcp -m st=
ate -d 82.186.92.91 --dport 20 --state NEW -j ACCEPT</P>
<P>I tried different rules configuration but it still not work.</P>
<P><BR>can you help me?</P><br><p><font face=3DVerdana,Arial size=3D2>---=
-<br>
 Email.it, the professional e-mail, gratis per te: <a href=3D"http://www.=
email.it/cgi-bin/start?sid=3D3"=20
 target=3D"_blank" >clicca qui</a> <br>
 <br>
 Sponsor:<br>
 Lerboristeria.biz: per la tua bellezza e salute il miglior assortimento=20
di prodotti erboristici ed oggettistica online
<br>
 <a href=3D"http://adv.email.it/cgi-bin/foclick.cgi?mid=3D2152&d=3D200407=
16" target=3D"_blank" >Clicca qui</a> </font><br>



--b1_12a1fd421dcf7411b2acdd8a5da18f59--



