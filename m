From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Connection tracking FTP and ICMP
Date: Sun, 4 Nov 2012 18:20:42 -0500
Message-ID: <201211041820.42671.neal.p.murphy@alum.wpi.edu>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Sunday, November 04, 2012 04:23:59 PM Csord=C3=A1s Csaba Ifj. wrote:
> Hi List,
>=20
> I would like to ask you about the correctness of the information
> published in a blog (www.sns.ias.edu/~jns/wp) around 2006.
>=20
> The rules in the FTP part of the document seems too lazy for me and
> the ICMP rules seems also "uncommon". But most probably _I'm wrong_
> and need to further investigate.

When allowing conns, you need only specify port 21 when you have the FT=
P=20
helper running. (These two rules normally include port 115 for sftp whi=
ch is=20
why I use 'multiport'.)

# Allow all outbound client ftp conns to remote servers (actually a
#   conn to anything listening on port 21, FTP or not).
iptables -A OUTPUT -o eth0 -p tcp -m multiport --dports 21 \
  -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

# Allow only related inbound (s)ftp conns to local clients
iptables -A INPUT -i eth0 -p tcp -m multiport --sports 21 \
  -m state --state RELATED,ESTABLISHED -j ACCEPT

The forward chain uses similar rules when passing packets between two=20
interfaces. The FTP helper recognizes when the first packet of a new FT=
P DATA=20
conn is related to an existing FTP CTRL conn, regardless of the DATA pa=
cket's=20
src & dest ports.

This scheme works just great when allowing conns through the firewall.

[Digression]
The scheme falls down when using the 'time' functions to shut down exis=
ting=20
conns. At least I haven't found a way to tell a rule to include *establ=
ished=20
conns related to this rule*. Once a conn becomes ESTABLISHED, the DATA =
conn's=20
relation to its CTRL conn is lost; that is, it is no longer RELATED. Th=
us,=20
these rules:

# Allow all outbound client ftp packets to remote servers. But first re=
ject
#   them Mondays from 2AM to 5AM and reset the TCP conn.*
iptables -A OUTPUT -o eth0 -p tcp -m multiport --dports 21 \
  -m time --timestart 02:00:00 --timestop 05:00:00 --weekdays Mon \
  -m state --state NEW,RELATED,ESTABLISHED -j REJECT --reject-with tcp-=
reset
iptables -A OUTPUT -o eth0 -p tcp -m multiport --dports 21 \
  -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

# Allow only related/est'ed inbound ftp packets to local clients, but r=
eject
#   them Mondays from 2AM to 5AM
iptables -A INPUT -i eth0 -p tcp -m multiport --sports 21 \
  -m time --timestart 02:00:00 --timestop 05:00:00 --weekdays Mon \
  -m state --state RELATED,ESTABLISHED -j REJECT --reject-with tcp-rese=
t
iptables -A INPUT -i eth0 -p tcp -m multiport --sports 21 \
  -m state --state RELATED,ESTABLISHED -j ACCEPT

will reset only existing CTRL conns--and block new conn attempts--Monda=
ys=20
2AM-5AM. If you add port 20, they'll handle ACTV data conns. But while =
they=20
can block new PASV conns, they can never see existing PASV data conns t=
o reset=20
them *because the ports in use cannot be known to the netfilter rules*.

Yes, I know I could use CONNMARKs to mark related conns, but that's a l=
ot of=20
extra rules. There should be a packet/conn state, perhaps something lik=
e=20
RELCONN, that essentially says, "this rule also applies to packets belo=
nging=20
to conns that were RELATED to this rule." With such states, netfilter=20
firewalls would become much more solid in that while it is important to=
 allow=20
and block unwanted new connections, it is also important to be able to=20
implement time-based access controls that can allow new connections and=
=20
immediately sever existing connections. This can't be done right now in=
 all=20
cases.

N


* Actually, the rejection process is more involved. If it's an establis=
hed TCP=20
conn, it gets reset. Otherwise (UDP/GRE/etc., SYN) it gets an ICMP admi=
n-
prohibited packet.
