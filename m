From: =?iso-8859-1?q?Luis=20GUSTAVO?= <lgpcf@yahoo.com.br>
Subject: script firewall
Date: Tue, 13 Apr 2004 18:28:10 -0300 (ART)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040413212810.35514.qmail@web40506.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1652769154-1081891690=:35202"
Content-Transfer-Encoding: 8bit
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

--0-1652769154-1081891690=:35202
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
=20
i=B4m looking for a script for my adsl conection.
=20
i found this
=20
iptables -F
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT

=20
when i apllyed this rules, my machines clients, don=B4t know acces my machi=
ne.
=20
but it=B4s very complex and dificult.
=20
=20



Luis GUSTAVO         lgpcf@yahoo.com.br
+55 (21) 9891-3560    http://skafe.sites.uol.com.br
---------------------------------------------------------------------------=
------
=20








---------------------------------
Yahoo! Messenger - Fale com seus amigos online. Instale agora!
--0-1652769154-1081891690=:35202
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<DIV>Hi,</DIV>
<DIV>&nbsp;</DIV>
<DIV>i=B4m looking for a script for my adsl conection.</DIV>
<DIV>&nbsp;</DIV>
<DIV>i found this</DIV>
<DIV>&nbsp;</DIV>
<DIV>iptables -F<BR>iptables -P INPUT DROP<BR>iptables -P OUTPUT DROP<BR>ip=
tables -P FORWARD DROP<BR>iptables -A INPUT -m state --state ESTABLISHED,RE=
LATED -j ACCEPT<BR>iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT<BR>iptabl=
es -A OUTPUT -p udp --dport 53 -j ACCEPT<BR>iptables -A OUTPUT -p tcp --dpo=
rt 53 -j ACCEPT<BR></DIV>
<DIV>&nbsp;</DIV>
<DIV>when i apllyed this rules, my machines clients, don=B4t know acces my =
machine.</DIV>
<DIV>&nbsp;</DIV>
<DIV>but it=B4s very complex and dificult.</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV><BR><BR><DIV>
<DIV>
<DIV>
<DIV>
<DIV>
<P><STRONG>Luis GUSTAVO</STRONG>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;=
 <A href=3D"http://br.f405.mail.yahoo.com/ym/Compose?To=3Dlgpcf@yahoo.com.b=
r" target=3D_blank>lgpcf@yahoo.com.br</A><BR>+55 (21) 9891-3560&nbsp;&nbsp;=
&nbsp; <A href=3D"http://skafe.sites.uol.com.br/" target=3D_blank><FONT col=
or=3D#0000ff>http://skafe.sites.uol.com.br</FONT></A><BR>------------------=
---------------------------------------------------------------<BR>&nbsp;</=
P></DIV></DIV></DIV></DIV></DIV><p><br><hr size=3D1><a href=3D"http://br.rd=
.yahoo.com//mail_br/tagline/?http://br.download.yahoo.com/messenger/"><b>Ya=
hoo! Messenger</b></a> - Fale com seus amigos online. <a href=3D"http://br.=
rd.yahoo.com//mail_br/tagline/?http://br.download.yahoo.com/messenger/">Ins=
tale agora!
--0-1652769154-1081891690=:35202--

