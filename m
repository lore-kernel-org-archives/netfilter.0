From: Simone Sestini <simone.sestini@plugit.net>
Subject: Fwd: Re: nat logging
Date: Mon, 11 Aug 2003 11:04:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.0.20030811110133.026d50e8@imap4.plugit.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=====================_331242942==.ALT"
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

--=====================_331242942==.ALT
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

Hey ppls..

anyone is good with ULOG....

This command don't log anything on my nat.log..
iptables -t nat -A POSTROUTING -s 10.50.72.0/23 -o eth0 -j=20
ULOG  --ulog-cprange 512 --ulog-prefix "ULOG: "


Is necessary to change the syslog daemon with the ulogd daemon ?!?!

I need to log the client ip address, remote ip address, url requested.

I can't use squid because for my configuration i need to nat some specific=
=20
subnet to a specific ip address and so on..

Thanks to anyone for valid idea..

>X-Authentication-Warning: spoutnik.cartel-securite.net: Host=20
>styx.intrusion.cartel-securite.net [194.29.206.118] (may be forged)=20
>claimed to be elendil.intranet.cartel-securite.net
>Subject: Re: nat logging
>From: Cedric Blancher <blancher@cartel-securite.fr>
>To: Simone Sestini <simone.sestini@plugit.net>
>Organization: Cartel S=C3=A9curit=C3=A9
>X-Mailer: Ximian Evolution 1.4.3
>Date: 11 Aug 2003 10:46:28 +0200
>X-MIME-Autoconverted: from quoted-printable to 8bit by=20
>elendil.intranet.cartel-securite.net id h7B8kSoi001320
>X-Spam-Status: No, hits=3D-109.5 required=3D5
>X-Scanned-By: MIMEDefang 2.30 (www . roaringpenguin . com / mimedefang)
>
>Le lun 11/08/2003 =E0 10:25, Simone Sestini a =E9crit :
> > so the new command should be something like ..
> > iptables -t nat -A POSTROUTING -s 10.50.72.0/23 -o eth0 -j ULOG
> > --ulog-cprange 512 --ulog-prefix "ULOG: "

>Yes something like this.
>But do not forget about "first packet restriction" in nat table.
>
> > the documentation explain something about netlink group.. but i have
> > no idea if i need to use that too..
>
>I am not familiar with ULOG, so you should ask the list for its
>configuration.
>
>Greetings.
>
>--
>http://www.netexit.com/~sid/
>PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Simone Sestini [ SS971-RIPE ]

Plug IT s.p.a. - Technical Office
Via Ernesto Rossi
52100 Arezzo

Fax             +39-199-440088
E-mail  simone.sestini@plugit.net
Web             http://www.plugit.it

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

--=====================_331242942==.ALT
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<body>
Hey ppls..<br><br>
anyone is good with ULOG....<br><br>
This command don't log anything on my nat.log..<br>
iptables -t nat -A POSTROUTING -s 10.50.72.0/23 -o eth0 -j ULOG&nbsp;
--ulog-cprange 512 --ulog-prefix &quot;ULOG: &quot;<br><br>
<br>
Is necessary to change the syslog daemon with the ulogd daemon
?!?!<br><br>
I need to log the client ip address, remote ip address, url
requested.<br><br>
I can't use squid because for my configuration i need to nat some
specific subnet to a specific ip address and so on..<br><br>
Thanks to anyone for valid idea.. <br><br>
<blockquote type=3Dcite class=3Dcite cite>X-Authentication-Warning:
spoutnik.cartel-securite.net: Host styx.intrusion.cartel-securite.net
[194.29.206.118] (may be forged) claimed to be
elendil.intranet.cartel-securite.net<br>
Subject: Re: nat logging<br>
From: Cedric Blancher &lt;blancher@cartel-securite.fr&gt;<br>
To: Simone Sestini &lt;simone.sestini@plugit.net&gt;<br>
Organization: Cartel S=C3=A9curit=C3=A9<br>
X-Mailer: Ximian Evolution 1.4.3 <br>
Date: 11 Aug 2003 10:46:28 +0200<br>
X-MIME-Autoconverted: from quoted-printable to 8bit by
elendil.intranet.cartel-securite.net id h7B8kSoi001320<br>
X-Spam-Status: No, hits=3D-109.5 required=3D5<br>
X-Scanned-By: MIMEDefang 2.30 (www . roaringpenguin . com /
mimedefang)<br><br>
Le lun 11/08/2003 =E0 10:25, Simone Sestini a =E9crit :<br>
&gt; so the new command should be something like ..<br>
&gt; iptables -t nat -A POSTROUTING -s 10.50.72.0/23 -o eth0 -j=20
ULOG<br>
&gt; --ulog-cprange 512 --ulog-prefix &quot;ULOG: &quot;<br>
</blockquote><br>
<blockquote type=3Dcite class=3Dcite cite>Yes something like this.<br>
But do not forget about &quot;first packet restriction&quot; in nat
table.<br><br>
&gt; the documentation explain something about netlink group.. but i
have<br>
&gt; no idea if i need to use that too..<br><br>
I am not familiar with ULOG, so you should ask the list for its<br>
configuration.<br><br>
Greetings.<br><br>
-- <br>
<a href=3D"http://www.netexit.com/~sid/"=
 eudora=3D"autourl">http://www.netexit.com/~sid/</a><br>
PGP KeyID: 157E98EE FingerPrint:
FA62226DA9E72FA8AECAA240008B480E157E98EE</blockquote>
<x-sigsep><p></x-sigsep>
<font=
 face=3D"Verdana">::::::::::::::::::::::::::::::::::::::::::::::::::::::::::=
::::::::::::<br><br>
</font><font face=3D"Verdana" color=3D"#FF0000"><b>Simone Sestini
</font><font face=3D"Verdana" size=3D2 color=3D"#FF0000">[ SS971-RIPE
]<br><br>
</b></font>Plug IT s.p.a. - Technical Office<br>
Via Ernesto Rossi<br>
52100 Arezzo<br><br>
<tt><font face=3D"Courier New, Courier"=
 color=3D"#0000FF">Fax<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>+39-199-440088<br>
E-mail<x-tab>&nbsp;&nbsp;</x-tab>simone.sestini@plugit.net<br>
Web<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><a href=3D"http://www.plugit.it/"=
 eudora=3D"autourl">http://www.plugit.it</a><br><br>
</font></tt><font face=3D"Verdana"><u>::::::::::::::::::::::::::::::::::::::=
::::::::::::::::::::::::::::::::
<br>
</font></u></body>
</html>

--=====================_331242942==.ALT--


