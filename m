From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables with snat/dnat under firewall/router 2 nic config
Date: Fri, 12 Mar 2010 21:59:06 +0100
Message-ID: <4B9AAB1A.8090207@plouf.fr.eu.org>
References: <31850ba91003120837r7586b657h88830dc95f298c70@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <31850ba91003120837r7586b657h88830dc95f298c70@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Chris Cranford a =E9crit :
>=20
> HTTP/HTTPS runs at 172.30.4.1 mapped to public IP 12.50.100.34
> SMTP       runs at 172.30.4.2 mapped to public IP 12.50.100.35
> POP3       runs at 172.30.4.3 mapped to public IP 12.50.100.36
> DNS        runs at 172.30.4.4 mapped to public IP 12.50.100.37
>=20
> So what I need to permit is if a request for an IP on our public
> network comes in, it will be examined at 12.50.100.33, eth0.  If the
> destination ip/port combination is permitted, it is forwarded through
> to eth1.  I need to do a DNAT from the public IP to the private IP on
> the LAN during this process too.
>=20
> On the reverse, if a request comes into eth1 and it's for a public IP
> that our eth0 interface DNATs to a LAN ip, the firewall needs to
> reroute it back into the eth1 network for the LAN ip.  So for example=
,
> if I open a web browser to http://www.mydomain.com, it resolves to
> 12.50.100.34 and when it goes out, we need it to eventually reach
> 172.30.4.1.  I assume this is using an SNAT?

Yes and no.
No, because this is destination NAT (DNAT) again. If you omit the
interface, the same rule applies to any interface.
Yes, because proper NAT operation requires symmetric routing (replies
must be routed back to the NAT box), and SNAT is a means to enforce
symmetric routing (servers see the NAT box as the client). Otherwise th=
e
server will reply directly to a client on the same LAN and the
connection will fail.

> Could anyone assist with the simple firewall/nat rules required for
> this type of network configuration?

# map 12.50.100.34 to 172.30.4.1
iptables -t nat -A PREROUTING -d 12.50.100.34 -j DNAT --to 172.30.4.1
(and so on...)
# masquerade connections from the LAN
iptables -t nat -A POSTROUTING -o eth1 -s 172.30.4.0/24 \
  -j SNAT --to 172.30.4.254
