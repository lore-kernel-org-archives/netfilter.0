From: "Kevin Saenz" <ksaenz@citistreet.com.au>
Subject: RE: Telnet not being let through
Date: Wed, 18 Sep 2002 14:07:32 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <771DD65729F96D41B132C6189EE644552FE7BA@sydexch1.cs_au.com.au>
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
Content-Type: text/plain; charset="us-ascii"
To: Chris Born <ragable@attbi.com>, netfilter@lists.netfilter.org

I think your problem is that you drop-and-log-it
before accepting anything substantial. IPTables works
top down unless your forward to other rules.
Basically what happens is if the rules don't apply to
the rules before drop-and-log-it then they are getting logged.
Usually your very last rule should be drop and log.

Have you tired the Iptables tutorial by Oskar Andersen?
His examples are very good.

-----Original Message-----
From: Chris Born [mailto:ragable@attbi.com]
Sent: Wednesday, September 18, 2002 12:15 PM
To: netfilter@lists.netfilter.org
Subject: Telnet not being let through


I'm trying to allow telnet sessions through from the outside. Here are =
the=20
rules I have for the input chain:

$IPTABLES =3D /sbin/iptables
$UNIVERSE =3D "0.0.0.0/0"

$EXTIP =3D "`$IFCONFIG $EXTIF | /bin/grep 'inet addr'  | /bin/awk =
'{print 2}'=20
| /bin/sed -e 's/.*://'`"

$EXTIF =3D "eth1"
$INTIF =3D "eth0"

$INTNET =3D "192.168.0.0/24"

$IPTABLES -P INPUT DROP
$IPTABLES -F INPUT

$IPTABLES -A INPUT -i lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT
$IPTABLES -A INPUT -i $INTIF -s $INTNET -d $UNIVERSE -j ACCEPT
$IPTABLES -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j drop-and-log-it
$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -m state --state=20
ESTABLISEHED,RELATED
$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -p TCP --dport 23 -j =
ACCEPT
$IPTABLES -A INPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it

Telnetting from and inside machine works just fine, but every time =
someone=20
tries to connect from the outside the connection is refused. Wondering =
what=20
I'm doing wrong here.

-Chris Born




