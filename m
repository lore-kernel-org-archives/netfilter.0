From: Marcus Sundberg <marcus@ingate.com>
Subject: Re: Can't block DHCP with iptables?
Date: 28 May 2002 22:29:45 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <veheks3tja.fsf@inigo.ingate.se>
References: <Pine.LNX.4.21.0205280845400.11566-100000@colargol.tihlde.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.21.0205280845400.11566-100000@colargol.tihlde.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: roarbr@tihlde.org
Cc: netfilter@lists.samba.org

Roar Bj=F8rgum Rotvik <roarbr@tihlde.org> writes:

> In this scenario, the policy DROP exists before DHCP client starts up, but
> still the DHCP client manages to assign a new IP-address.
>=20
> ifconfig shows shows that eth0 has been assigned new IP-address. ping or
> any network traffic after that does not work, as expected.
>=20
> What I want to accomplish is to block all network traffic in/out up until
> a certain point, and that includes DHCP.

Iptables only deals with IP packets. DHCP-clients don't use the
IP-stack, but uses raw sockets to talk directly to the network
interface. Very simplified, what you have is this:

eth0 ----+------- iptables ----- IP-stack
         |        filtering
     Raw socket
         |
     DHCP-client

/Marcus
--=20
---------------------------------------+--------------------------
  Marcus Sundberg <marcus@ingate.com>  | Firewalls with SIP & NAT
 Firewall Developer, Ingate Systems AB |  http://www.ingate.com/

