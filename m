From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: How to block a range of IPs?
Date: 27 Apr 2003 11:26:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051435562.1136.13.camel@elendil.intranet.cartel-securite.net>
References: <Law15-F69D7eX6Djee700022e1a@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law15-F69D7eX6Djee700022e1a@hotmail.com>
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
To: Afshin Lamei <linux_st@hotmail.com>
Cc: netfilter@lists.netfilter.org

Le dim 27/04/2003 =E0 08:11, Afshin Lamei a =E9crit :
> How can I write a rule for a custom range of IPs? for example, I want t=
o=20
> block every WWW packet incoming from eth1, which source is an IP betwee=
n=20
> 192.168.1.10 and 192.168.1.20.

A bit HS, but a quite wonderful tool for this kind of situation.
netmask, distributed with Debian, allows you to find all subnets that
cover an arbitrary IP range :

	cbr@elendil:~$ netmask 192.168.1.10:192.168.1.20
	   192.168.1.10/31
	   192.168.1.12/30
	   192.168.1.16/30
	   192.168.1.20/32

Now you have coverd your range, just implement your 4 rules.

The other solution is to find a single subnet that covers your whole
range. In your case, the minimal one seems to 192.168.1.1/27 that covers
from 192.168.1.1 to 192.168.1.31.

	cbr@elendil:~$ netmask -r 192.168.1.1/27
	    192.168.1.0-192.168.1.31    (32)

Now you have a single rule, but it covers a much larger range than you
need.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

