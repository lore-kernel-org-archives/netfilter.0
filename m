From: Eric Ellis <eellis@mail.co.gilchrist.fl.us>
Subject: Re: howto stop this packet
Date: Fri, 14 Jan 2005 08:47:32 -0500
Message-ID: <41E7CD74.6030509@mail.co.gilchrist.fl.us>
References: <20050114061836.B1E5E2BBE8@tharbad>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050114061836.B1E5E2BBE8@tharbad>
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
Content-Type: text/plain; charset="iso-8859-1"
To: jqb@markor.net, netfilter@lists.netfilter.org

jqb@markor.net wrote:
> netfilter=A3=A1
>     howto stop this packet on iptables firewall;
> tcpdump capture packet example:
> 10:35:31.881722 IP 218.6.45.6.51755 > 228.71.74.201.7777: S 1432831257:=
1432831257(0) win 16384 <mss 1460,nop,nop,sackOK>
>=20
> 10:35:36.214120 IP 219.147.192.18.1272 > 228.71.74.201.7777: S 490321:4=
90321(0) win 6400 <mss 1460,nop,nop,sackOK>
>=20
> =A1=A1=A1=A1
>=20
> Regards,=09
>=20
>=20
> xjjjk
> jqb@markor.net
> 2005-01-14
>=20
iptables -A FORWARD -p tcp --dport 7777 -j DROP

or

iptables -A FORWARD -p tcp --destination 228.71.74.201 -j DROP

depends on if you don't want to connect to that machine, or you just
don't want that machine connecting to that port.

On a side note, you should have your default policies set to DROP anyway
on the default tables for best practice security.

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

and then just accept the data that you want to.  This is all covered in
the iptables tutortial @
http://iptables-tutorial.frozentux.net/iptables-tutorial.html

