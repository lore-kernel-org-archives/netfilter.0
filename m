From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: DNAT with orignal source address
Date: Thu, 03 Aug 2006 01:37:19 +0200
Message-ID: <44D1372F.7020003@plouf.fr.eu.org>
References: <A78C6C481BFAE949BC5990E1EEB2FE125824@q.LeBlancNet.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <A78C6C481BFAE949BC5990E1EEB2FE125824@q.LeBlancNet.us>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Robert LeBlanc a =E9crit :
> I'm having problems with my e-mail server saying that every connection
> originates from the NAT box. I checked it on my other linux server and
> sure enough even though I have 1:1 DNAT and a reverse SNAT configured,
> packets destined for my server show the NAT box as the source. How do
> you configure DNAT so that it keeps the original Internet address and
> does not mangle it, only the destination address to my server on a
> private subnet?

DNAT never mangles the source address in the PREROUTING chain. DNAT can=20
mangle the source address only in the OUTPUT chain to match the new=20
output interface.

> iptables -t nat -A PREROUTING -d 1.1.1.4 -j DNAT --to-destination
> 192.168.2.10
> iptables -t nat -A POSTROUTING -s 192.168.2.10 -j SNAT --to-source
> 1.1.1.4
>=20
> So the gateway's public address is 1.1.1.1 and the e-mail server is
> 1.1.1.4. The e-mail logs and ssh logins all show that every connection
> is made from 1.1.1.1 even though the connections are made from the
> Internet.

I bet that is the result of another SNAT rule, maybe the one used to=20
masquerade the private subnet on internet which matches more than it=20
should. For instance you have :

iptables -t nat -A POSTROUTING -j SNAT --to 1.1.1.1

when you need :

iptables -t nat -A POSTROUTING -o <public_interface> -s 192.168.2.0/24 \
   -j SNAT --to 1.1.1.1

