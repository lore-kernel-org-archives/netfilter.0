From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Precedence of packet traverse through iptables chain,
	localrouting table and newly created routing table
Date: Wed, 14 Jan 2004 11:13:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074075196.806.40.camel@elendil.intranet.cartel-securite.net>
References: <Law11-OE54wbW2Y2dtd00009c21@hotmail.com>
	 <1074069559.815.10.camel@elendil.intranet.cartel-securite.net>
	 <Law11-OE50makMdZQM60000a397@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law11-OE50makMdZQM60000a397@hotmail.com>
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
To: kaiwen <cal_kaiwen@hotmail.com>
Cc: netfilter@lists.netfilter.org

Le mer 14/01/2004 =E0 09:45, kaiwen a =E9crit :
> Sorry, my mistake, br0 is eth1 in LINUX ROUTER.

I don't really understand what you're trying to do.

Your new routing table for marked packets is :

[root@son-ag webauth]# ip route show table test2
192.168.8.0/24 via 192.168.8.88 dev br0

So you tell that 192.168.8.0/24 destinations have to be routed via
192.168.8.88 on eth1. I do not see what for. I mean stations in
192.168.8.0/24 will _never_ use your box as a gateway for 192.168.8.0/24
unless they try to reach 192.168.8.88... If packet arrives on another
network (e.g. via eth0), then it is already on the right box...

I know it's for testing purposes, but I really think you're dealing with
a strange routing scheme that does not make things easy to understand.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

