From: Wim Ceulemans <wim.ceulemans@able.be>
Subject: PPTP port forwarding
Date: Thu, 19 Feb 2004 12:53:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4034A3CF.20307@able.be>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----------=_1077191636-9516-76"
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
Cc: dev@able.be

This is a multi-part message in MIME format...

------------=_1077191636-9516-76
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gwb.able.be id i1JBrsaH014423

Hi

We have noticed a problem with PPTP forwarding not working as it should.

We have a system on kernel 2.4.24 with latest pom and iptables 1.2.9.=20
There is a port forwarding PPTP to a windows 2000 server behind the=20
firewall.

We noticed that when someone connects with PPTP the connection is closed=20
after 3 to 4 minutes. This problem only occurs if there is a router in=20
nat mode between the firewall and the internet. If the public ip is on=20
the firewall then this problem does not occur.

Can this be solved in the firewall or will we have to install another=20
router (in bridged mode)?

Regards
Wim

--=20
Wim Ceulemans
R&D Engineer

Secure Internet Communication with aXs Guard

aXs GUARD "=E0 la Carte" at Infosecurity
Brussels Kart Expo
10-11 March 2004
stand 1.C.060
FREE registration click here:
http://www.databadge.nl/isbe2004/reg/reg.php?link=3Dd9ca37ba1cb635dc2061

Able NV
Leuvensesteenweg 282 - B-3190 Boortmeerbeek - Belgium
Phone: + 32 15 50.44.00 - Fax: + 32 15 50.44.09
E-mail: wim.ceulemans@able.be


--
---
Security check and anti-virus control on this e-mail has been done by aXs=
 GUARD (http://www.axsguard.com)

------------=_1077191636-9516-76--

