From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: NAT and log traffic
Date: Wed, 15 Jan 2003 17:04:30 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301151704.30181.netfilter@newkirk.us>
References: <FD8F124A387AD6119F7900A0D218B321019AC2@hslex01.hslbz.local>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B321019AC2@hslex01.hslbz.local>
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
To: Rob Sterenborg <rsterenborg@xs4all.nl>, netfilter@lists.netfilter.org

On Wednesday 15 January 2003 10:08 am, Rob Sterenborg wrote:
> > I have made two NAT box for a special dialup server.
> > I have create an iptables stratup script like that..
> >
> > /usr/local/sbin/iptables -t nat -A POSTROUTING -s
> > 10.20.2.0/23 -o eth0 -j SNAT --to PUBLIC-IP1
> > /usr/local/sbin/iptables -t nat -A POSTROUTING -s
> > 10.20.4.0/23 -o eth0 -j SNAT --to PUBLIC-IP2
> > /usr/local/sbin/iptables -t nat -A POSTROUTING -s
> > 10.20.6.0/23 -o eth0 -j SNAT --to PUBLIC-IP3
> > /usr/local/sbin/iptables -t nat -A POSTROUTING -s
> > 10.20.8.0/23 -o eth0 -j SNAT --to PUBLIC-IP4
> > /usr/local/sbin/iptables -t nat -A POSTROUTING -s
> > 10.20.10.0/23 -o eth0 -j SNAT --to PUBLIC-IP5
> > /usr/local/sbin/iptables -t nat -A POSTROUTING -s
> > 10.20.12.0/23 -o eth0 -j SNAT --to PUBLIC-IP6
> > /usr/local/sbin/iptables -t nat -A POSTROUTING -s
> > 10.20.14.0/23 -o eth0 -j SNAT --to PUBLIC-IP7
> >
> > and so on..
>
> Is that /23 or /24 ?

> I think that 10.20.0.0/23 does not cover all of 10.20.2.0/23,
> 10.20.4.0/23, etc...
> If you're trying to capture all the nets into 1 rule then you'd need a
> mask of 10.20.0.0/255.255.0.0, which is 10.20.0.0/16.

This will work for what he appears to be trying to do.  He's trying to=20
capture 512 addresses in each rule.  A network defined as 10.20.2.0/23=20
will catch 10.20.2.0-10.20.2.255 and 10.20.3.0-10.20.3.255.  /24 would=20
specify that the first three numbers must match exactly.  /23 means that=20
the third can vary in only the least significant bit, IE .128 and .129,=20
=2E16 and .17.

http://www.wildpackets.com/products In the lower-right they have a free=20
subnet calculator for Windows (which I see you're emailing from) and=20
also one for PalmOS.  Really handy, that PalmOS one is.

Apart from that, a quick Google will find several subnet mask=20
calculators, several platform-independant online ones.

As Arnt Karlsen added in his reply:

> ..output of: $ ipcalc -bnmp 10.20.2.0/23
> NETMASK=3D255.255.254.0
> PREFIX=3D23
> BROADCAST=3D10.20.3.255
> NETWORK=3D10.20.2.0

And to this I have to add that the same results derive from 10.20.3.0/23

j


