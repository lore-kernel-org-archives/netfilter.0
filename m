From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: (no subject)
Date: Tue, 24 Dec 2002 22:01:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212242201.28090.netfilter@newkirk.us>
References: <F72E9GQvnbEG10Gai4o000000e5@hotmail.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F72E9GQvnbEG10Gai4o000000e5@hotmail.com>
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
To: Durgaprasada Kalluraya <dkalluraya@hotmail.com>, netfilter@lists.netfilter.org

On Thursday 19 December 2002 02:33 am, Durgaprasada Kalluraya wrote:

> ftp> ls
> 200 PORT command successful.
> 425 Can't build data connection: Connection timed out.
> ftp> bye
>
> But if I try the same thing from outside using a dialup connection all
> works fine for me!!!!

Is your dialup still going through the firewall, or is it direct to the=20
server?  Is it passive or active ftp?  Regardless of these, I suspect=20
that the problem is that you need to add:
modprobe ip_conntrack_ftp
so that the "RELATED" state recognizes and NAT functions handle both=20
passive and active FTP.  The data connection is a separate pair of=20
ports, negotiated by the server and client but embedded in a packet=20
instead of its header during negotiation, so netfilter won't normally=20
deal with them.  The helper ip_conntrack_ftp exists specifically for=20
this purpose, since it knows to examine the actual packet data of FTP=20
conrtol transactions looking for this and dealing with it correctly.

> $IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
> $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

> $IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -m state --state
> ESTABLISHED,RELATED -j
> ACCEPT

This is redundant and will never match a packet, since you accept EST/REL=
=20
for ANY interface, ip, and port in the rule before it.

> $IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d
> $DMZ_FTP_IP --dport ftp -j allowed
> $IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d
> $DMZ_FTP_IP --dport ftp-data -j
> allowed

I presume you have a user-defined chain named "allowed"...

j


