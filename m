From: Guilherme Cesar Soares Ruppert <ruppert@las.ic.unicamp.br>
Subject: Re: How to drop ping silently??
Date: Thu, 27 Jan 2005 13:21:15 -0200 (BRST)
Message-ID: <Pine.LNX.4.61.0501271207150.20294@quasar.las.ic.unicamp.br>
References: <Pine.LNX.4.61.0501270958520.18509@quasar.las.ic.unicamp.br>
	<23331.142.169.215.10.1106832640.squirrel@142.169.215.10>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <23331.142.169.215.10.1106832640.squirrel@142.169.215.10>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Samuel Jean <sj-netfilter@cookinglinux.org>
Cc: netfilter@lists.netfilter.org


> Use -j REJECT instead of -j DROP. You cannot act like if ping was received
> on the other side tho.

I tried REJECT and it didn't worked:
$ iptables -A OUTPUT -p icmp -j REJECT
PING 10.1.1.2 (10.1.1.2) 56(84) bytes of data.
ping: sendmsg: Operation not permitted

I do NOT want to act like if ping was received on the other side. I just 
want to avoid this error message "operation not permitted" acting like 
ping (echo request) was successfully sent. So ping won't receive any reply 
nor any error message.


> Depends what you want the user to see.
> Maybe some more info would help ?

I just need to drop the packets on the OUTPUT chain without let the sender 
app know that these packets were dropped. Ping is returning an error when 
I drop his packets and I want to avoid it.

Tks for the Help


