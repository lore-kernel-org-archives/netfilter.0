From: Giovanni Lovato <giovanni.lovato@aldu.net>
Subject: Re: Matching packets by HTTP header "Host"
Date: Tue, 13 Mar 2007 19:50:49 +0100
Message-ID: <45F6F289.1060405@aldu.net>
References: <45F68159.5040606@aldu.net> <45F6EF90.3040504@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-Printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45F6EF90.3040504@plouf.fr.eu.org>
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
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Pascal Hambourg wrote:
> Hello,
>
> Giovanni Lovato a =E9crit :
>>
>> I'm trying to forward packets to different hosts depending on the "Hos=
t"
>> header in HTTP packets, e.g. packets on port 80 requesting "Host:
>> one.example.org" to 192.168.0.1 and all other on port 80 to 192.128.0.=
2.
>> I did:
>>
>> iptables -t nat -A PREROUTING -p TCP -i eth0 -m string --algo bm
>> - --string "Host: one.example.org" --destination-port 80 -j DNAT
>> - --to-destination 192.168.0.1
>>
>> iptables -t nat -A PREROUTING -p TCP -i eth0 --destination-port 80 -j
>> DNAT --to-destination 192.168.0.2
>>
>> But all packets are going to 192.168.0.2. Do I miss something?
>
> Rules in the 'nat' table apply only to the first packet of a new
> connection. NAT operations for the whole connection is determined by th=
e
> NAT rules applied to the first (SYN) packet of the connection, which
> does not contain any HTTP payload data such as the "Host" header. So th=
e
> first rule never matches a packet. As suggested, use a HTTP proxy inste=
ad.

Thank you all.
I used Apache mod_proxy_http to gain my needs!

G.L.
- --
www.aldu.net/~heruan
giovanni.lovato@aldu.net
ldaps://pgpkeys.aldu.net
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFF9vKJaWLXrn9dopwRAm8AAJ9QJ/EkKwVh6+rNrLGRABVT/gqz5ACfbw1Y
AV92Cm4Mo4AlN/2zcDEXiUU=3D
=3DNNvp
-----END PGP SIGNATURE-----

