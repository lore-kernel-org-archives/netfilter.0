From: "Federico Cruciani" <f.cruciani@oxys.it>
Subject: 1:1 NAT
Date: Sat, 1 Feb 2003 19:20:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000101c2ca1e$8c3b6e90$0a00a8c0@oxys.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

> What I am trying to do is like how its done on cisco PIX i.e
> "static (inside,outside) 208.15.232.12 192.168.1.167 netmask
255.255.255.255
> 0 0"	=09

Cisco PIX does proxy-arp automatically if the external IP address in the =
nat
statement is not assigned on its outside interface. So, to build =
something
similar, what you need is to activate proxy-arp on your Iptables box and
publish on the external network the public IP address you want to nat =
which
are not physically assigned on the iptables box.

Following your example, suppose that your iptables Linux box have an
<fw_outside_address> on the external interface, eth0, different from the =
one
you want to nat, <public_address> (which is 208.15.232.12 in your =
example),
to an host in your internal network which has <internal_address>. Eth1 =
is
the firewall internal  interface with address <fw_internal_address>.

First you need two iptables rules, one for inbound packets and one for
translating outbound packets:

 iptables -t nat -A PREROUTING -i eth0 -d <public_address> -j DNAT
--to-destination <internal_address>

 iptables -t nat -A POSTROUTING -o eth0 -s <internal_address> -j SNAT
--to-source <public_address>

This is not sufficient for Linux and iptables to make the =
<internal_address>
host work on the internet as expected. We have to add commands to =
activate
proxy arp and to tell your firewall where the packets for =
<public_address>
have to be sent.


So, in the second step we have to pubilsh the <public_address> on the
external interface with the arp command:

 arp -Ds <public_address> eth0 pub

(If you like, I have a patched version of the Red Hat =
/etc/init.d/network
script which read and set static ARPs from a file, =
/etc/init.d/static-arp)


Finally the most important step consists in adding a static route on the
iptables box for the <public_address> toward the inside interface where =
the
internal host live:

 route add -host <public_address> dev eth1


This is the solution I have found working and that I'm using in a lot of
different network scenarios.
Hope this could help you.

Iok



