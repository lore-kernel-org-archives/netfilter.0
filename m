From: Julien <dyna@tri-oxyde.org>
Subject: Re: routing mail on a different gateway
Date: Fri, 23 Jul 2004 12:07:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4100E365.7030906@tri-oxyde.org>
References: <4100CB67.5060507@tri-oxyde.org> <20040723083455.GC7773@jgomez-p-latitude.asia.unity>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040723083455.GC7773@jgomez-p-latitude.asia.unity>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Julian Gomez wrote:

>On Fri, Jul 23, 2004 at 10:25:11AM +0200, Julien spoke thusly:
>
>  
>
>>Good Morning,
>>
>>I have a linux box with two dsl modems on it (connection is done via
>>pppoe), I'm trying to route default traffic on the primary connection
>>(ppp0) and mail traffic on another one (ppp1).
>>
>>This traffic should be able to come from the localhost or the lan via
>>NAT.
>>
>>I run Slackware 9.1 (Kernel 2.4.22), recompiled with necessary options
>>for using iproute2.
>>    
>>
>
>Okay. Do you have corresponding OUTPUT / FORWARD rules defined
>
Thanks to your hint, I found that I (silly) forgot to set output rules 
for ppp1. Now I can do that (that was not working before, packets were 
dropped)

ip route add to 213.41.143.209 via [gateway_ip] dev ppp1

and all traffic to 213.41.143.209 goes through ppp1.

But routing mail traffic on second gateway still doesn't work as I would 
like : packets are not dropped but mail traffic still goes through ppp0. 
Here is the output of ip route :

62.4.16.226 dev ppp0  proto kernel  scope link  src 62.212.120.196
193.253.160.3 dev ppp1  proto kernel  scope link  src 80.14.101.245
192.168.0.0/24 dev eth0  proto kernel  scope link  src 192.168.0.200
127.0.0.0/8 dev lo  scope link
default via 62.4.16.226 dev ppp0

62.212.120.196 is first isp's assigned ip
62.4.16.226 is first isp's gateway
193.253.160.3 is second isp's gateway
80.14.101.245 is second isp's ip (dynamic)

And the output from ip rule ls :
0:      from all lookup local
32765:  from all fwmark 0x1 lookup mail.out
32766:  from all lookup main
32767:  from all lookup default

Is there a way to check if packets are correctly marked ?

Thanks, Julien.


