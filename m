From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: NAT problem
Date: Mon, 06 Oct 2003 15:33:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065447214.822.42.camel@elendil.intranet.cartel-securite.net>
References: <000001c38c05$923fb680$0f01a8c0@raul02>
	 <06ba01c38c0c$8de8b440$2800a8c0@karu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <06ba01c38c0c$8de8b440$2800a8c0@karu>
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
To: "Venkatesh. K" <venkatesh@cbayscribe.com>
Cc: Jose Pascual <jose.pascual@optivamedia.com>, netfilter@lists.netfilter.org

Le lun 06/10/2003 =E0 15:19, Venkatesh. K a =E9crit :
> You have to get the concept of DNAT right. DNAT only works when the DNA=
T ip
> address is on seperate subnet.

You can DNAT to the same subnet providing you SNAT the forwarded flow
with redirector IP.

192.168.1.3 ----> 192.168.1.2 ----> 192.168.1.1

On 192.168.1.2 :

	iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT \
		--to 192.168.1.1
	iptables -t nat -A POSTROUTING -p tcp -d 182.168.1.1 \
		--dport 80 -j SNAT --to 192.168.1.2

This prevent 192.168.1.3 to reply 192.168.1.2 directly, ans thus
confusing 192.168.1.1. It's a common issue for people thrying to reach
an inside host belonging to the same subnet via its public DNAT IP.

From OP :
>> iptables -t nat -A POSTROUTING -p tcp --sport 80 -j SNAT
>> --to-source 192.168.1.2

This is not needed as returning packets for natted connections are
automaticly handled through conntrack engine.

By the way, I would have set this up using a simple TCP port redirector
like redir.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

