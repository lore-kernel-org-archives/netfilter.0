From: David Leangen <dleangen@canada.com>
Subject: Re: Sharing Limited Internet Connection
Date: Sat, 03 Sep 2005 13:19:07 +0900
Message-ID: <4319243B.3030007@canada.com>
References: <025601c5afe2$21c119a0$0200a8c0@etpi> <4317FB85.2030209@my-mail.ch>
	<a0f69e505090204074a5f0dbb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e505090204074a5f0dbb@mail.gmail.com>
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
To: netfilter@lists.netfilter.org


Can somebody please explain something to me?

> # use MASQ if you get dynamic ip
> iptables -A POSTROUTING -t nat -o eth0 -j MASQUERADE

What's the difference between using "-o ppp0" and "-o eth0"? Obviously, 
one is using the ppp0 interface while the other is using the eth0 
interface. But in terms of what happens to the packets, what's the diff?

Out of curiosity, I tried both: ppp0 works, while eth0 does not.


Cheers,
Dave


