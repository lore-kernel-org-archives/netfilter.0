From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: sub interface filtering
Date: Wed, 2 Apr 2003 15:56:00 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304021556.00113.netfilter@newkirk.us>
References: <000b01c2f947$feb84a80$8b01a8c0@win2k.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000b01c2f947$feb84a80$8b01a8c0@win2k.com>
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
To: Mike <mikeeo@msn.com>, netfilter@lists.netfilter.org

On Wednesday 02 April 2003 01:45 pm, Mike wrote:
> Hi guys I have the following setup and rules. And I cant seem to get
> the filtering to work.

> iptables -t nat -A PREROUTING -p tcp <routeable internetIP/28> --dport
> 80 -j DNAT --to 192.168.1.197
>
> iptables -t nat -A PREROUTING -p tcp <routeable internetIP/28> --dport
> 443 -j DNAT --to 192.168.1.197
> iptables -t nat -A POSTROUTING -o eth2 -s 192.168.1.197 -j SNAT --to
> <routeable internetIP/28

> but when I scan eth2:1 or eth2:2 from an outside machine I can see ALL
> the local services (ssh, ptptp,dns etc..) Is connection not passing
> the forwading chain?

You are DNATting dport 80 and dport 443, but the remainder of the ports=20
are not being DNATted, so they still target the firewall box.  You'd=20
need to DNAT all connections to the specified IP, then DROP all except=20
ports 80 and 443 in FORWARD to avoid this.

Of course, this also shows that you are letting lots of (all?!?) ports=20
through the INPUT chain to the box itself from outside, which you should=20
lock down as well...  A DROP policy on INPUT is called for, then ACCEPT=20
required ports from eth2 for externally-accessed services (if any) and=20
ACCEPT required (or all if desired) ports from the LAN machines.

j


