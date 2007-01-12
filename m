From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Need to solve a NAT problem, any takers.
Date: Fri, 12 Jan 2007 16:45:13 +0100
Message-ID: <45A7AD09.30401@plouf.fr.eu.org>
References: <57F9959B46E0FA4D8BA88AEDFBE5829024EF8A@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE5829024EF8A@pxtbenexd01.pxt.primeexalia.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Gary W. Smith a =E9crit :
>=20
> Internally our DNS server are split giving us internal IP's when querie=
d
> internally and external's when queried externally.  This works fine.
> Our second DNS server internally slaves the primary.  Because we are
> using this split functionality when it slaves the internal IP's it gets
> the internal IP configuration.  Works great.  But in order to replicate
> the external range it must do so by replicating from the external IP.

Just being curious : why do you want to replicate the external view on=20
the slave DNS server ? If I understand correctly, only the primary DNS=20
server is reachable from the outside.

> This fails at the IP's is NAT'd in by port only.  Years ago we solved
> this by running a second POSTROUTING rule and an OUTPUT rule on the
> firewall.  When I load these rules now=20
>=20
> Jan 11 18:11:41 hsfiw01 kernel: NAT: no longer support implicit source
> local NAT
> Jan 11 18:11:41 hsfiw01 kernel: NAT: packet src 10.40.0.13 -> dst
> 80.80.80.66
>=20
> I understand that this is now expected functionality in the 2.6.11+
> kernels.

Yes, this is the new DNAT behaviour in the OUTPUT chain. It has good and=20
bad sides. But I do not think your problem is related to this. The=20
OUTPUT chain has effect only on locally generated packets, not on=20
forwarded packets.

> Here is something that I derived from an older config, but obviously th=
e
> POSTROUTING isn't working.
>=20
> -A PREROUTING -d 80.80.80.66 -p tcp -m tcp --dport 53     -j DNAT
> --to-destination 10.40.0.13:53
> -A PREROUTING -d 80.80.80.66 -p udp -m udp --dport 53     -j DNAT
> --to-destination 10.40.0.13:53

I guess 10.40.0.13 is your primary (master) DNS server.

[...]
> -A POSTROUTING -s 10.40.0.0/24 -d 10.40.0.13 -p tcp -m tcp --sport 53 -=
j
> SNAT --to-source 80.80.80.66:53
> -A POSTROUTING -s 10.40.0.0/24 -d 10.40.0.13 -p udp -m udp --sport 53 -=
j
> SNAT --to-source 80.80.80.66:53

What do you expect these two rules to do ?

> -A POSTROUTING -o eth0 -j MASQUERADE

Ok.

> -A OUTPUT -d 80.80.80.66 -p tcp -m tcp --dport 53 -j DNAT
> --to-destination 10.40.0.13:53
> -A OUTPUT -d 80.80.80.66 -p udp -m udp --dport 53 -j DNAT
> --to-destination 10.40.0.13:53

Same question as above.

If you want inbound connections from the inside to 80.80.80.66:53 to be=20
successfully redirected to 10.40.0.13, you need three things :
- the DNAT rules as above ;
- SNAT rules so that the DNATed connection will appear as coming from an=20
specific external IP address. Your SNAT rules won't match the=20
connections, you need --dport 53 instead of --sport 53 and do not need=20
to change the source port into 53 ;
- and of course, ACCEPT packets from the internal interface back to the=20
internal interface in the FORWARD chain.

For TCP, assuming the internal interface is eth1 :

-t nat -A PREROUTING -d 80.80.80.66 -p tcp --dport 53 \
   -j DNAT --to-destination 10.40.0.13
-t nat -A POSTROUTING -s 10.40.0.0/24 -d 10.40.0.13 -p tcp --dport 53 \
   -j SNAT --to-source 80.80.80.66
-t filter -A FORWARD -i eth1 -o eth1 -j ACCEPT

For zone transfers to work through this redirection, you may need to=20
tune your DNS servers setup also.

