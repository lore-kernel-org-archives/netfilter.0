From: "wickedsun" <wickedsun@phreaker.net>
Subject: Is iptables kickin' that much?
Date: Fri, 6 Sep 2002 09:40:19 -0400 (Eastern Daylight Time)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D78B043.000003.00348@athlon1000>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

I'm not sure I understood very well what you explained. But I have only o=
ne
thing to say, it works. Now the question is, will this work with any
protocol? (ftp, irc, etc). The thing is scary me a bit. I read in your em=
ail
that you have to load up a FTP module (which I have compiled in the kerne=
l)
and it seems to me that it works with other protocol as well. (I was able=
 to
enable Active in DC++ without having to forward manually each ports like =
I
used to do).=0D
=0D
This was of a huge help for the iptables newbies (including me) and thank=
s.=0D
=0D
=0D
=0D
Charles=0D
=0D
-----------------------=0D
Original Message:=0D
 As alot of others replies the problem is when ftp enters passive mode,=0D
the server initiates a dataconnection to your machine.=0D
=0D
Fortunatly, is a "port" command is send first over the command channel,=0D
in order to let the client and server know how and where this new =0D
connection will be established.=0D
=0D
This can be caught by the netfilter code, and netfilter can allow this =0D
connection to be accepted from the server in a quite clever way, because =
=0D
netfilter is _statefull_. ipchans was not, and hence this was not possibl=
e.=0D
=0D
The following gives an example of how netfilter can handle this:=0D
Lets assume that you are sittin behind a iptables firewall doing nat,=0D
and all you want is to allow users from the inside (eth0) to conenct to =0D
the internet through the external link (ppp0)=0D
=0D
# First load the heper modules for the ftp protocol connection tracking.=0D
# Delete these lines, if the modules are compiled statically into the=0D
# kernel.=0D
modprobe ip_conntrack_ftp=0D
# And the nat part for the ftp protocol.=0D
modprobe ip_nat_ftp=0D
=0D
# Set default policies.=0D
iptables -P INPUT drop=0D
iptables -P FORWARD drop=0D
iptables -P OUTPUT accept=0D
=0D
# NAT all connections=0D
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUEADE=0D
=0D
# Allow the mashine to make any kind of connections.=0D
iptables -A INPUT -m state --state ESTABLISHED,RELATED \=0D
-j ACCEPT=0D
=0D
# Allow the same for machines located behind the firewall.=0D
iptables -A FORWARD -i eth0 -o ppp0 -j ACCEPT=0D
iptables -A FORWARD -o eth0 -i ppp0 -m state \=0D
--state ESTABLISHED,RELATED -j ACCEPT=0D
=0D
=0D
And we are all done. The trick is to use the 'state' match. The RELATED=0D
state will match the first packet in the data-connection from the =0D
ftp-server in passive mode. Any packets hereafter will be in the =0D
ESTABLISHED state.=0D
=0D
As you might have noticed, there is no protocol speicifer. So this also =0D
works for e.g. DNS lookups (udp) and ICMP packets related to an already =0D
esablished connection. Statefull firewalling is just sooo great.=0D
=0D
There is no reason for you to patch the kernel in order to do this,=0D
this has been possible for a long time.=0D
=0D
Regards=0D
Anders Fugmann=0D
=0D
 =0D
 =0D
 =0D
-----------------=0D
Charles D'Aoust=0D
wickedsun@phreaker.net=0D
wicked@unraved.org

