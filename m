From: Bernd Podey <Bernd.Podey@gmx.de>
Subject: Re: Problem with iptables -A FORWARD -j DROP
Date: Thu, 20 Feb 2003 12:37:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E54BE09.30509@gmx.de>
References: <002d01c2d819$2746d250$04000059@INFORMATICA>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Gabriel_G=FCeto?= <gabriel.gueto@rhodasol.turimar.es>
Cc: netfilter@lists.netfilter.org

Gabriel G=FCeto wrote:
> Hello, I'm installing a bridge-firewall an all is OK, but whe I deny al=
l=20
> the 'FORWARD' traffic this rule deny all the traffic included the=20
> 'ACCEPT' rules. Mi Kernel is 2.4.18
> and i installed itables 1.2.5-3. My script is:
> =20
> iptables -F FORWARD
> iptables -F INPUT
> iptables -F OUTPUT
> =20
> iptables -A FORWARD -p icmp -s 89.0.0.0/24 -d 89.0.0.55/32 -j ACCEPT
> =20
> iptables -A FORWARD -j DROP
> =20
> =20
> =20
> If I quit the las line it's all OK, if I deny 'ping' it's OK, but if I=20
> put the last line all ping are deny.
> =20
> Can somebody help me. I'm sorry for mu poor English.
> =20
> Gabriel.
Hello!

You have to allow both communication directions!

Try the following:
iptables -A FORWARD -p icmp -s 89.0.0.0/24 -d 89.0.0.55/32 -j ACCEPT
iptables -A FORWARD -p icmp -s 89.0.0.55/32 -d 89.0.0.0/24 -j ACCEPT

iptables -A FORWARD -j DROP

and everything will work fine

Bernd


