From: Luciano Ruete <kies@myrealbox.com>
Subject: Re: Iptables with IP Alias
Date: Sun, 24 Nov 2002 15:19:48 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DE11844.6060502@myrealbox.com>
References: <H5HQ0H$9919374312372D5676DDD544D0265BEA@terra.com.br>
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
To: netfilter@lists.netfilter.org

Juliano Dapper escribi=F3::
 > What's iptables not accept rules in ip alias, eth0:0, eth0:1?
 > I have a linux box with 2 ips and i have create ruls to redirect=20
traffic to internal machine,ex:
 > iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 25 -j DNAT --to=20
192.168.0.1
 > iptables -t nat -A PREROUTING -p tcp -i etho:0 --dport 80 -j DNAT --to
 > 192.168.0.2
 > eth0 - 200.200.200.1
 > eth0:0 - 200.200.200.2

Since kernel 2.4 aliases are matched in ethx rather than etx:x.
But this is not a limitation, you can match -d address in your case or
source address/network in others.

Slds !

--
Luciano





