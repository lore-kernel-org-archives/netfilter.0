From: "Wes James" <wes.james@usu.edu>
Subject: opening whole in iptables for a vpn
Date: Thu, 2 Jan 2003 20:54:35 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5CA287DBA85BF649A45916B75FD20E0E08D8F9@exchange01.blue.usu.edu>
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
To: netfilter@lists.netfilter.org

I have tried to get the right iptables rules to work for a vpn
connection.

Usually anything going out this rh8 box works fine.  Why do I need to
punch a hole for the vpn.? I have noticed that holes need to be punched
for the dns and bootp, but why - when this box is the originator of the
traffic?

I have finally gotten these rulles to work in that the vpn loads, but
the vpn still does not work right.  The only way I can get it to work
right is to turn iptables off (service iptables stop).

These are the rules:

-A RH-Lokkit-0-50-INPUT -m udp -s 1.2.3.0/24 -d 0/0 --dport 800 -p udp
-j ACCEPT
-A RH-Lokkit-0-50-INPUT -m udp -s 1.2.3.0/24 -d 0/0 --dport 8400 -p udp
-j ACCEPT

What else do I need to do to get the vpn to work on the network 1.2.3.0
on ports 500 and 4500?

These work for someone that use ipchains: =20

-A input -p udp -s 1.2.3.0/24 -d 0/0 800 -j ACCEPT
-A input -p udp -s 1.2.3.0/24 -d 0/0 8400 -j ACCEPT

Are the iptables rules above converted right?

thanks,

wj



