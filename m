From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: I'm sure you can solve this
Date: Thu, 1 Apr 2004 09:36:56 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122F38@alderaan.smgtec.com>
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
To: decompose <decompose@orcon.net.nz>, netfilter@lists.netfilter.org

Firstly, what benefit are you trying to get from having multiple jumps
on the same subnet? It seems needlessly complicated.
You can 'bounce' off an interface with some dirty work. Example:

# Redirect all traffic coming from 192.168.1.* to 192.168.1.222,
assuming that 192.168.1.222 is the default gateway for this gateway. I
am assuming the internal IP address of this computer is 192.168.1.200

# You don't need the mark, but what the hell, its there if you like it
:-)
iptables -t mangle -A PREROUTING -s 192.168.1.0/16 -j MARK --set-mark
222
iptables -t nat -A POSTROUTING -d 192.168.1.222 -m mark --mark 222 -j
SNAT --to 192.168.1.200
# Allow in-out forwarding if using locked down FORWARD chain
iptables -t filter -A FORWARD -i eth1 -o eth1 -j ACCEPT


Mind you, because of the SNAT, you have to drop the benefit of knowing
the source address at the second gateway.

-----Original Message-----
From: decompose [mailto:decompose@orcon.net.nz]=20
Sent: Wednesday, March 31, 2004 10:47 PM
To: netfilter@lists.netfilter.org
Subject: I'm sure you can solve this


Hi Ive read the docs and still can't work it out (Yes I'm stupid)

Background: I want to forward traffic from hosts on the switch to=20
through router A to router B. (and later from router B to a host on the=20
switch, but i guess I could just invert the first problem).

I think one of the reasons i'm having trouble with this is because all=20
hosts are on the same subnet (here is the setup)

[switch]-->[router A]-->[router B]-->(Inet)
         192.168.0/24

Ive tryed various things this being one of them (where x is a host on=20
the switch)
iptables -t mangle -A POSTROUTING -p tcp -s 192.168.0.x -d 192.168.0.223

--destination-port 80

I hope my question is clear enough. Thanks in advance




