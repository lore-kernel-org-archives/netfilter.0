From: Mike <1100100@gmail.com>
Subject: Re: NAT PREROUTING vs. filter FORWARD
Date: Fri, 20 Oct 2006 13:04:31 -0400
Message-ID: <8ca422820610201004w4fe2091bnbdb4fbba7a0b5b6@mail.gmail.com>
References: <8ca422820610191125k16f58f03t3ce33bd4e1d22c28@mail.gmail.com>
	<4429765974127559812@unknownmsgid>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4429765974127559812@unknownmsgid>
Content-Disposition: inline
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
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org

Martijn,
The sciprt idea sounds quite clever and efficient!
I would be very interested to see your method by script, if it is not
a security risk, etc.
Thank you very much for your response and idea.
Mike

On 10/20/06, Martijn Lievaart <m@rtij.nl> wrote:
> <citaat van="Mike">
> > I'm having difficulty with clients connecting to a game I'm hosting
> > over the internet.
> > So I'm wondering if my PREROUTING rule is conflicting with my FORWARD
> > rule.
> >
> > If I have these prerouting rules:
> >
> >  $IPTABLES -t nat -A PREROUTING -p tcp --dport 34297 -i ppp0 -j DNAT
> > --to-destination 192.168.170.6
> > $IPTABLES -t nat -A PREROUTING -p udp --dport 34297 -i ppp0 -j DNAT
> > --to-destination 192.168.170.6
> > $IPTABLES -t nat -A PREROUTING -p tcp --dport 34397 -i ppp0 -j DNAT
> > --to-destination 192.168.170.6
> > $IPTABLES -t nat -A PREROUTING -p udp --dport 34397 -i ppp0 -j DNAT
> > --to-destination 192.168.170.6
> > $IPTABLES -t nat -A PREROUTING -p tcp --dport 34447 -i ppp0 -j DNAT
> > --to-destination 192.168.170.6
> > $IPTABLES -t nat -A PREROUTING -p udp --dport 34447 -i ppp0 -j DNAT
> > --to-destination 192.168.170.6
> >
> > Then I should not have to worry about these FORWARD rules interfering
> > with the prerouted data getting to the server at 192.168.170.6 ---
> >
> > $IPTABLES -t filter -A FORWARD -i ppp0 -o eth1 -m state --state
> > ESTABLISHED,RELATED -j ACCEPT
> > $IPTABLES -t filter -A FORWARD -i ppp0 -o eth2 -m state --state
> > ESTABLISHED,RELATED -j ACCEPT
> >
> > Am I right or wrong?
> > If wrong, is the only way then to change the FORWARD rule to -j ACCEPT
> > and leave out the ESTABLISHED,RELATED requirement?
> `
> You have to ACCEPT these packets in your forward chain. What I generally
> do (but I generate this with a script) is to duplicate the rules in
> PREROUTING, once with -j MARK and once with -j DNAT, In FORWARD I then use
> --mark to accept those DNATted connections all in one rule.
>
> HTH,
> M4
>
>

