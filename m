From: =?iso-8859-1?Q?Ehrhardt_Ren=E9?= <r.ehrhardt@eviatec.de>
Subject: (no subject)
Date: Thu, 5 Aug 2004 13:52:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <94F30CDB27E39547A10F4E71E9AF114B2DEE89@dlb-dc02.intern-eviatec.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org.


Hi,

i=B4m running a debian sarge beta 4 box with iptables 1.2.10,
I have to install the pptp-conntrack-nat patch.=20
I have the newest CVS build of pom

Now my problem:


./runme extra/pptp-conntrack-nat.patch

Testing... pptp-conntrack-nat.patch NOT APPLIED (1 missing files)
The extra/pptp-conntrack-nat patch:
   Author: Harald Welte <laforge@netfilter.org>
   Status: Beta
...
...
...
Testing patch extra/pptp-conntrack-nat.patch...
Warning - no help text file could be found in either
/usr/src/linux/net/ipv4/netfilter/Config.help
or /usr/src/linux/Documentation/Configure.help
grep: /usr/src/linux/net/ipv4/netfilter/Config.in: Datei oder =
Verzeichnis nicht gefunden
Could not find place to slot in Config.in line

What does this mean??=20
Is there any way to get this thing working?

Could anybody help me??




