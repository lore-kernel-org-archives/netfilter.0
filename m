From: "IZEM Farid" <Farid.IZEM@abxlogistics.fr>
Subject: How to log what is drop
Date: Thu, 8 Jul 2004 09:30:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B732FD42D68974438C1451C73C1D030FD1F5BA@FR92EX02.eu.abxlogistics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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


Hi all,

Just a Simple question.

How do i log what is being rejected or drop by my Firewall.

I configure my syslog.conf like this:=20
	kern.*                                                  /var/log/kernel

And I had the following rule:=20
	Iptables -A FORWARD -j LOG=20

It seems that all connections is logged so it is very difficult to read =
the log.

Thanks,

Best regards,

Farid IZEM
Ing=E9nieur Syst=E8me Unix
Soci=E9t=E9 ABX Logistics France
48-50, route principale du port
92232 Gennevilliers
T=E9l. : 01-41-47-61-78
Email : farid.izem@abxlogistics.fr


