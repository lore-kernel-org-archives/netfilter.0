From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: http forwarding
Date: Thu, 14 Nov 2002 20:11:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211142011.52029.netfilter@newkirk.us>
References: <cld7tugoh1bo72ihi68e98j7sh2a19kqn4@4ax.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <cld7tugoh1bo72ihi68e98j7sh2a19kqn4@4ax.com>
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
To: tom@acalgrinding.dyndns.org, netfilter@lists.netfilter.org

On Thursday 14 November 2002 09:59 am, Tom Elsesser wrote:

> trying to forward http request to ulysses. The router and eth1 are on
> a 10.10.10.0 subnet, while the rest of the network is on a 10.1.1.0
> subnet. The router cannot directly route the http requests from the
> outside to ulysses, so I am trying to forward them from yzerman, but
> it is not working as the connection times out if I try to connect from

> /sbin/iptables -P FORWARD DROP

> /sbin/iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

> /sbin/iptables -A FORWARD -i eth1 -m state --state RELATED,ESTABLISHED
> -j ACCEPT

> /sbin/iptables -A FORWARD -i eth0 -s 10.1.1.0/8 -j ACCEPT

> /sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j DNAT
> --to 10.1.1.2

> /sbin/iptables -A INPUT -i eth1 -d 0/0 -p tcp --dport 80 -j ACCEPT

Everything looked good up to here.  This rule needs to be in the FORWARD=20
chain.  Once you've DNATted in PREROUTING, it's not coming to this machin=
e,=20
it's being forwarded to another.

j

