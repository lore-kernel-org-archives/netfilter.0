From: =?iso-8859-1?q?Leandro_Guimar=E3es_Faria_Corsetti_Dutra?= <ldutra@wlt.com.br>
Subject: IPMasq denying localhost connections
Date: Tue, 03 Aug 2004 16:44:22 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <pan.2004.08.03.19.44.16.29288@wlt.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

	I have a 2.6.7 Linux kernel system on Debian testing, with an
Ethernet interface to the cable modem and another to the internal
network.

	With Linux 2.4 IPMasq worked OK, but with 2.6 I can=E2=80=99t anymore
reach localhost 127.0.0.1.  This hinders me from using the squid proxy
cache, for example.

	I never fooled around with routing, and was intimidated by
IPMasq=E2=80=99s /etc files.  Couldn=E2=80=99t find specific troubleshoot=
ing
information for IPTables.  Any hint is welcome=E2=80=A6


--=20
Leandro Guimar=C3=A3es Faria Corsetti Dutra    +55 (44) 3028 7467 ext 34
Web-Link Tecnologia Ltda                      fx +55 (44) 269 71 78
Maring=C3=A1, PR                                                  BRAZIL



