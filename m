From: "Ferry van Steen" <ferry.van.steen@InfoPart.nl>
Subject: RE: Logging Portscans
Date: Mon, 21 Oct 2002 12:15:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D502122A1694B04EAE0F53D53CC2F764017582@exch2k-01.infopart.nl>
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
To: Tasha Smith <natasha3641@yahoo.com>
Cc: netfilter@lists.netfilter.org

You supplied insufficient information :-)
/var/log/messages doesn't necessarily catch/log all messages send to
syslogd/klogd this depends on the configuration in your /etc/syslog.conf

Try this

add this line to /etc/syslog.conf
*.*			/var/log/allmessages

then
killall -1 syslogd
killall -1 klogd

Hmm that is for linux

maybe
killall -HUP syslogd
and
killall -HUP klogd
would be safer.

Anyways, make sure they're still running after that killall command it
should only make it reread the config.
ps -Af | grep log
to see

then you should get the lines in
/var/log/allmessages file
please note this file can grow quite quickly
do
man syslog.conf
for more info


> -----Oorspronkelijk bericht-----
> Van: Tasha Smith [mailto:natasha3641@yahoo.com]=20
> Verzonden: maandag 21 oktober 2002 11:39
> Aan: netfilter@lists.netfilter.org
> Onderwerp: Logging Portscans
>=20
>=20
> Hii,
> I was wandering why iptables is NOT logging to my=20
> /var/log/messages/ NMAPS stealth port scans or when i telnet=20
> any port?.  Here are what the first part of my rules look=20
> like. How can u add some rules soo i can see (LOG) all ports=20
> scans or connection attemps on my machine???? iptables 1.2.7=20
> kernel 2.4.19
>=20
> iptables --flush
> iptables -t nat --flush
> iptables -t mangle --flush
>=20
> iptables -A INPUT -i lo -j ACEPT
> iptables -A OUTPUT -o lo -j ACCEPT
>=20
> # I tryed to put in a logging rule here and it didnt log the=20
> port scan! iptables -A INPUT -i eth0 -p tcp \
>          --dport 111 -j LOG-prefix "DROP sunrpc: "
>=20
> iptables --policy INPUT DROP
> iptables --policy FORWARD DROP
> iptables --policy OUTPUT ACCEPT
>=20
> # I tryed a LOG Policy here too like this!
> iptables -i INPUT -p tcp -j LOG --log-prefix "log-tcp-test: "
>=20
> iptables -A INPUT -m state --state ESTABLSIHED,RELATED -j=20
> ACCEPT iptables -A FOWARD -m state --state=20
> ESTABLSIHED,RELATED -j ACCEPT iptables -A OUTPUT -m state=20
> --state ESTABLSIHED,RELATED -j ACCEPT
>=20
> And then after this i have all stuff that is allowed on my=20
> machine like DNS, DHCP, and my forwarding rules!=20
> =20
>=20
> __________________________________________________
> Do you Yahoo!?
> Y! Web Hosting - Let the expert host your web site=20
http://webhosting.yahoo.com/



