From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Hostname with DNAT  ? {OK}
Date: Mon, 26 Jul 2004 11:30:43 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90511F6@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Danila Octavian <octavian@service.agress.ro>, netfilter@lists.netfilter.org

> $IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -d mail.server1.com =
--dport 25 -j DNAT --to 192.168.14.254:25
> $IPTABLES -A FORWARD -i eth0 -p tcp -d mail1.server.com --dport 25 -j =
ACCEPT
>
> $IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -d mail.server2.com =
--dport 25 -j DNAT --to 192.168.14.251:25
> $IPTABLES -A FORWARD -i eth0 -p tcp -d mail.server2.com --dport 25 -j =
ACCEPT
>
> $IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -d server3.com --dport =
25 -j DNAT --to 192.168.14.253:25
> $IPTABLES -A FORWARD -i eth0 -p tcp -d server3.com --dport 25 -j =
ACCEPT
> $IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -d mail.server3.com =
--dport 25 -j DNAT --to 192.168.14.253:25
> $IPTABLES -A FORWARD -i eth0 -p tcp -d mail.server3.com --dport 25 -j =
ACCEPT
>
> Is posibble to use names instead of IP like in my situation ?

using a resolvable hostname instead of an IP in a rule is perfectly =
valid.  the caveat is:  at the time you execute the script, the hostname =
is resolved to an IP address and the IP is what ends up in the rule.  if =
the IP associated with the hostname changes after the rules are =
loaded--you must reload the rules for the new IP to be used in the rule.

my guess is that the reason you wish to do this is that you have a =
dynamic IP address and are using some sort of dynamic DNS service.  you =
will probably want to incorporate the re-loading of your ruleset into =
your DHCP client whenever your IP changes.  you could actually do this =
without utilizing the "dynamic DNS + hostname in rules" solution  by =
incorporating something like this into your ruleset:

	MY_IF=3D"eth0"
	MY_IP=3D`ip addr sh $MY_IF | grep inet | awk '{print $2}' | cut -d"/" =
-f1`

	$IPTABLES -A PREROUTING -t nat -i $MY_IF -p tcp -d $MY_IP \
	  --dport 25 -j DNAT --to 192.168.14.251:25

and whenever your IP changes--have the script re-execute to pickup the =
new IP.

-j


