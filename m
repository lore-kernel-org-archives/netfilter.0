From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Is it possible connecting to a forwarded port from inside the
	network?
Date: 16 Mar 2003 21:25:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1047846354.3293.23.camel@elendil.intranet.cartel-securite.net>
References: <!~!AAAAAO0Ci8RCKNNHt538Ob9jsx6kk0gA@taralnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <!~!AAAAAO0Ci8RCKNNHt538Ob9jsx6kk0gA@taralnetworks.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Jiwei Wang <jiwei@taralnetworks.com>
Cc: netfilter@lists.netfilter.org

Le dim 16/03/2003 =E0 20:18, Jiwei Wang a =E9crit :
> I'm using iptables on a RedHat 8.0 box to do firewalling and port
> forwarding. The port-forwarding works perfectly when accessed from outs=
ide
> my internal networks.   However, I cannot access the forwarded ports fr=
om
> inside the network.=20

A quite common issue...

> I tried to use two IP addresses to do this. That is, I have public IP
> addresses a.b.c.x and a.b.c.y both assigned to my Internet facing eth0;=
 I
> use a.b.c.x for SNAT and a.b.c.y for DNAT port forwarding (a.b.c.y:80 i=
s
> forwarded to an internal host port 80); from the Internet a.b.c.y:80 wo=
rks
> ok, but I still cannot access a.b.c.y:80 from any of my internal box.

I suppose internal network 192.168.1.0/24 (or whatever, it is not the
point), 192.168.10.1 firewall's inner IP and a.b.c.y:80 is DNATed to
192.168.10.2:80.


Internet------ FW ------- 192.168.10.0/24


Now 192.168.10.10 wants to reach a.b.c.y:80. It sends a packet
192168.10.1, which operates DNAT on it :

	a.b.c.y:80 ---> 192.168.10.2:8

Packets gets routed and 192.168.10.2 receive a SYN from 192.168.10.10.
According to its routing table, 192.168.10.0/24 is an attached network.
To send a respone back (SYN-ACK), it does not need the help og gateway,
as it can send it directly on the wire (same network than source). So it
sends directly SYN-ACK to 192.168.10.10.

192.168.10.10 now receive a SYN-ACK from 192.168.10.2, but has no
connection in progress for this host and sends back RST. It is still
waiting for a SYN-ACK from a.b.c.y, and connection times out for you
never get it.

To be short, to achieve this properly, you have to SNAT theses
connections on the gw for the internal network.

	iptables -t nat -A POSTROUTING -s 192.168.10.0/24 -d a.b.c.y \
		-j SNAT --to-source 192.168.10.1

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE


