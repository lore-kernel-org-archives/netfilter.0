From: "Mike" <mikeeo@msn.com>
Subject: Re: 1:1 NAT/Not working
Date: Mon, 27 Jan 2003 13:38:51 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001701c2c633$569a74f0$1e01a8c0@win2k.com>
References: <001301c2c166$2c7671a0$1e01a8c0@win2k.com>
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
To: netfilter@lists.netfilter.org

I tried the examples that were shown and I cannot contact the servers. do I
need to alias the IPs on a ethernet card? i.e eth0:1?

from outside to inside:

iptables -t nat -A PREROUTING -d 208.15.232.12 -j DNAT --to 192.168.1.167

the other way around:

iptables -t nat -A POSTROUTING -s 192.168.1.167 -j SNAT --to 208.15.131.12

----- Original Message -----
From: "Mike" <mikeeo@msn.com>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, January 21, 2003 11:00 AM
Subject: 1:1 NAT


> Can anyone point me to some docs on setting up 1:1 NAT on netfilter?
>
> What I am trying to do is like how its done on cisco PIX i.e
> "static (inside,outside) 208.15.232.12 192.168.1.167 netmask
255.255.255.255
> 0 0"
>
> That way I don't have to do IP alias on my ethernet card.
>
> Thanks,
>
> Mike
>
>
>


