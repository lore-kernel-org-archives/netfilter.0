From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Subject: RE: Allow active and passive FTP connections
Date: Mon, 21 Jun 2004 07:10:27 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2E314DE03538984BA5634F12115B3A4E89552A@email1.mitretek.org>
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
Content-Type: text/plain; charset="us-ascii"
To: Sagara Wijetunga <sagaralists@yahoo.com>, netfilter@lists.netfilter.org

This is one of the first iptables firewalls I made (2-3 years ago) and
it does exactly that.
Let me know if it works for you, thanks.

fw_start() {=20
#######################################
# STEP 1 - SET VARIABLES=20
#######################################
# YOUR LOCAL LOOPBACK DEVICE
LB=3D"lo"
# YOUR PRIVATE INTERFACE=20
LAN=3D"eth0"
# YOUR PRIVATE LAN IP
LIP=3D"192.168.0.253"
# YOUR LOCAL AREA NETWORK
LSAT=3D"192.168.0.0/24"
# YOUR INTERNET INTERFACE
INET=3D"eth1"
# THE PATH TO IPTABLES
IPTABLES=3D"/usr/sbin/iptables"
#######################################
# STEP 2 - TURN ON IP FORWARDING
#######################################
echo "1" > /proc/sys/net/ipv4/ip_forward
#######################################
# STEP 3 - FLUSH EXISTING RULES
#######################################
$IPTABLES --flush INPUT=20
$IPTABLES --flush OUTPUT
$IPTABLES --flush FORWARD
#######################################
# STEP 4 - SET DEFAULT POLICIES
#######################################
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT
#######################################
# STEP 5 - CREATE DEFAULT BLOCK CHAIN=20
#######################################
$IPTABLES -N BLOCK=20
$IPTABLES -A BLOCK -j LOG --log-level 3 --log-prefix "BLOCK: "
$IPTABLES -A BLOCK -j DROP
#######################################
# STEP 6 - SETUP MASQUERADING
#######################################
$IPTABLES -t nat -A POSTROUTING -o $INET -j MASQUERADE
#######################################
# STEP 7 - ALLOW LOCAL ENTITIES=20
#######################################
# ALLOW LOOPBACK
$IPTABLES -A INPUT -i $LB -j ACCEPT=20
# ALLOW LOCAL AREA NETWORK
$IPTABLES -A INPUT -i $LAN -s $LSAT -j ACCEPT
#######################################
# STEP 8 - ALLOW SPECIFC TRAFFIC
#######################################
# EXAMPLE OF WHERE AND HOW TO ALLOW INBOUND TRAFFIC.
$IPTABLES -A INPUT -i $INET -p tcp --dport 21 -j ACCEPT
$IPTABLES -A INPUT -i $INET -p tcp --dport 22 -j ACCEPT
#######################################
# STEP 9 - ALLOW IN WHAT WE SEND OUT
#######################################
$IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
#######################################
# STEP 10 - DENY EVERYTHING NOT ALLOWED
#######################################
$IPTABLES -A INPUT -j BLOCK
#######################################
}=20

fw_stop() {
IPTABLES=3D"/usr/sbin/iptables"
$IPTABLES --flush INPUT
$IPTABLES --flush OUTPUT
$IPTABLES --flush FORWARD
$IPTABLES --flush BLOCK
$IPTABLES --delete-chain BLOCK
}

fw_restart() {
  fw_stop
  fw_start
}
=20
case "$1" in
'start')
  fw_start
  ;;
'stop')
  fw_stop
  ;;
'restart')
  fw_restart
  ;;
*)
  echo "usage $0 start|stop|restart"
esac


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Sagara
Wijetunga
Sent: Monday, June 21, 2004 6:57 AM
To: netfilter@lists.netfilter.org
Subject: RE: Allow active and passive FTP connections

--- Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:
> Are you sure, you run the kernel indicated?
>=20
uname -a
Linux svr1.myDomain 2.6.7 ...

> How did you compile iptables-1.2.10? There was a bug
> introduced in
> linux-2.6.7, which prevented anyone to compile the
> iptables source
> using linux-2.6.7.
>=20
I exported the variable CC before I compile iptables
as follows:

CC=3D"gcc -D__user=3D "
export CC

make BINDIR=3D/sbin LIBDIR=3D/lib \
MANDIR=3D/usr/share/man KERNEL_DIR=3D/usr/src/linux-2.6.7
>& iptables-make.log

make BINDIR=3D/sbin LIBDIR=3D/lib \
MANDIR=3D/usr/share/man install
KERNEL_DIR=3D/usr/src/linux-2.6.7  >&
iptables-install.log

Anyway, my problem is nothing to do with Linux kernel
2.6.7. The RELATED did not work on kernel 2.6.5 and
iptables 1.2.9. That's why I upgraded the kernel and
the iptables.

> > > You should post the complete list of your rules
> in
> > > all of the tables.
> > >
> > 	/sbin/iptables -P INPUT DROP
> > 	/sbin/iptables -P FORWARD DROP
> > 	/sbin/iptables -P OUTPUT DROP
>=20
> What about the nat/mangle/raw tables?
>=20
I do not use NAT. It does not operate as a router.
Therefore, no IP forwarding. It's not connected to any
office LAN. Access is only thru the eth0.

I'm not sure about mangle and raw tables. My intention
is to allow access only to the services I offer.

Do I have to use mangle and raw tables?=20

Could you kindly write for me a complete iptables
firewall allowing access ONLY to the FTP and ssh? I
know this is a crazy request. But I can implement it
on my server and test. So our test firewall should be
able to accept active as well as passive FTP client
connections for file upload and download and ssh
access for me to manipulate the server.

Kind regards
Sagara


	=09
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - Send 10MB messages!
http://promotions.yahoo.com/new_mail=20




