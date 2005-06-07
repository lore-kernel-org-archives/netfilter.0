From: KOVACS Krisztian <hidden@sch.bme.hu>
Subject: Re: I can't install patch-o-matic-ng-20050606 in Mandrake 10.1
Date: Tue, 07 Jun 2005 14:08:13 +0200
Message-ID: <1118146093.25686.7.camel@nienna.balabit>
References: <20050607125741.zumvm8w28c8goc4s@webmail.nctu.edu.tw>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <20050607125741.zumvm8w28c8goc4s@webmail.nctu.edu.tw>
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
To: yhan.cm89@nctu.edu.tw
Cc: netfilter@lists.netfilter.org


  Hi,

2005-06-07, k keltez=E9ssel 12.57-kor yhan.cm89@nctu.edu.tw ezt =EDrt=
a:
>     I have set the paths of kernel and iptables source codes as fol=
lowing:
>     KERNEL_DIR=3D/usr/src/linux-2.6.8.1-24mdk/
>     IPTABLES_DIR=3D/usr/src/linux-2.6.8.1-24mdk/net/ipv4/netfilter
>=20
>     But when I tried to run ./runme extra ,  it said " Your iptable=
s version is
> unknown for patch-o-matic at ./runme line 214"
>=20
>     How can I solve it ?  thanks! :-)

  You have to download the separate iptables (userspace program you r=
un
to configure your firewall rules) tarball, untar it, then specify its
path to the ./runme script. (Your current setting points poor ./runme=
 to
search for the iptables user space sources in your kernel source
tree...)

--=20
KOVACS Krisztian <hidden@sch.bme.hu>



