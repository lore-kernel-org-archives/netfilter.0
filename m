From: Gerd Zemella <gzemella@gmx.net>
Subject: Re: string match?
Date: Fri, 07 Nov 2003 09:16:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068193006.1835.7.camel@Marvin>
References: <3FAB4BAF.8000107@postech.ac.kr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FAB4BAF.8000107@postech.ac.kr>
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
To: netfilter mailing lists <netfilter@lists.netfilter.org>

Hi,

have you tried the rules in the INPUT chain?
You connect to a local process on host_1 so FORWARD chain will not be
used.

Greetings 
Gerd

Am Fre, den 07.11.2003 schrieb Jin Gu, Kim um 08:37:
> Dear all.
> 
> How can I check if iptables string match support is enabled?
> 
> I applied patch-o-matic in order to use string match support and 
> recompiled kernel to support it.
> (iptables v1.2.8)
> 
> When done, I tried this
> 
> --> host_1# iptables -m string -h
> 
> ,which produced the related help file :
> 
> STRING match v1.2.9rc1 options:
> --string [!] string          Match a string in a packet
> --hex-string [!] string      Match a hex string in a packet
> host_1#
> 
> Does it mean that the support can be used?
> 
> If yes, when I tried this code, there was no message. What's wrong?
> 
> <Run>
> 
> --> host_1# iptables -A FORWARD -m string --string "test" -j LOG 
> --log-prefix "TEST: "
> --> host_1# iptables -A FORWARD -m string --string "test" -j DROP
> 
> Then I started a netcat server by :
> 
> --> host_1# nc -l -p 3456
> 
> I connected to this via :
> 
> --> host_2# telnet host_1 3456
> 
> and type
> 
> --> test
> --> test
> 
> 
> 
> I think this should yield some log or footprint. But I can't see any 
> messages related to this.
> 
> Furthermore, when I check "iptables -L -v", there was no records about it.
> 
> -->host_1# iptables -L -v
> ................
> Chain FORWARD (policy DROP 248 packets, 22560 bytes)
>  pkts bytes target     prot opt in     out     source               
> destination
>     0     0 LOG        all  --  any    any     anywhere             
> anywhere            STRING match test LOG level info prefix `TEST: '
>     0     0 DROP       all  --  any    any     anywhere             
> anywhere            STRING match test
> .....................
> 
> 
> 
> 
> What would be wrong?
> 
> 
> 


