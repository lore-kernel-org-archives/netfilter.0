From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: ftp server issue, trying to DL 1.2.7a
Date: Fri, 06 Sep 2002 11:39:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D7877D3.6040608@fugmann.dhs.org>
References: <NEENJAPFEAIEMGMNIGFLMEKLCCAA.rwideman@austin.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob <rwideman@austin.rr.com>
Cc: netfilter@lists.netfilter.org

Rob wrote:
> ftp> dir
> 227 Entering Passive Mode (62,128,28,62,182,53).
> 
As alot of others replies the problem is when ftp enters passive mode,
the server initiates a dataconnection to your machine.

Fortunatly, is a "port" command is send first over the command channel,
in order to let the client and server know how and where this new 
connection will be established.

This can be caught by the netfilter code, and netfilter can allow this 
connection to be accepted from the server in a quite clever way, because 
netfilter is _statefull_. ipchans was not, and hence this was not possible.

The following gives an example of how netfilter can handle this:
Lets assume that you are sittin behind a iptables firewall doing nat,
and all you want is to allow users from the inside (eth0) to conenct to 
the internet through the external link (ppp0)

# First load the heper modules for the ftp protocol connection tracking.
# Delete these lines, if the modules are compiled statically into the
# kernel.
modprobe ip_conntrack_ftp
# And the nat part for the ftp protocol.
modprobe ip_nat_ftp

# Set default policies.
iptables -P INPUT drop
iptables -P FORWARD drop
iptables -P OUTPUT accept

# NAT all connections
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUEADE

# Allow the mashine to make any kind of connections.
iptables -A INPUT -m state --state ESTABLISHED,RELATED \
	-j ACCEPT

# Allow the same for machines located behind the firewall.
iptables -A FORWARD -i eth0 -o ppp0 -j ACCEPT
iptables -A FORWARD -o eth0 -i ppp0 -m state \
	--state ESTABLISHED,RELATED -j ACCEPT


And we are all done. The trick is to use the 'state' match. The RELATED
state will match the first packet in the data-connection from the 
ftp-server in passive mode. Any packets hereafter will be in the 
ESTABLISHED state.

As you might have noticed, there is no protocol speicifer. So this also 
works for e.g. DNS lookups (udp) and ICMP packets related to an already 
esablished connection. Statefull firewalling is just sooo great.

There is no reason for you to patch the kernel in order to do this,
this has been possible for a long time.

Regards
Anders Fugmann

-- 
Author of FIAIF
FIAIF Is An Intelligent Firewall
http://fiaif.fugmann.dhs.org


