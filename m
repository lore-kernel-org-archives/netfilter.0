From: Richard A Downing <richard.downing@bcs.org.uk>
Subject: Re: Masquerade (Newbie)
Date: Mon, 10 Jun 2002 17:44:57 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206101222.28237.richard.downing@bcs.org.uk>
References: <200206091647.32562.richard.downing@bcs.org.uk> <200206092118.53543.richard.downing@bcs.org.uk> <200206092126.g59LQEA23512@Networker.rockstone.co.uk>
Reply-To: richard.downing@bcs.org.uk
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206092126.g59LQEA23512@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Antony,

I was helped by email from another list member.  The error below goes awa=
y if=20
the kernel modules are compiled in (I.E. NOT modules).  Perhaps there is =
a=20
kernel bug here.

I am pleased to say that I now have Masquerade running fine, and my LAN=20
machines happily soaking my bandwidth ;-)

Thanks for your help,
Richard.


On Sunday 09 June 2002 22:26, Antony Stone wrote:
On Sunday 09 June 2002 9:18 pm, Richard A Downing wrote:

> root:/usr/lib/iptables$: iptables -t nat -A POSTROUTING -o ppp0 -j
> MASQUERADE
> iptables: No chain/target/match by that name

Okay.   I still do not know why you cannot use the MASQUERADE target, but=
 I
do not use modules - I have everything compiled-in to the kernel, so I do=
n't
know what you need to look for to find out why that command isn't working=
=2E
Hopefully someone else can help on that one ?


