From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: What is missed for port forwarding
Date: Sat, 6 Mar 2004 18:47:28 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403061847.28569.Antony@Soft-Solutions.co.uk>
References: <20040306183657.GB836@glorybox.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040306183657.GB836@glorybox.de>
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

On Saturday 06 March 2004 6:36 pm, Kai Weber wrote:

> I have a router where only masquerading and some QOS is enabled. I have
> a problem with port forwarding HTTP.
>
> The only rules I use (sorry for long lines):

(Sorry my mailer has wrapped them)

> $IPTABLES -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> $IPTABLES -t nat -A PREROUTING -p tcp --dport 10143 -j DNAT --to
> 192.168.1.2:22
> $IPTABLES -t nat -A PREROUTING -p tcp --dport 8888 -i ppp0
> -j DNAT --to 192.168.1.2:80
>
> The first DNAT rule works without a problem. I can ssh directly to my
> machine.

Which machine is that (192.168.1.2)?   Is it the machine running the above 
rules, or another machine on yur internal LAN, with packets being routed by 
the netfilter box?

> But the requests to port 8888 seems not to be answered or come
> through. To bad I only have switch which has no port mirroring to listen
> to the whole traffic and find out the problem.
>
> Any ideas what I should try or I miss?

Do you have a FORWARD rule allowing traffic to 192.168.1.2:80?

Do you have a rule allowing the reply packets (probably an ESTABLISHED,RELATED 
rule)?

What happens if you telnet to port 80 on 192.168.1.2?   Is there a service 
listening on that port?

Antony.

-- 
If builders made buildings the way programmers write programs, then the first 
woodpecker to come along would destroy civilisation.

                                                     Please reply to the list;
                                                           please don't CC me.


