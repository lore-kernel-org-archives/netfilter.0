From: Batstru <batstru@email.it>
Subject: Re: problems with alias
Date: Fri, 16 Jul 2004 14:47:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <e70eba33cefa6ce158ba012abe8e1a82@147.162.2.222>
Reply-To: Batstru <batstru@email.it>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="b1_e70eba33cefa6ce158ba012abe8e1a82"
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


--b1_e70eba33cefa6ce158ba012abe8e1a82
Content-Type: text/plain; charset = "iso-8859-1"
Content-Transfer-Encoding: quoted-printable

sorry..=20
the correct subnet mask is the following...

eth0 --> 192.168.1.254 / 255.255.255.0
eth1 --> 82.186.92.90 / 255.255.255.248
eth1:1 --> 82.186.92.91 / 255.255.255.248
eth1:2 --> 82.186.92.92 / 255.255.255.248
eth1:3 --> 82.186.92.93 / 255.255.255.248
eth1:4 --> 82.186.92.93 / 255.255.255.248

marco


--------- Original Message --------
Da: netfilter@lists.netfilter.org
To: \"netfilter@lists.netfilter.org\" <netfilter@lists.netfilter.org>
Oggetto: Re: problems with alias
Data: 16/07/04 12:48



On Friday 16 July 2004 11:00 am, Batstru wrote:

> Hi all!
> I changed my server running redhat9 (kernel 2.4.x) with a new one with
> fedora core 2 (kernel 2.6.x): each one has 2 ethernet interfaces, so I
> copy network configuration fron rh9 to fc2
>
> eth0 --> 192.168.1.254 / 255.255.255.0
> eth1 --> 82.186.92.90 / 255.255.255.254
> eth1:1 --> 82.186.92.91 / 255.255.255.254
> eth1:2 --> 82.186.92.92 / 255.255.255.254
> eth1:3 --> 82.186.92.93 / 255.255.255.254
> eth1:4 --> 82.186.92.93 / 255.255.255.254

These combinations of address/netmask make no sense to me.

The netmask 255.255.255.254 defines a 2-host subnet (basically, a=20
point-to-point link, although those are normally specified using a full=20
32-bit all-1\'s netmask). Therefore if you have 82.186.92.90 on an interf=
ace

with a 255.255.255.254 netmask, the only machine it will be capable of=20
talking to at the other end of the cable is 82.186.92.91.

Putting that address (.91), as well as several others which fall in
different=20
address ranges, onto the same phyical interface makes no sense to me.

Regards,

Antony.

--=20
Anyone that\'s normal doesn\'t really achieve much.

- Mark Blair, Australian rocket engineer

Please reply to the list;
please don\'t CC me.=20
 --
 Email.it, the professional e-mail, gratis per te: http://www.email.it/f
=20
 Sponsor:
 I migliori vini a prezzi imbattibili e per ogni acquisto speciali omaggi=
!
Clicca e prova la convenienza ora!
 Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=3D2624&d=3D20040=
716


--b1_e70eba33cefa6ce158ba012abe8e1a82
Content-Type: text/html; charset = "iso-8859-1"
Content-Transfer-Encoding: quoted-printable

sorry.. <BR>the correct subnet mask is the following...<BR><BR><FONT face=
=3D"Courier New">eth0 --&gt; 192.168.1.254 / 255.255.255.0<BR>eth1 --&gt;=
 82.186.92.90 / 255.255.255.248<BR>eth1:1 --&gt; 82.186.92.91 / 255.255.2=
55.248<BR>eth1:2 --&gt; 82.186.92.92 / 255.255.255.248<BR>eth1:3 --&gt; 8=
2.186.92.93 / 255.255.255.248<BR>eth1:4 --&gt; 82.186.92.93 / 255.255.255=
.248<BR></FONT><BR>marco<BR><BR>
<BLOCKQUOTE dir=3Dltr style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MAR=
GIN-LEFT: 5px; BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
<DIV style=3D"FONT: 10pt arial">--------- Original Message --------<BR>Da=
: netfilter@lists.netfilter.org<BR>To: "netfilter@lists.netfilter.org" &l=
t;netfilter@lists.netfilter.org&gt;<BR>Oggetto: Re: problems with alias<B=
R>Data: 16/07/04 12:48<BR><BR><FONT face=3D"Courier New" size=3D2><BR><BR=
>On Friday 16 July 2004 11:00 am, Batstru wrote:<BR><BR>&gt; Hi all!<BR>&=
gt; I changed my server running redhat9 (kernel 2.4.x) with a new one wit=
h<BR>&gt; fedora core 2 (kernel 2.6.x): each one has 2 ethernet interface=
s, so I<BR>&gt; copy network configuration fron rh9 to fc2<BR>&gt;<BR>&gt=
; eth0 --&gt; 192.168.1.254 / 255.255.255.0<BR>&gt; eth1 --&gt; 82.186.92=
.90 / 255.255.255.254<BR>&gt; eth1:1 --&gt; 82.186.92.91 / 255.255.255.25=
4<BR>&gt; eth1:2 --&gt; 82.186.92.92 / 255.255.255.254<BR>&gt; eth1:3 --&=
gt; 82.186.92.93 / 255.255.255.254<BR>&gt; eth1:4 --&gt; 82.186.92.93 / 2=
55.255.255.254<BR><BR>These combinations of address/netmask make no sense=
 to me.<BR><BR>The netmask 255.255.255.254 defines a
2-host subnet (basically, a <BR>point-to-point link, although those are n=
ormally specified using a full <BR>32-bit all-1's netmask). Therefore if =
you have 82.186.92.90 on an interface <BR>with a 255.255.255.254 netmask,=
 the only machine it will be capable of <BR>talking to at the other end o=
f the cable is 82.186.92.91.<BR><BR>Putting that address (.91), as well a=
s several others which fall in different <BR>address ranges, onto the sam=
e phyical interface makes no sense to me.<BR><BR>Regards,<BR><BR>Antony.<=
BR><BR>-- <BR>Anyone that's normal doesn't really achieve much.<BR><BR>- =
Mark Blair, Australian rocket engineer<BR><BR>Please reply to the list;<B=
R>please don't CC me.<BR><BR><BR></FONT></DIV></BLOCKQUOTE><br><p><font f=
ace=3DVerdana,Arial size=3D2>----<br>
 Email.it, the professional e-mail, gratis per te: <a href=3D"http://www.=
email.it/cgi-bin/start?sid=3D3"=20
 target=3D"_blank" >clicca qui</a> <br>
 <br>
 Sponsor:<br>
 I migliori vini a prezzi imbattibili e per ogni acquisto speciali omaggi=
! Clicca e prova la convenienza ora!<br>
 <a href=3D"http://adv.email.it/cgi-bin/foclick.cgi?mid=3D2624&d=3D200407=
16" target=3D"_blank" >Clicca qui</a> </font><br>



--b1_e70eba33cefa6ce158ba012abe8e1a82--



