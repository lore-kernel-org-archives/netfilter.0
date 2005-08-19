From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: Re: port 80 out new ISP
Date: Fri, 19 Aug 2005 19:22:56 +0200
Message-ID: <43061570.9090702@eccotours.dyndns.org>
References: <430600E4.3090004@eccotours.dyndns.org>
	<200508191205.22196.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508191205.22196.rob0@gmx.co.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

Hi Rob

A big thanks for replying to my email.

>>ip route flush table TELKOM  >>/dev/null
>>ip route show table main |grep -Ev ^default\
> 
> 
> What does this command, without the "\<newline>" and pipe, return?
> 

gate:~# ip route show table main | grep -Ev ^default
196.36.10.112/29 dev eth0  proto kernel  scope link  src 196.36.10.114
192.168.111.0/24 dev eth1  proto kernel  scope link  src 192.168.111.10
192.168.10.0/24 dev eth2  proto kernel  scope link  src 192.168.10.100
gate:~#

>>ip rule add fwmark 1 table TELKOM >> /dev/null
> 
> 
> And what do your routing rules show at this point?

gate:~# ip rule show
0:      from all lookup local
32765:  from all fwmark 0x1 lookup TELKOM
32766:  from all lookup main
32767:  from all lookup default
gate:~#

gate:~# ip route show table main
196.36.10.112/29 dev eth0  proto kernel  scope link  src 196.36.10.114
192.168.111.0/24 dev eth1  proto kernel  scope link  src 192.168.111.10
192.168.10.0/24 dev eth2  proto kernel  scope link  src 192.168.10.100
default via 196.36.10.113 dev eth0
gate:~#

gate:~# ip route show table TELKOM
196.36.10.112/29 dev eth0  proto kernel  scope link  src 196.36.10.114
192.168.111.0/24 dev eth1  proto kernel  scope link  src 192.168.111.10
192.168.10.0/24 dev eth2  proto kernel  scope link  src 192.168.10.100
default via 192.168.10.200 dev eth2
gate:~#


>># SNAT the Private LAN
>>$IPT -t nat -A POSTROUTING -o eth0 -s 192.168.111.0/24 -j SNAT
>>--to-source 196.36.10.114
>>#$IPT -t nat -A POSTROUTING -o eth2 -s 
>>192.168.111.0/24 -j SNAT --to-source 192.168.10.200
> 
> 
> Why is that one commented?

Im commented it out, hoping the MASQUERADE would work.
> 
> 
>>$IPT -t nat -A POSTROUTING -o eth2 -s 192.168.111.0/24 -j MASQUERADE
> 
> 
> MASQUERADE will not work with dual routing.

Thanks


