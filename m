From: "Simon Garner" <sgarner@expio.co.nz>
Subject: Re: a sort of n00b question here but I'ld like to know.
Date: Tue, 21 Oct 2003 14:49:35 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <013f01c39776$2d3ddd30$0301a8c0@SIMON>
References: <20031021012423.84839.qmail@web40210.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: SBlaze <dagent.geo@yahoo.com>, netfilter@lists.netfilter.org

On Tuesday, October 21, 2003 2:24 PM [GMT+1200=NZT],
SBlaze <dagent.geo@yahoo.com> wrote:

> Ok I did that(with top) My CPU usage for both procs is relativly low.
> They both tend to idle with other visable processes at 96-100% idle.
>
> root@nixn00b:~# vmstat
> procs -----------memory---------- ---swap-- -----io---- --system--
>  ----cpu---- r  b   swpd   free   buff  cache   si   so    bi    bo
>  in    cs us sy id wa 0  0  27464   5848  22848  44388    0    0
> 1     2   11     8  0  1 99  0
>

Looks fine... sounds to me like this is a red herring, are you sure your
problem is not just with your connection itself? You said:


> The reason I ask is that I have what I think is an unusual amount of
> inbound unsolicited udp traffic(which is dropped by
> iptables/netfilter).
>

Inbound unsolicited traffic will be dropped with or without iptables -
you don't need a firewall to stop that as it won't have anywhere to go
anyway. And you'd have to have a serious amount of traffic to choke the
CPU like that. But, that traffic could be using up your bandwidth of
course... If that's a possibility, you need to find out more about where
the traffic is coming from and where it's going to and why you're
receiving it.

-Simon


