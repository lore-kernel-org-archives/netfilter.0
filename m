From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: work ip address at home
Date: Thu, 23 Oct 2003 11:26:56 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E7C@alderaan.smgtec.com>
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
To: Brent Gregersen <gregerse@chemsun.chem.umn.edu>
Cc: netfilter@lists.netfilter.org

Ok, to get this up you will need NAT/Filtering changes. You have to
implement SNAT on the work-pc since the return path for the lm-server is
probably not your work computer itself. Plus, it gives the server the
impression that it is talking to an IP address on your work network.

Enable forwarding at your work computer
Then add something like the following:

# Include a rule for each maximum number of VPN interfaces you allow in,
though I assume that you would just need one. <VPN Interface> =3D=3D =
ppp0,
or ppp1, etc..
iptables -t nat -A POSTROUTING -o <VPN Interface> -j MASQUERADE

iptables -P FORWARD DROP
iptables -A FORWARD -i <VPN Interface> -o <LAN interface> -m state
--state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i <VPN Interface> -o <LAN interface> --destination
<lm server> -p udp --dport <lm_port> -j ACCEPT
# If the state filter doesn't conntrack your UDP connection for some
bazaar reason, use the following rule as well.
iptables -A FORWARD -i <LAN Interface> -o <VPN interface> --destination
<lm server> -p udp --sport <lm_port> -j ACCEPT

# This is assuming that your lm's protocol is a straight single
port->port path. The protocol may introduce some ugliness through other
methods. You may have to open more to accommodate for that.


