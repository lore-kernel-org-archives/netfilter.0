From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: load-balancing with netfilter: round robin or what??
Date: Tue, 7 Oct 2003 08:52:58 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C439@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Pedro Salazar <pedro-b-salazar@ptinovacao.pt>, netfilter@lists.netfilter.org

Round robin DNS isn't so bad, I mean www.microsoft.com ,www.ibm.com and =
other large sites do it so depending on the scale of your site and =
estimate number of hits your going to get, use a combination of round =
robin and possibly 2 firewalls with multiple webservers behind it (web =
farm)..

The only way for iptables to do it without using some sort of proxy or =
RRDNS is to use the p-o-m NTH patch and possibly CONNMARK to do it..

Here's a snip from a past post by Ramin Dousti which may give you some =
guidance..

<snip>
> Any more suggestions??? any other ideas????
Yes. CONNMARK the conn's and route them accordingly:

iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source =
<ppp0-ip-addr>
iptables -t nat -A POSTROUTING -o ppp1 -j SNAT --to-source =
<ppp1-ip-addr>
iptables -t nat -A POSTROUTING -o ppp2 -j SNAT --to-source =
<ppp2-ip-addr>
iptables -t nat -A POSTROUTING -o ppp3 -j SNAT --to-source =
<ppp3-ip-addr>

iptables -t mangle -A PREROUTING -m nth --every 4 --packet 1 -m state =
--state new  -j CONNMARK --set-mark 1
iptables -t mangle -A PREROUTING -m nth --every 4 --packet 2 -m state =
--state new  -j CONNMARK --set-mark 2
iptables -t mangle -A PREROUTING -m nth --every 4 --packet 3 -m state =
--state new  -j CONNMARK --set-mark 3
iptables -t mangle -A PREROUTING -m nth --every 4 --packet 0 -m state =
--state new  -j CONNMARK --set-mark 4

iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 1 -m state =
--state new  -j CONNMARK --set-mark 1
iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 2 -m state =
--state new  -j CONNMARK --set-mark 2
iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 3 -m state =
--state new  -j CONNMARK --set-mark 3
iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 0 -m state =
--state new  -j CONNMARK --set-mark 4

iptables -t mangle -A POSTROUTING -m connmark --mark 1 -j ROUTE --oif =
ppp1
iptables -t mangle -A POSTROUTING -m connmark --mark 2 -j ROUTE --oif =
ppp2
iptables -t mangle -A POSTROUTING -m connmark --mark 3 -j ROUTE --oif =
ppp3
iptables -t mangle -A POSTROUTING -m connmark --mark 4 -j ROUTE --oif =
ppp0

Haven't had the chance to test it, though.

Ramin
</snip>

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

> -----Original Message-----
> From: Pedro Salazar [mailto:pedro-b-salazar@ptinovacao.pt]
> Sent: Monday, 6 October 2003 8:00 PM
> To: netfilter@lists.netfilter.org
> Subject: load-balancing with netfilter: round robin or what??
>=20
>=20
> Greetings,
>=20
> I pretend to load-balancing to two servers but apparently I think only
> one machine is getting the requests.
>=20
> These are the rules I run in iptables:
>=20
> /sbin/iptables -v -P INPUT ACCEPT
> /sbin/iptables -v -P OUTPUT ACCEPT
> /sbin/iptables -v -P FORWARD ACCEPT
> /sbin/iptables -v -t nat -A PREROUTING --dst 192.168.89.44 -p=20
> tcp --dport 9000 -j DNAT --to-destination 192.168.89.158:80=20
> --to-destination 192.168.89.159:80
> /sbin/iptables -v -t nat -A POSTROUTING --dst=20
> 192.168.89.158/31 -p tcp --dport 80 -j SNAT --to-source 192.168.89.44
> /sbin/iptables -v -t nat -A OUTPUT -p tcp -m tcp --dport 9000=20
> --dst 192.168.89.44 -j DNAT --to-destination=20
> 192.168.89.158:80 --to-destination 192.168.89.159:80
>=20
> As you can see, I have two destinations hosts, 192.168.89.158/31. The
> 192.168.89.44 is the gateway itself that is redirecting=20
> requests on port
> 9000 to the two http servers. All of them are in the same network.
>=20
> However, I think only the .158 is getting the requests (I=20
> have verified
> that with tcpdump).
>=20
> So, what is wrong or what is needed? I supposed the requests would be
> load-balanced...
>=20
> I'm using a linux redhat 7.3 box with default kernel 2.4.18-3.=20
>=20
> thanks,
> Pedro Salazar.
> --=20
> PS
> pedro-b-salazar@ptinovacao.pt
> PGP:0E129E31D803BC61
>=20
>=20
>=20

