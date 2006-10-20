From: "Martijn Lievaart" <m@rtij.nl>
Subject: Re: NAT PREROUTING vs. filter FORWARD
Date: Fri, 20 Oct 2006 17:14:21 +0200 (CEST)
Message-ID: <30518.3385652073$1161357417@news.gmane.org>
References: <8ca422820610191125k16f58f03t3ce33bd4e1d22c28@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Mike <1100100@gmail.com>
Cc: netfilter@lists.netfilter.org

<citaat van="Mike">
> I'm having difficulty with clients connecting to a game I'm hosting
> over the internet.
> So I'm wondering if my PREROUTING rule is conflicting with my FORWARD
> rule.
>
> If I have these prerouting rules:
>
>  $IPTABLES -t nat -A PREROUTING -p tcp --dport 34297 -i ppp0 -j DNAT
> --to-destination 192.168.170.6
> $IPTABLES -t nat -A PREROUTING -p udp --dport 34297 -i ppp0 -j DNAT
> --to-destination 192.168.170.6
> $IPTABLES -t nat -A PREROUTING -p tcp --dport 34397 -i ppp0 -j DNAT
> --to-destination 192.168.170.6
> $IPTABLES -t nat -A PREROUTING -p udp --dport 34397 -i ppp0 -j DNAT
> --to-destination 192.168.170.6
> $IPTABLES -t nat -A PREROUTING -p tcp --dport 34447 -i ppp0 -j DNAT
> --to-destination 192.168.170.6
> $IPTABLES -t nat -A PREROUTING -p udp --dport 34447 -i ppp0 -j DNAT
> --to-destination 192.168.170.6
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
`
You have to ACCEPT these packets in your forward chain. What I generally
do (but I generate this with a script) is to duplicate the rules in
PREROUTING, once with -j MARK and once with -j DNAT, In FORWARD I then use
--mark to accept those DNATted connections all in one rule.

HTH,
M4


