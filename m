From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: please advise on this rule
Date: 13 Aug 2003 09:26:23 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060759582.1711.18.camel@kermit>
References: <20030813182443.GA1468@linux.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030813182443.GA1468@linux.local>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Payal Rathod <payal-iptables@staticky.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mit, 2003-08-13 um 20.24 schrieb Payal Rathod:
> Does this FORWARD chain look ok in a simple NAT network where the Linux
> box is connected to the net.
What's "ok" in your opinion?
>=20
> Chain FORWARD (policy DROP)
> target     prot opt source               destination
> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          state
> RELATED,ESTABLISHED
> REJECT     tcp  --  192.168.10.1         0.0.0.0/0          tcp dpt:80
> reject-with icmp-port-unreachable
>=20
Well, it looks fine. 3 rules loaded although I am missing a little bit
of detail here. Do an iptables -vnL FORWARD.

>=20
> Is source 0/0 OK? Should be be 192.168.10.0/24 ?
Source 0/0 is ok. If you want to prevent IP-Spoofing you can use
192.168.10.0/24

> Will the third rule block outgoing connection from 192.168.10.1 to any
> server at port 80?
Yes the third rule will block this traffic, but ...
Since some detail is missing I cannot determine what the first rule
does. Is this just loopback traffic (lo)?. If the first rule does not
specify an interface it will allow all traffic.
If it does specify the lo interface you are still missing a rule
allowing NEW connections, like
iptables -A FORWARD -s 192.168.10.0/24 -m state --state NEW -j ACCEPT

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

