From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Three NICs, three LANs, only one must be MASQued
Date: Tue, 16 Mar 2004 13:32:33 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403161332.33438.Antony@Soft-Solutions.co.uk>
References: <BAY7-F8tCcVGtDmAkYx0006b199@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY7-F8tCcVGtDmAkYx0006b199@hotmail.com>
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
To: netfilter@lists.netfilter.org

On Tuesday 16 March 2004 1:20 pm, Luis Hern=E1n Otegui wrote:

> I manage a network with a proxy server (running SQUID and IPTABLES, ker=
nel
> 2.4.18-14) which used to have two NICs, both networks attached to those
> NICs with public IP addresses. Recently, we had to put a third NIC in t=
he
> proxy, with private reserved (10.0.0.x) addresses. So, we had to masque=
rade
> all the traffic from the two "internal" networks. Here's the diagram:
>
>       INTERNET
>              |                              (public IPs network(A))
>              |                             /
> (corporative LAN)-----(proxy)<
>                                            \
>                                             (private IPs network(B))
>
> So far, so good, but the point is that I need the servers in the (A)
> network to maintain their IPs, since they're well known in the net. And
> also we need the hosts in the (B) network to be masqued, since their IP=
s
> cannot be routed over the internet.
> My questions are:
> a) Are there any way to masquerade only the (B) network? Currently, I h=
ave
> a line like this in the *nat section of the /etc/sysconfig/iptables fil=
e:
> -A POSTROUTING -o eth0 -j MASQUERADE
> b) Is there any better way to do this?

Sure:

iptables -A POSTROUTING -o eth0 -s 192.168.0.0/16 -j MASQUERADE

Replace 192.168.0.0/16 with whatever describes your network B subnet.

Regards,

Antony.

--=20
"Reports that say that something hasn't happened are always interesting t=
o me,=20
because as we know, there are known knowns; there are things we know we k=
now.=20
We also know there are known unknowns; that is to say we know there are s=
ome=20
things we do not know. But there are also unknown unknowns - the ones we=20
don't know we don't know."

 - Donald Rumsfeld, US Secretary of Defence

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


