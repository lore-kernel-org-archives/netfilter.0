From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Help in IPTABLES
Date: Sat, 11 Jan 2003 03:31:56 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301110331.56066.netfilter@newkirk.us>
References: <20030111054656.20063.qmail@web40711.mail.yahoo.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030111054656.20063.qmail@web40711.mail.yahoo.com>
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
To: Mohammad Shakir <shakirz1@yahoo.com>, netfilter@lists.netfilter.org

On Saturday 11 January 2003 12:46 am, Mohammad Shakir wrote:
> Dear Friends,
>
> I have Installed Red Hat Linux 7.3 with hostname
> SERVER1 ipaddress 192.168.0.1 and also configure
> squid, DHCP, DNS services all are running well. I have
> also 30 PCs of windows 98 as a client with auto ip and
> set their gateway,dns,dhcpserver and so on from DHCP
> 192.168.0.1.
> Now I want that any request for browsing come from
> client automatically forward to my squid which is
> running on 3128 port and all others request go on
> direct ppp0 for this I configured one script which is
> given below.
>
> Is this script correct or not ?
>
> echo 1 > /proc/sys/net/ipv4/ip_forward
> /sbin/iptables --flush
> /sbin/iptables --table nat --flush
> /sbin/iptables --delete-chain
> /sbin/iptables --table nat --delete-chain
>
> /sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp
> --dport 80 -j REDIRECT --to-port 3128
> /sbin/iptables --table nat --append POSTROUTING -s
> 192.168.0.1/24 --out-interface ppp0 -j MASQUERADE
> /sbin/iptables --append FORWARD --in-interface eth0 -j
> ACCEPT

You also need a rule (or rules) to allow reply traffic back through the=20
FORWARD chain.  The following would probably suffice:
/sbin/iptables -A FORWARD -o ETH0 -m state   \
   --state ESTABLISHED,RELATED -j ACCEPT

In addition, to use the MASQUERADE target you also need to enable=20
tracking of the interface's dynamic IP with:
echo 1 > /proc/sys/net/ipv4/ip_dynaddr
If the IP is static, just use "-J SNAT --to " and the static IP.

I would _STRONGLY_ suggest that you set default DROP policy for all three=
=20
filter chains, (INPUT, OUTPUT, and FORWARD with either "-t filter" or no=20
table specified) and explicit ACCEPT rules for INPUT and OUTPUT that the=20
server requires. (Don't forget that this includes dport3128 in and=20
dport80 out for squid to work, as well as DHCP and DNS traffic)  This=20
will also require ACCEPT rules for FORWARD traffic, but the one you have=20
listed plus the one I noted should handle any traffic FROM the LAN and=20
any replies TO the LAN.  Finally, to be safe, you should only enable=20
forwarding (your first line above) AFTER you have set DROP policy,=20
preferably after all rules are in place.

If you really trust your LAN, you can fly with the FORWARD rule you have,=
=20
but you can also tighten things up quite a bit in the FORWARD chain by=20
ACCEPTing only specific traffic.  If you do this, you can add another=20
EST/REL rule for traffic from the LAN, or just remove the interface=20
match from the one suggested above.

It's not vital to have DROP policy for OUTPUT, but it IS pretty much=20
vital to DROP anything you don't explicitly need in INPUT, and probably=20
FORWARD.  As this ruleset stands, anyone on the internet can connect to=20
any port on this server, which is a really bad idea.

> This is other setup.
>
> I have setup two servers hostname server1 ip address
> 192.168.0.1 and hostname server2 ipaddress 192.168.0.2
> both servers are connected with dialup sepratly and
> also configure squid, DHCP, DNS services. I have also
> 100 PCs of windows 98 as a client with auto ip and set
> their gateway,dns,dhcpserver and so on from DHCP
> 192.168.0.1.
>
> Now I want that any request for browsing come from
> client automatically forward to my squid which is
> running on 3128 port on server 192.168.0.2 and all
> others request go on direct ppp0 of 192.168.0.1.
> Please help my what script I make for this.

Essentially the same setup on server1 as your previous scenario, all my=20
comments apply here as well.  Clients should be configured with server1=20
as their gateway, and instead of "-j REDIRECT --to-port 3128" you use=20
"-j DNAT --to 192.168.0.2:3128".  Make sure that these packets are=20
allowed through the FORWARD chain now.

Server2 will need to accept connections in INPUT from server1, but should=
=20
probably REJECT others from the LAN.  It should have no need to forward=20
at all, and anything but replies from the internet should just be=20
DROPped.  It will also need a MASQUERADE rule for outbound traffic to=20
the internet.

For redundancy, you could set up server2 with the DNS and DHCP=20
configuration from server1, but not enable these services. (actually you=20
could even let them run, if the firewall doesn't allow INPUT or OUTPUT=20
for them) Also keep a copy of server1's firewall script (from first=20
scenario above, or second scenario modified to use REDIRECT instead of=20
DNAT) on server2.  This way if server1 goes down, or it's connection=20
fails, server2 can take over with just an IP change, start DNS & DHCP,=20
and run the alternate firewall script.  The same ability would work in=20
reverse, but easier:   if server2 goes down you could delete the DNAT=20
rule and insert a FORWARD rule to allow traffic through unhindered (and=20
unproxied), or set up squid on server1 and replace the DNAT with=20
REDIRECT.

> I hope you will help me in this regard.
>
> Thanks
>
> MOHAMMAD SHAKIR

j


