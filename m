From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DMZ to DMT through ROUTER problem !
Date: Thu, 20 May 2004 17:07:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405201707.30559.Antony@Soft-Solutions.co.uk>
References: <200405201318.34706.liste@zerozone.it> <200405201607.10019.Antony@Soft-Solutions.co.uk> <200405201753.40647.liste@zerozone.it>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405201753.40647.liste@zerozone.it>
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

On Thursday 20 May 2004 4:53 pm, O-Zone wrote:

> On Thursday 20 May 2004 17:07, Antony Stone wrote:
> > If you do not in fact already have the PREROUTING DNAT rules, then what
> > do you mean by "Each DMZ server is mapped to its PUBLIC IP"?   Maybe I
> > misunderstood what you have already done, and already have working, and
> > what problem is still left to solve?
>
> Here's the problem (TCPDUMP on 192.168.0.1):
> root@bastion:/etc/rc.d# tcpdump -i eth2 dst 151.8.47.B
> 17:45:52.507152 IP 192.168.0.2.45621 > 151.8.47.B.pop3: S
> 1931786477:1931786477(0) win 5840 <mss 1460,sackOK,timestamp
>
> but on 151.8.47.B (192.168.0.3) no any packet arrive. This is a piece of
> rc.firewall:

What about the rest of rc.firewall?   You have posted your POSTROUTING SNAT 
rules - do you have any PREROUTING DNAT rules to convert 151.8.47.B into 
192.168.0.3?

If you do not have any PREROUTING rules, I remain confused about how this was 
already working from the Internet as you said previously, but try:

iptables -A PREROUTING -t nat -p tcp --dport 110 -d 151.8.47.B -j DNAT --to 
192.168.0.3

Regards,

Antony.

-- 
There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

                                                     Please reply to the list;
                                                           please don't CC me.


