From: =?iso-8859-1?q?toto=20eucup?= <toteucup@yahoo.de>
Subject: A practical problem regarding  IP Accounting ...?
Date: Tue, 9 Mar 2004 01:09:55 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040309000955.96297.qmail@web14101.mail.yahoo.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

I have 32 IP ADDRESSE 11.22.33.64-96=20
11.22.33.65 Router (cisco) I do not have access on it=20
Big Brother proprerty-- BELL you know already :( ...
:)
=20


My linux box 2 net interface
11.22.33.66 running DNS on eth0 and
11.22.33.67 on eth1


Here comes the scenario:
Betwen the router and Swich is my machine and I want
all the trafic to go through my Linux Box to be able
to account the trafic per IP addres.

              ROUTER -->INPUT<-- eth0
My Linux Box: eth0-->Accounting FILTER<--eth1
              eth1-->SWITCH<--  11.22.33.68 to 95


I want to be able  in my linux box to measure trafic
for all the station which are pluged in switch from 68
to 95

Thanks for an eventual complet solution.

   =20


=20
I tried to do so
=20
 [INTERNET] -->[ ROUTER:11.22.33.65] -->[ eth0(66)
 --eth1(67)] -->[HUB/switch]--> [station ([68].. to
 [95])]

How can I masure the trafic on each IP address in 68
to 95 range using your software.




=09
	=09
Mit sch=F6nen Gr=FC=DFen von Yahoo! Mail - http://mail.yahoo.de

