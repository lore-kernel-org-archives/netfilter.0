From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to drop/reject packets amongst LAN clients?
Date: Mon, 10 May 2004 17:43:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405101743.54501.Antony@Soft-Solutions.co.uk>
References: <1084206191.409fac6f1176a@webmail.floog.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1084206191.409fac6f1176a@webmail.floog.net>
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

On Monday 10 May 2004 5:23 pm, michael@floog.net wrote:

> The LAN currently has 5 computers connected to it with static IP
> addresses:
>
> 192.168.1.2
> 192.168.1.3
> 192.168.1.4
> 192.168.1.5
> 192.168.1.6
>
> I will be adding 3 more machines with with static IP addresses:
>
> 192.168.1.7
> 192.168.1.8
> 192.168.1.9
>
> Issue:
>
> *.9 needs to remain accessible from *.7 and *.8; however, I need to
> restrict any connection or accessibility to *.9 from *.2 - *.6.

Netfilter (on the gateway router) is no use to you here, because packets 
between machines on the same subnet do not go through the router - they just 
talk to each other directly across your hub / switch.

Install netfilter on 192.168.1.9 and put rules in the INPUT chain:

iptables -A INPUT -A INPUT -s 192.168.1.7 -j ACCEPT
iptables -A INPUT -A INPUT -s 192.168.1.0/29 -j DROP

Regards,

Antony.

-- 
The idea that Bill Gates appeared like a knight in shining armour to lead all 
customers out of a mire of technological chaos neatly ignores the fact that 
it was he who, by peddling second-rate technology, led them into it in the 
first place.

 - Douglas Adams in The Guardian, 25th August 1995

                                                     Please reply to the list;
                                                           please don't CC me.


