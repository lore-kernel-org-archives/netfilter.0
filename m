From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: pls help a beginner linux admin - problem with packetfilter setup
Date: Mon, 16 Dec 2002 16:13:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212161613.53061.netfilter@newkirk.us>
References: <NHEFIMOGNFCHOOHNLFFEMEHOCFAA.eugenius@freemail.hu>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NHEFIMOGNFCHOOHNLFFEMEHOCFAA.eugenius@freemail.hu>
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
To: eugenio <eugenius@freemail.hu>, netfilter@lists.netfilter.org

On Saturday 07 December 2002 09:38 am, eugenio wrote:
> I need to set packetfiltering on a debian linux firewall to enable a
> network game.
> Necessary firewall settings are descibed here:
> http://support.microsoft.com/default.aspx?scid=3DKB;en-us;q240429
>
> The system has client computers with 192.168.1.1x fix local IP
> addresses (no DHCP), and a gateway with both internal (192.168.1.1)
> and external (both fixed) IP adresses, w/ two network card of course
> (eth0 - external, eth1 - internal).
>
> Can anyone give me a hint what settings are necessary?

I assume that the network is functional as it stands, and that the client=
=20
machines are SNATted to allow internet access already.

If your client computers are only functioning as clients in the game,=20
this should work:

iptables -A FORWARD -i eth1 -p tcp  \
=09-m multiport --dport 6073,47624 -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED  \
=09-j ACCEPT

If you are allowing it only for specific machines, since you have static=20
local IPs, you can tighten this up as follows:

iptables -A FORWARD -s a.b.c.d -p tcp  \
=09-m multiport --dport 6073,47624 -j ACCEPT
iptables -A FORWARD -s a.b.c.d -m state  \
=09--state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -d a.b.c.d -m state  \
=09--state ESTABLISHED,RELATED -j ACCEPT

This will allow the clients to communicate to the gameserver/host=20
initially, then allow established and related connections each way. =20
Just use this trio of rules for each IP that you want to allow. Note=20
that this will allow est/rel for ALL allowed connections, (but only from=20
the specified machines in the second version) so if this is undesireable=20
then you will need to specify each port range explicitly, like:

iptables -A FORWARD -i eth1 -p tcp -m multiport
=09--dport 6073,47624 -j ACCEPT
iptables -A FORWARD -p tcp --dport 2300:2400 -j ACCEPT
iptables -A FORWARD -p udp --dport 2300:2400 -j ACCEPT

You can tighten up any of these rules by specifying IP's of allowed local=
=20
machines, and in some cases you can specify IP's of remote machines,=20
since some of these games only ever connect to one or a small number of=20
IP's that handle all gaming communications.  However, the state rules=20
will need to be duplicated for input AND output traffic in this case,=20
since both are required for the port 2300-2400 (or EST/REL) connections. =
=20

Note also that while EST/REL may seem insecure, it is in fact quite a bit=
=20
more secure than simply opening up 204 ports permanently.  If at all=20
possible, the second approach, or the initial connections as specified=20
there with the single EST/REL from the first, is the best answer.  If=20
you get things running this way first, you can log some game traffic and=20
see if there is a consistent remote IP used, and rewrite rules with that=20
if desired, which will be about as tight as you can get it, without=20
manually enabling/disabling all of this on demand when gaming is=20
desired.

Also, depending upon how the particular game communicates, you may find=20
it necessary to explicitly open the ports as in the third example, since=20
some games allow or even rely on communication directly between client=20
machines, and this would represent a new connection, not related=20
(state-wise) to the gameserver connection.

Finally if a local machine will function as a host (if even possible,=20
depends on the game) then you need to allow the reverse of the initial=20
connection as well, but will also need DNAT to allow internet clients to=20
connect, and only one server will probably be possible.

j

