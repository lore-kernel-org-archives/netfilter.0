From: "Mark Alzino" <tirixil@hotmail.com>
Subject: DNS and iptables : is this rule bad ??
Date: Fri, 28 May 2004 15:26:38 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY16-F99Flatq6TnSL0003998f@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hello,

Here is my problem more simply explained ...

An user (IP address : 10.0.0.1) has a DNS server IP address specified in hi=
s=20
configuration (we don't know the address, and maybe this address is invalid=
=20
so we want to change it with a iptables rules).

His gateway is 10.0.0.254. The gateway has another interface at=20
192.168.100.254 where a DNS server is launch (by named).
At the gateway, a iptables rule send all his DNS packets at the DNS server =

(192.168.100.254)
The rule is :
iptables -A PREROUTING -t nat -s 10.0.0.1 -p UDP --dport 53 -j DNAT=20
--to-destination 192.168.100.254

** BUT ** this rule is not effective immediately, and take fews minutes=20
before to be active !!!
Same thing if you flush the nat table (iptables -F PREROUTING -t nat ) : th=
e=20
last DNS is active during some minutes (sometimes immediately but not=20
systematically)...

To easely see that : just put an invalid DNS server in the configuration of=
=20
the client, and a real one at the gateway (192.168.100.254). You will see=20
that rules are not immediately active !!!

Is someone know why ???

Thanks.
-- Mark

_________________________________________________________________
Bloquez les fen=EAtres pop-up, c'est gratuit ! http://toolbar.msn.fr


