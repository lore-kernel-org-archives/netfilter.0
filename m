From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: MASQUERADING
Date: Thu, 21 Jul 2005 13:54:03 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507211351150.9684@yvahk01.tjqt.qr>
References: <04EE7AD0450F7B498BA216312943A1A102B5A7CA@blrse201.ap.infineon.com>
	<42DF84DC.7070007@mnemon.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42DF84DC.7070007@mnemon.de>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Cc: netfilter@lists.netfilter.org


>> Suppose I masquerade ppp0 using
>> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
>> 
>> And now all packets will have a src ip addr as 192.168.0.2 will be
>> changed to that of ppp0 , for example say 10.10.10.1

No, it does not say "changed to that of ppp0" but:
_change_all_packets_that_go_out_of_ppp0_ (...to the address belonging to ppp0)

>> Now my question is, when the reply comes, their destination addr will be
>> that of ppp0 i.e 10.10.10.1
>> Who will reverse translate this 10.10.10.1 destination addr to actual
>> 192.168.0.2 ?

>This is the job of connection tracking, basically ipt_conntrack.

Nitpick: ip_conntrack.
ipt_conntrack is the module for the -m conntrack match used by iptables.


Jan Engelhardt
-- 

