From: =?iso-8859-1?q?Sebastian=20Edman?= <it2edse@yahoo.se>
Subject: "Lending an internet connection"
Date: Sat, 28 Sep 2002 20:35:18 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020928183518.5187.qmail@web21510.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-2077895278-1033238118=:4461"
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

--0-2077895278-1033238118=:4461
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi,

I have a brother that has an internet connection with a static public IP (2=
17.x.x.139). He is running windows and I want to place a linux-server at hi=
s house, and only take ports 22, 25 and 80 from him. The best way I can see=
 to accomplish that is to place the linux-server between his computer (runn=
ing windows) and his ISP, in such a way so that no change is neccessary on =
his computer.

ISP -------------- (eth0) Linux-server (eth1) -------------- (eth2) Windows=
 machine

(eth2) is configured with the static public IP from the ISP (217.x.x.139) a=
nd has gateway 217.x.x.1 and DNS servers 212.x.x.2 and 212.x.x.3.

I run LFS (www.linuxfromscratch.org) on the linux-server and I consider my =
skills in iptables enough to write the rules. The problem is that I do not =
know how to tackle this problem. What IP addresses should I choose for the =
linux-server, and what IP addresses should I forward?

Thank you for your time...

Gratis e-mail resten av livet p=E5: www.yahoo.se/mail
Busenkelt!
--0-2077895278-1033238118=:4461
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<P>Hi,</P>
<P>I have a brother that has an internet connection with a static public IP=
 (217.x.x.139). He is running windows and I want to place a linux-server at=
 his house, and only take ports 22, 25 and 80 from him. The best way I can =
see to accomplish that&nbsp;is to place the linux-server between his comput=
er (running windows) and his ISP, in such a way so that no change is necces=
sary on his computer.</P>
<P>ISP -------------- (eth0) Linux-server (eth1) -------------- (eth2)&nbsp=
;Windows machine</P>
<P>(eth2) is configured with the static public IP from the ISP (217.x.x.139=
) and has gateway 217.x.x.1 and DNS servers 212.x.x.2 and 212.x.x.3.</P>
<P>I run LFS (<A href=3D"http://www.linuxfromscratch.org">www.linuxfromscra=
tch.org</A>) on the linux-server and I consider my skills in iptables enoug=
h to write the rules. The problem is that I do not know how to tackle this =
problem. What IP addresses should I choose for the linux-server, and what&n=
bsp;IP addresses should I forward?</P>
<P>Thank you for your time...</P><p><b>Gratis e-mail resten av livet p=E5:<=
/b> <a href=3D"www.yahoo.se/mail">www.yahoo.se/mail</a><br>
Busenkelt!
--0-2077895278-1033238118=:4461--

