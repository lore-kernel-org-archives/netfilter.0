From: =?iso-8859-1?q?Luis=20GUSTAVO?= <lgpcf@yahoo.com.br>
Subject: Re: script firewall
Date: Tue, 20 Apr 2004 17:21:55 -0300 (ART)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040420202155.44738.qmail@web40503.mail.yahoo.com>
References: <200404202110.48904.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1055801671-1082492515=:43745"
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404202110.48904.Antony@Soft-Solutions.co.uk>
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

--0-1055801671-1082492515=:43745
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

but in this machine i have e-mail (25) and (110).
=20


Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
On Tuesday 20 April 2004 8:53 pm, Luis GUSTAVO wrote:

> I=B4m looking for a firewall script, for my ADSL conection, and share
> my conection.
>
> And i want block ports 1024:65535

I assume you mean you want to block *incoming* ports (in which case I wonde=
r=20
why you only want to block above 1023), so how about this:

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $int_IF -o $ext_IF -j ACCEPT
iptables -A POSTROUTING -t nat -o $ext_IF -j MASQUERADE

Let us know if you have any problems with it, or if there is anything I did=
n't=20
understand from your requirements.

Regards,

Antony.

--=20
Most people have more than the average number of legs.

Please reply to the list;
please don't CC me.




Luis GUSTAVO         lgpcf@yahoo.com.br
+55 (21) 9891-3560    http://skafe.sites.uol.com.br
---------------------------------------------------------------------------=
------
=20








---------------------------------
Yahoo! Messenger - Fale com seus amigos online. Instale agora!
--0-1055801671-1082492515=:43745
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<DIV>but in this machine i have e-mail (25) and&nbsp;(110).</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR><BR><B><I>Antony Stone &lt;Antony@Soft-Solutions.co.uk&gt;</I></B>=
 wrote:</DIV>
<BLOCKQUOTE class=3Dreplbq style=3D"PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BO=
RDER-LEFT: #1010ff 2px solid">On Tuesday 20 April 2004 8:53 pm, Luis GUSTAV=
O wrote:<BR><BR>&gt; I=B4m looking for a firewall script, for my ADSL conec=
tion, and share<BR>&gt; my conection.<BR>&gt;<BR>&gt; And i want block port=
s 1024:65535<BR><BR>I assume you mean you want to block *incoming* ports (i=
n which case I wonder <BR>why you only want to block above 1023), so how ab=
out this:<BR><BR>iptables -P INPUT DROP<BR>iptables -P FORWARD DROP<BR>ipta=
bles -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT<BR>iptables =
-A FORWARD -i $int_IF -o $ext_IF -j ACCEPT<BR>iptables -A POSTROUTING -t na=
t -o $ext_IF -j MASQUERADE<BR><BR>Let us know if you have any problems with=
 it, or if there is anything I didn't <BR>understand from your requirements=
.<BR><BR>Regards,<BR><BR>Antony.<BR><BR>-- <BR>Most people have more than t=
he ave
 rage number of legs.<BR><BR>Please reply to the list;<BR>please don't CC
 me.<BR><BR></BLOCKQUOTE><BR><BR><DIV>
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
--0-1055801671-1082492515=:43745--

