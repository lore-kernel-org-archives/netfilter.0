From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: iptables and redirects
Date: Wed, 12 Feb 2003 01:54:56 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302120154.56101.netfilter@newkirk.us>
References: <20030211194431.1B87617C6E@delta.meyer.home>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030211194431.1B87617C6E@delta.meyer.home>
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
To: anmeyer@anup.de, Andreas Meyer <anmeyer@gmx.net>, IPtables <netfilter@lists.netfilter.org>

On Tuesday 11 February 2003 02:44 pm, Andreas Meyer wrote:
> Hello all!
>
>
> I have problems getting PREROUTING to work.
> I defined two simple rules:
>
> iptables -t nat -A PREROUTING -i eth0 -p tcp -d 192.168.1.210 --dport
> 80  -j DNAT --to 192.168.1.3:3128=20
> iptables -t nat -A PREROUTING -i eth0 -p tcp -d 192.168.1.210 --dport=20
> 110 -j DNAT --to 192.168.1.75:110

> I try to telnet to the iptables-host from workstation:
>
> telnet 192.168.1.210 80
> and the connection times out.

Yep, It will do that.  Assuming you have FORWARD rules that would allow=20
this traffic, and that eth0 is the LAN, the problem is likely this:  you=20
telnet to 192.168.1.210 from a client on the LAN, and it DNATs the=20
connection to another IP in the same subnet.  The final recipient if=20
that initial connection (whether back to the same machine, or to the=20
other one) replies DIRECTLY to the initiating client, (it recognizes=20
that the client is local to it) instead of back through the=20
iptables-host to be unDNATted, so the response DOESN'T come from=20
192.168.1.210, is discarded silently by the client, and never even hits=20
the iptables-host on the return trip.  The client keeps waiting for a=20
response from 192.168.1.210, and eventually times out.

For connections from OUTSIDE the LAN, it is sufficient to use the=20
PREROUTING rule just as you have it, along with the appropriate FORWARD=20
rules to allow the connection through both ways.  (since the return=20
traffic would go through iptables-host anyway, according to your=20
diagram) =20

If you need to connect from inside the LAN, you will also need a=20
POSTROUTING rule to SNAT those specific connections so they appear to=20
originate from iptables-host, ensuring that the return packets come back=20
there to be unDNATted (and now unSNATted as well) and forwarded back to=20
the client.

> I have no clue what is going on. No entries in the logs, nothing.
>
> ## Logging
> iptables -N nirwana
> iptables -A nirwana -p ICMP -j LOG --log-prefix "verw. ICMP Paket "=20
> --log-level info iptables -A nirwana -p UDP  -j LOG --log-prefix
> "verw. UDP Paket "   --log-level info iptables -A nirwana -p TCP  -j
> LOG --log-prefix "verw. TCP Paket "   --log-level info iptables -A
> nirwana -j DROP
>
> iptables -A INPUT   -j nirwana
> iptables -A FORWARD -j nirwana
> iptables -A OUTPUT  -j nirwana

You should be catching the initial packet in the FORWARD chain's TCP log=20
rule.  However, to use LOG as an on-the-fly trace tool, you should=20
usually use "-I FORWARD 1" to ensure no other rule ACCEPTs the packet=20
before it is LOGged.  The packet would never go to INPUT or OUTPUT with=20
a DNAT.

j


