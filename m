From: Jasbir Khehra <jasbir.k@gmail.com>
Subject: Re: NAT PREROUTING vs. filter FORWARD
Date: Fri, 20 Oct 2006 11:02:14 +0530
Message-ID: <45385F5E.5070408@gmail.com>
References: <8ca422820610191125k16f58f03t3ce33bd4e1d22c28@mail.gmail.com>
Reply-To: jasbir.k@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8ca422820610191125k16f58f03t3ce33bd4e1d22c28@mail.gmail.com>
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
To: Mike <1100100@gmail.com>
Cc: netfilter@lists.netfilter.org

Mike wrote:

> I'm having difficulty with clients connecting to a game I'm hosting
> over the internet.
> So I'm wondering if my PREROUTING rule is conflicting with my FORWARD 
> rule.
>
>
> Then I should not have to worry about these FORWARD rules interfering
> with the prerouted data getting to the server at 192.168.170.6 ---
>
> $IPTABLES -t filter -A FORWARD -i ppp0 -o eth1 -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -t filter -A FORWARD -i ppp0 -o eth2 -m state --state
> ESTABLISHED,RELATED -j ACCEPT
>
> Am I right or wrong?
> If wrong, is the only way then to change the FORWARD rule to -j ACCEPT
> and leave out the ESTABLISHED,RELATED requirement?

You just missing out on the rule to accept NEW state connections on your 
game ports
$IPTABLES -t filter -A FORWARD -i ppp0  -m state --state NEW -p tcp -m 
multiport --dports 34297,34397,34447  -j ACCEPT
Same rule for udp connections.

>
> Thanks for your time and assistance.
>
> Mike 

HTH,
Jasbir

