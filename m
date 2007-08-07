From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd
Date: Tue, 07 Aug 2007 16:28:54 +0200
Message-ID: <46B881A6.4030508@netfilter.org>
References: <00d601c7d8f8$6d082d90$0b0ffe0a@NS006819>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00d601c7d8f8$6d082d90$0b0ffe0a@NS006819>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org, Netfilter-failover list <netfilter-failover@lists.netfilter.org>

Rob Sterenborg wrote:
> # conntrackd -C /usr/local/etc/conntrackd/conntrackd.conf
> ERROR: conntrackd cannot start, please check the logfile for more info
>=20
> # tail /var/log/conntrackd.log
> [...]
> [Mon Aug  6 13:25:03 2007] (pid=3D5701) --- starting in console mode ---
> [Mon Aug  6 13:25:03 2007] (pid=3D5701) [FAIL] can't open multicast
> server!
> [Mon Aug  6 13:25:03 2007] (pid=3D5701) [FAIL] initialization failed

Extracted from conntrackd.conf:

        Multicast {
                IPv4_address 225.0.0.50
                IPv4_interface 192.168.100.100 # IP of dedicated link
                                    ^^^
Did you setup an interface with this IP? Otherwise the multicast sender
won't work, i.e. your dedicated link (ethX) must use the IP 192.168.100.100.

--=20
"Ser=E1 preciso viajar a trav=E9s de los ojos de los idiotas" -- Poeta en
Nueva York -- Federico Garc=EDa Lorca.

