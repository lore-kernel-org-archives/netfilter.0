From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: AW: a NAT question
Date: Fri, 16 Jul 2004 11:43:05 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E342@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: Payal Rathod <payal-netfilter@scriptkitchen.com>, Netfilter ML <netfilter@lists.netfilter.org>

Payal Rathod wrote:
> On Fri, Jul 16, 2004 at 11:51:54AM +0300, Micha Silver wrote:
>> Have you tried Shorewall? http://www.shorewall.net
>> You can do it with either DNAT or proxy arp.
>=20
> Ok. I will try it. But I am not too fond of using tools for firewall.
> Thanks.
> -Payal

The setup of a Script-only setup isn't too hard. You have to abandon the
concept of ip aliases since netfilter dropped support for the concept.
You only deal with the root interface and ip addresses.

If you want to setup a multi-ip address interface from the command line,
you could use something like the following:

<Assming you already have $ip0 setup on eth0 and netmask =3D=3D 24, and =
gw
=3D=3D $gw>
ip addr add $ip1/24 dev eth0
ip addr add $ip2/24 dev eth0

Now, any data sent to 200.1.1.2-4 will be sent to your Firewall.

Assuming you have a block-all,accept-selected rule, you'd setup
something like the following:

iptables -t nat -A PREROUTING --destination $ip1 -p tcp --dport 21 -j
DNAT --to $internal_1
iptables -t nat -A PREROUTING --destination $ip1 -p tcp --dport 9001 -j
DNAT --to $internal_2
iptables -t nat -A PREROUTING --destination $ip1 -p tcp --dport 80 -j
DNAT --to $internal_2
iptables -t nat -A PREROUTING --destination $ip1 -p tcp --dport 25 -j
DNAT --to $internal_2

iptables -A FORWARD --destination $internal_1 -p tcp --dport 21 -j
ACCEPT
iptables -A FORWARD --destination $internal_2 -p tcp --dport 9001 -j
ACCEPT
iptables -A FORWARD --destination $internal_2 -p tcp --dport 80 -j
ACCEPT
iptables -A FORWARD --destination $internal_2 -p tcp --dport 25 -j
ACCEPT

echo "1" > /proc/sys/net/ipv4/forward

My example used the same external interface to handle all requests. You
can replace the --destination field with any one that you've bound to
the external interface.

