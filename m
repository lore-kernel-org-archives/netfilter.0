From: Steve Mickeler <steve@neptune.ca>
Subject: Re: vrrp ip and netfilter
Date: Thu, 12 Sep 2002 09:27:50 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209120926210.29987-100000@triton.neptune.on.ca>
References: <Pine.LNX.4.44.0209121113430.11946-100000@smtp.myw0rld.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0209121113430.11946-100000@smtp.myw0rld.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Rodrigo Hidalgo <rodde@myw0rld.org>
Cc: netfilter@lists.netfilter.org


ifconfig is an old and clunky way of doing things.

you will see the ip via the "ip" command which is part of the iproute
utils.

the INPUT chain should work just fine with the vrrp ip.


On Thu, 12 Sep 2002, Rodrigo Hidalgo wrote:

> Hi all,
>
> Just one question, i have a fw cluster using netfilter/iptablesv1.2.5
> together with vrrpd.
>
> My question is how does a packet traverse when it is destined to the
> internal vrrp_ip? if it is destined for eth1_real_ip then it is the input
> chain but that can=B4t be the case with vrrp or ?... btw vrrp_ip does
> not show with ifconfig, so netfilter might not recognise the ip as an
> locahost ip.
>
> so:
>
> -----Outer Net----
> |
> |
> eth0 - <some ip>
> -----FW cluster---
> eth1 - <vrrp ip>
> |
> |
> -----Inner net---
>
> BR
>
> Rodrigo Hidalgo C.
>
>
>



[-] Steve Mickeler [ steve@neptune.ca ]

[|] Todays root password is brought to you by /dev/random

[+] 1024D/9AA80CDF =3D 4103 9E35 2713 D432 924F  3C2E A7B9 A0FE 9AA8 0CDF



