From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: help on  NAT Configuration
Date: Tue, 21 Oct 2003 09:02:23 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F952E5F.6000308@Loudoun-Fairfax.com>
References: <83055D4B014C9E478D2F04624B9E82CF39E82D@noveldc.novelgmt.mu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <83055D4B014C9E478D2F04624B9E82CF39E82D@noveldc.novelgmt.mu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@lists.netfilter.org

Gilles Yue wrote:

> Dear all
>
> I want to share internet access on my LAN and my configurations are as=20
> below. (see picture)
>
> Is my NAT configuration correct? I want to allow only some users to=20
> access the internet-and check mail using outlook express.
>
> Thanks for helping.
>
> Rgds
>
> gy
>
> iptables =96vnL
>
> *> Chain INPUT (policy DROP 485 packets, 51391 bytes)*
>
>> pkts bytes target prot opt in out source
>
>> destination
>
>> 0 0 ACCEPT tcp -- * * 0.0.0.0/0
>
>> 0.0.0.0/0 tcp spt:53
>
>> 21 4504 ACCEPT udp -- * * 0.0.0.0/0
>
>> 0.0.0.0/0 udp spt:53
>
>> 0 0 ACCEPT udp -- * * 0.0.0.0/0
>
>> 0.0.0.0/0 udp spt:80
>
>> 813 704K ACCEPT tcp -- * * 0.0.0.0/0
>
>> 0.0.0.0/0 tcp spt:80
>
>> 0 0 ACCEPT udp -- * * 0.0.0.0/0
>
>> 0.0.0.0/0 udp spt:443
>
>> 16 3793 ACCEPT tcp -- * * 0.0.0.0/0
>
>> 0.0.0.0/0 tcp spt:443
>
>> 0 0 ACCEPT tcp -- * * 0.0.0.0/0
>
>> 0.0.0.0/0 state RELATED,ESTABLISHED
>
>> 0 0 ACCEPT all -- lo * 0.0.0.0/0
>
>> 0.0.0.0/0
>

This is the traffic into the firewall host from both NICs. It's a good=20
idea to put the ESTABLISHED, RELATED rule near the top of the chain.=20
Also, it should not be limited to the loopback interface.

>>
>
>> *Chain FORWARD (policy DROP 0 packets, 0 bytes)*
>
>> pkts bytes target prot opt in out source
>
>> destination
>
>> 0 0 ACCEPT all -- eth1 eth0 0.0.0.0/0
>
>> 0.0.0.0/0 state RELATED,ESTABLISHED
>
>> 0 0 ACCEPT all -- eth0 eth1 0.0.0.0/0
>
>> 0.0.0.0/0
>
>>
>

This is the chain that carries the traffic between the lan and the=20
outside world. You have it wide open and are not filtering anything. I=20
recommend you set the default policy to drop and only open the ports you=20
need ( 80, 63, etc.). BTW, nice graphic :-)

Jeff


