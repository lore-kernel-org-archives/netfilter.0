From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: how to get the entry of  NAT table?
Date: Fri, 19 Mar 2004 08:10:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079680244.1408.20.camel@anduril.intranet.cartel-securite.net>
References: <BAY12-DAV7rrd58ircf00000dab@hotmail.com>
	 <jbm.20040318212754.20bdf816@alkaid.pc9>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <jbm.20040318212754.20bdf816@alkaid.pc9>
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
To: forum@users.pc9.org
Cc: netfilter@lists.netfilter.org

Le ven 19/03/2004 =E0 04:27, forum@users.pc9.org a =E9crit :
> Try:
> iptables -t nat -L
> This should print the current nat table entries.

This should print nat table _rules_...

NAT entries are stored within conntrack table that is accessible through
/proc/net/ip_conntrack. So, you have to parse the file to extract all
entries that have a NAT tuple, i.e. a tuple for which :

	orig.src <> return.dst and/or orig.dst <> return.src

Such as this one :

tcp      6 431997 ESTABLISHED src=3D192.168.1.1 dst=3D172.16.1.7 sport=3D=
33057
dport=3D80 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D1080 dport=3D33057 [AS=
SURED]
use=3D1 mark=3D0

Which is a connection through REDIRECT target. Or this one :

tcp      6 431885 ESTABLISHED src=3D192.168.1.1 dst=3D219.24.23.10
sport=3D32839 dport=3D993 src=3D219.24.23.10 dst=3D215.34.54.67 sport=3D9=
93
dport=3D32839 [ASSURED] use=3D1 mark=3D0

Which is an IMAPS connection from LAN to external server SNATed by
firewall.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

