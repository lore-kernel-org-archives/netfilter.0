From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: Port forwarding not working (nfcan: to exclusive)
Date: Sun, 29 Apr 2007 00:04:16 -0400
Message-ID: <1177819456l.3596l.0l@soapy>
References: <000001c78a0c$a7b02cd0$dededede@neilhp>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000001c78a0c$a7b02cd0$dededede@neilhp> (from
	+nfcan+jimlaur+ce6b708e36.neil#JAMMConsulting.com@spamgourmet.com on
	Sat Apr 28 23:15:33 2007)
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 04/28/2007 11:15:33 PM, Neil Aggarwal - neil@JAMMConsulting.com wrote:
> Hello:
>=20
> I have a Linux box acting as a firewall and gateway
> for my local internet.  The private IP is 192.168.1.1
>=20
> Behind that, I have a Linksys VPN box.  Its IP
> is 192.168.1.101.
>=20
> If I go to my Linux box and issue this command:
>=20
> telnet 192.168.1.101 1723
>=20
> I get this output:
>=20
> Trying 192.168.1.101...
> Connected to 192.168.1.101 (192.168.1.101).
> Escape character is '^]'.
>=20
> Everything is fine.  I can connect to the Linksys box
> without a problem.
>=20
> Now, I want to set up routing from the external world
> to be able to access the Linksys box.
>=20
> I added this rule to my firewall to do the forwarding:
>=20
> /sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 -d $ETH0_IP=20
> 	--sport 1024: --dport 1723=20
> 	-j DNAT --to $LINKSYS_VPN_IP:1723

>=20
> It is all one one line, I added link breaks for readability.
>=20
OK, you have forwarded this port from the firewall to the vpn  box.
Now you have to accept it.
(You must have a default drop policy in forward.)

> When I tried to telnet to port 1723 on my public IP, I saw logs
> from my firewall for inbound packets so I added these rules:
>=20
> /sbin/iptables -A FORWARD -i eth0 -o eth1 -d $LINKSYS_VPN_IP=20
> 	-p tcp --sport 1024: --dport 1723=20
> 	-m state --state NEW,ESTABLISHED -j ACCEPT
> /sbin/iptables -t nat -A POSTROUTING -o eth1 -d $LINKSYS_VPN_IP=20
> 	-p tcp --sport 1024: --dport 1723=20
> 	-m state --state NEW,ESTABLISHED -j ACCEPT
>

You need packets to flow in both directions.
The outside should be able to initiate
so the first rule looks good:

/sbin/iptables -A FORWARD -i eth0 -o eth1 -d $LINKSYS_VPN_IP=20
	-p tcp --sport 1024: --dport 1723=20
	-m state --state NEW,ESTABLISHED -j ACCEPT

But you need to accept the return packets.=20
How about this for the return pattern:
 =20
/sbin/iptables -A FORWARD -i eth1 -o eth0 -s $LINKSYS_VPN_IP=20
	-p tcp --sport 1723=20
	-m state --state ESTABLISHED -j ACCEPT

The accept in the nat postrouting can be removed.

HTH

--=20
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.


