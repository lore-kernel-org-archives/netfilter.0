From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: MASQUERADING
Date: Thu, 21 Jul 2005 14:09:40 +0200
Message-ID: <42DF9084.2060406@mnemon.de>
References: <04EE7AD0450F7B498BA216312943A1A102B5A7CA@blrse201.ap.infineon.com>
	<42DF84DC.7070007@mnemon.de>
	<Pine.LNX.4.61.0507211351150.9684@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0507211351150.9684@yvahk01.tjqt.qr>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Jan Engelhardt schrieb:
>>>Suppose I masquerade ppp0 using
>>>iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
>>>
>>>And now all packets will have a src ip addr as 192.168.0.2 will be
>>>changed to that of ppp0 , for example say 10.10.10.1
> 
> 
> No, it does not say "changed to that of ppp0" but:
> _change_all_packets_that_go_out_of_ppp0_ (...to the address belonging to ppp0)
> 
> 
>>>Now my question is, when the reply comes, their destination addr will be
>>>that of ppp0 i.e 10.10.10.1
>>>Who will reverse translate this 10.10.10.1 destination addr to actual
>>>192.168.0.2 ?
> 
> 
>>This is the job of connection tracking, basically ipt_conntrack.
> 
> 
> Nitpick: ip_conntrack.
> ipt_conntrack is the module for the -m conntrack match used by iptables.

Oohps - my fault :) Thanks for correction.

Have a nice time,

Joerg


