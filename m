From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: routing specific IP addresses
Date: Wed, 25 Feb 2004 10:40:14 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122EF7@alderaan.smgtec.com>
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
To: Dan Malvin <dmalvin@dunwoody.edu>, Netfilter <netfilter@lists.netfilter.org>

Dan Malvin wrote:
> I'd like to gain some understanding of an existing rule on my
> firewall that is allowing only a specific range if IP addresses
> outside.  This rule was created by the previous network admin. =20
>=20
> The rule is:
> -A FORWARD -s 10.1.1.0/255.255.255.192 -i eth2 -j ACCEPT
>=20
> I understand that the "/255.255.255.192" part of the above rule is
> allowing only a specific range of IP addresses out to the Internet.=20
> How is this rule working and how would I expand the range or create
> an new range? =20

255.255.255.192 is a netmask. A match to the netmask is performed by
performing a binary AND on the numbers you are comparing. For instance:


255.255.255.192
11111111 11111111 11111111 11000000

10.1.1.0
00000110 00000001 00000001 00000000
10.1.1.0 AND MASK
00000110 00000001 00000001 00000000

10.1.1.252
00000110 00000001 00000001 11111100
10.1.1.252 AND MASK
00000110 00000001 00000001 11000000 (THIS DOES NOT MATCH 10.1.1.0 AND
MASK)

10.1.1.1
00000110 00000001 00000001 00000001
10.1.1.1 AND MASK
00000110 00000001 00000001 00000000 (THIS DOES MATCH 10.1.1.0 AND MASK)


If you want to expand the range of IP addresses within this subnet, you
can either change your netmask to include the greater range of hosts
from within the network, or if the subnet doesn't span the full extent
of the subnet size needed, you can setup a rule for a new netmask.

For instance, if I have a network with 250 computers inside it, I would
use a /24 (255.255.255.0) netmask to cover all those addresses.
	-A FORWARD -s 192.168.0.0/255.255.255.0 -i eth2 -j ACCEPT
If later I want to add an additional 250 computers to my network, I
could either expand my netmask to /23 (255.255.255.254) with new
addresses starting with 192.168.1.0, or I could add a rule for the new
subnet with a new rule
	-A FORWARD -s 192.168.1.0/255.255.255.0 -I eth3 -j ACCEPT


Hope this isn't too above you. You 'really' need to pick up some basic
networking books to learn about this if you plan to be in network
administration for very long.

