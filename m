From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables + 2 isp + dnat problem
Date: Wed, 10 Mar 2010 23:51:39 +0100
Message-ID: <4B98227B.1060307@plouf.fr.eu.org>
References: <1268255390.15912.109.camel@gvachon-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1268255390.15912.109.camel@gvachon-laptop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Guillaume Vachon a =E9crit :
>=20
> Now the point that i dont understant is this. How can i dnat incoming
> traffic on my second isp to a lan server? For example. Im iptables i
> added this :
> -t nat -A PREROUTING -d 69.x.x.18 -p tcp -m tcp --dport 22 -j DNAT
> --to-destination 10.10.200.11:22
>=20
> Now the traffic gets in my firewall on eth5 that send it localy to
> 10.10.200.11 but when the traffic comes back to the firewall it does =
not
> try to get out using my second isp but the first one. I know i can ma=
rk
> packet to solve this. But i dont know how to do it. Should i mark all
> traffic that come in using second isp with a mark so that it can exis=
t
> through that interface?

IIUC, you need symmetric routing.

You can either :
- use a connection mark with CONNMARK based on the input interface and
copy it in the packet mark for return traffic
- match the original destination address of the connection with -m
conntrack --ctorigdstaddr
- DNAT to a specific address on the LAN (possibly an alias) and use a
routing rule based on that source address for return traffic.
