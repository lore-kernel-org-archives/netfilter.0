From: "Elmshauser, Erik" <erike@pbgnw.com>
Subject: RE: Accessing problems from the inside network
Date: Mon, 24 Mar 2003 09:22:30 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0FD2E5E35F0C0D41AEA66C9C6F39F30D086AF9@HERMES.pbgnw.com>
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
To: Miguel Manso <mmanso@yahoo.com>, netfilter@lists.netfilter.org

> -----Original Message-----
> From: Miguel Manso [mailto:mmanso@yahoo.com]
> Sent: Sunday, March 23, 2003 6:06 PM
> To: netfilter@lists.netfilter.org
> Subject: Accessing problems from the inside network
>=20
> Now, I've this rule:
>=20
> iptables -t nat -A PREROUTING -i ppp0 -d 123.123.123.101 -j DNAT --to
> 192.168.1.10
>=20
> which redirects all the traffic from the 123.123.123.101 IP to the
internal
> 192.168.1.10 ip.
>=20
	You can't be too specific here, this rule DNATs any traffic
coming in the ppp0 interface going to 123.123.123.101 to the internal
address 192.168.1.10.

> I've masquerade activated and I thought everything was doing fine... I
can
> access my internal machine from outside and today, I've found i've a
problem.
>=20
> When I'm on the 192.168.1.10 machine and I try, let's say, a 'ssh
> 123.123.123.101' I can't access it. I mean, I can access ouside
machines, I
> can
> access my internal machine from the outside but from my internal
network I
> can't access my own machine if I refer to it using it public IP.
>=20
> Any suggestion?
>
	when you are on the 192.168.1.10 machine, your traffic probably
comes into the firewall on interface eth0, therefore the DNAT rule
doesn't match it.  Add another rule for the interface that 192.168.1.10
is on, or remove the '-i ppp0' from the above rule.

	Also, when you have the firewall doing dnat back to the same
network, you should also alter the source in those packets to get the
192.168.1.10 machine to reply to itself through the firewall, or the
session probably won't work.  Use something like this:

iptables -t nat -A POSTROUTING -i eth0 -s 192.168.1.0/24 \
 -d 192.168.1.10 -j SNAT --to $LAN_IP

where the eth0 is the interface attached to your network, and $LAN_IP is
the LAN IP of that interface.
	--Erik


Rev. Dr. Erik C Elmshauser D.D.
Head of I.T.
Pacific Benefits Group NW LLC
erike@pbgnw.com
Phone  - 800.259.0455
Fax    - 800.662.0082
 There are 10 kinds of people in the world,
Those that can do binary arithmetic, and those that can't.


