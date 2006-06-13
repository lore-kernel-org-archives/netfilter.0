From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How to configure Firewall/router without aliasing
Date: Tue, 13 Jun 2006 13:29:50 +0200
Message-ID: <448EA1AE.6050205@plouf.fr.eu.org>
References: <68869d910606130326m2602f270o8a28c680b81f7335@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <68869d910606130326m2602f270o8a28c680b81f7335@mail.gmail.com>
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

Raghu Ni a =E9crit :
>=20
>  Here, creating an alias IP is not at all a secure way as both the
> IPs (xxx.xxx.xxx.1 and xxx.xxx.xxx.2) are open to internet. So,

Why wouldn't it be secure ?
I don't understand why you don't want to give the address to the users.

> without IP aliasing, How to DNAT a packet which is coming for
> xxx.xxx.xxx.2 to my internal IP.

Exactly the same way as you do with IP aliasing :

iptables -t nat -A PREROUTING -p tcp --dport 22 -s x.x.x.x -d y.y.y.2 \
   -j DNAT --to z.z.z.z

Of course, on an ethernet link you will run into the usual ARP problem.
But this is not really a Netfilter/iptables issue. See the topic=20
"Redirecting traffic from a non-existent IP" above.

