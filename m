From: ju0815nk@gmx.net
Subject: Firewall did not block SSH - what is wrong
Date: Tue, 22 Feb 2005 20:16:30 +0100 (MET)
Message-ID: <17870.1109099790@www17.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi,

thanks for your help. Actually, I wanted to block all incoming traffic that
is not related to connections originating from my machine. Should a default
policy of dropping all packets plus allowing only related packages be
sufficient ?

e.g.

$IPTABLES -P INPUT DROP
$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -m state --state \
 ESTABLISHED,RELATED -j ACCEPT

Is there any way to test iptables-based firewalls without access to a second
machine ?
I installed the rule you told me and commented out the one allowing
connections to the firewall - but how can I test that it works for me
(except testing if my email/mozilla works)?

Thanks, Hilmar


> try something as:=20
>=20
> #Substitute values for yours.
> #your iptables binary
> IPT=3Diptables
> #your external iface
> EFACE=3Dppp0=20
>=20
> $IPT -A INPUT -i $EFACE -p tcp --dport ssh --syn -j DROP=20
> Say us if that is your need and if that works fine for you.=20


--=20
DSL Komplett von GMX +++ Superg=FCnstig und stressfrei einsteigen!
AKTION "Kein Einrichtungspreis" nutzen: http://www.gmx.net/de/go/dsl

