From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Bridge Transparent Proxy
Date: Wed, 23 May 2007 15:39:49 +0200
Message-ID: <46544425.1080101@freemail.hu>
References: <390179.89889.qm@web38509.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <390179.89889.qm@web38509.mail.mud.yahoo.com>
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
To: Jon Tim <lcguy229@yahoo.com>
Cc: netfilter@lists.netfilter.org

Jon Tim =EDrta:
> Hello,
>
> Many thanks for all reply to my Bridge Transparent
> Proxy post.
>
> But, please let me know more how to enable "netfilter
> Bridge Support" in kernel. Can I add a linke
> CONFIG_BRIDGE_NETFILTER=3Dy" in /etc/sysctl.conf ??
>
>  =20
No. This is an option in your kernel config.
Search the net about building a kernel.
> And, in the second iptables command what is physdev
> and physdev-in?? Does this mean physdev=3D eth0 and
> physdev-in =3D eth1??
>  =20
man iptables

-m physdev =3D> iptables will use the physdev module (-m)
--physdev-in eth1 =3D> the incoming (physical) device is eth1
> Sorry for my quetion. I am newbie in iptables and
> don't understand very well?
>
> My another qutesion is, do I need to use NAT command
> in iptables? As I have all public address and why I
> have to use NAT to redirect?
>  =20
NAT and REDIRECT is mainly to support a firewalled network or change the =

source/destination of a connection.
> Jon.
>
>  =20
Swifty


