From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Port Forwarding for port 25 (again...)
Date: Mon, 24 Feb 2003 21:53:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302242153.47253.netfilter@newkirk.us>
References: <20030225005407.GA28447@first.knowledge.no>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030225005407.GA28447@first.knowledge.no>
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
To: Magnus Solvang <magnus@solvang.net>, netfilter@lists.samba.org

On Monday 24 February 2003 07:54 pm, Magnus Solvang wrote:
> I have a firewall set up with an internal (192.168.1.20) and
> an external ip-address (x.x.x.49). The former mailserver for
> this domain has been placed on the LAN, and given the address
> 192.168.1.101. MX for the domain still points to its old
> ip-address (x.x.x.34). The firewall is behind the router for
> the external domain.
>
> I'm can't seem to be able to forward smtp-traffic from x.x.x.34
> to 192.168.1.101 via the firewall. I _am_ able to forward port
> 25 from the firewalls external interface to the mailserver behind,
> but as mentioned - not from the former ip-address of the mailserver,
> and to the new internal address.
>
> I have tried numerous versions of:
> $IPTABLES -t nat -A PREROUTING -i $INET_NCARD -d x.x.x.34 -p tcp \
> --dport 25 -j DNAT --to-destination 192.168.1.101:25
>
> But a telnet to the old, external ip-address of the mailserver
> just hangs (untill it returns a "No route to host".

Which sums it up pretty accurately, I suspect.  If the firewall has an=20
external IP x.y.z.49, then it will handle traffic to that IP.  If the MX=20
(or your telnet test) points to x.y.z.34, then the upstream router will=20
be looking for something that responds to _that_ IP.  If it cannot find=20
anything using that IP, then there is no route.  Presuming that x.y.z=20
are the same in both cases, you may get the results you want with:

ifconfig eth0:1 add x.y.z.34

Where eth0 would be the interface with x.y.z.49 on it, $INET_NCARD in=20
your rule above.  This will create a second 'virtual' interface that=20
responds to this second IP, in addition to the main eth0 responding to=20
the present firewall IP.  The interface will still be referred to as=20
eth0 in iptables rules, but it will now handle both IPs.  DNAT will be=20
reversed properly, so return traffic will appear to come from x.y.z.34=20
without further work, but if you need the mailserver to initiate=20
connections that appear to come from that IP then you will need to=20
explicitly SNAT those connections, otherwise it will appear as x.y.z.49=20
if it makes a new connection.

j


