From: Bart Kus <me@bartk.us>
Subject: Re: Problem with getting reply packets
Date: Mon, 2 Feb 2009 17:00:06 -0800
Message-ID: <49879716.7000406@bartk.us>
References: <4983937B.4060200@bartk.us> <498428BD.2000609@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <498428BD.2000609@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

A-HA!  Thank you for the insight about SYN_RECV.  It led me to think
about the sanity of my remote test site that I was using to cause these
inbound connections.  It seems that during the past 3 months the remote
site's firewall policies have changed and they now block port 22
outbound!  Tested from an alternate remote site and everything works as
it should.

Thanks again!

--Bart


Pascal Hambourg wrote:
> Hello,
>
> Bart Kus a =E9crit :
>>
>> Setup:  Inet -> Netgear -> WifiRouter -> CoreRouter
>>
>> Connection comes from inet to Netgear's public IP.  DMZ on Netgear=20
>> takes it to WifRouter's IP within the internal net of Netgear.  DMZ=20
>> on WifiRouter takes it to CoreRouter's IP.  CoreRouter is running=20
>> sshd and replies to WifiRouter.  WifiRouter does NOT forward the=20
>> packet to Netgear.  A state is established in ip_conntrack but never=
=20
>> matures beyond SYN_RECV status.  Here's the iptables of WifiRouter:
> [...]
>> And here's the relevant ip_conntrack entry of WifiRouter after a SYN=
=20
>> has been sent, and CoreRouter has properly transmitted a SYN+ACK bac=
k=20
>> @ WifiRouter:
>>
>> tcp      6 59 SYN_RECV src=3D98.233.248.36 dst=3D192.168.1.200=20
>> sport=3D50587 dport=3D22 src=3D192.168.44.17 dst=3D98.233.248.36 spo=
rt=3D22=20
>> dport=3D50587 use=3D1
> [...]
>> Why is the reply (SYN+ACK) not being associated with this SYN_RECV=20
>> state entry
>
> It is. The SYN_RECV states indicates that the SYN+ACK was successfull=
y=20
> associated to the connection. Otherwise the conntrack entry would sho=
w=20
> SYN_SENT and [UNREPLIED] instead.
>
>> and being propagated back out to the internet?
>
> No clue, sorry. Did you try to trace it through the iptables chains ?
> --=20
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


