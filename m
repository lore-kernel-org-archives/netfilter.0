From: cc <cc@belfordhk.com>
Subject: Re: Reaching internal computers through the external ipaddress inside
 private network
Date: Thu, 22 Apr 2004 12:47:18 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40874E56.80503@belfordhk.com>
References: <40850EA0.7090206@dev.null.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40850EA0.7090206@dev.null.se>
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

Christopher Abrahamsson sighed and wrote::

> Hi
>
> I've been trying to solve this problem for quite some time now, but i
> can't really figure out how...
> Here's my current setup:
>                               _ my computer (10.0.0.3)
>                              |
> internet - iptables gateway -|- my server(web, mail etc) (10.0.0.2)
>             (212.181.43.20)  |
>                              |_ a bunch of other computers (10.0.0.x)
>
>
I believe you firstly need to do a NAT prerouting and then after the
forward lines, you need a POSTROUTING NAT command.  Here's my
stab at this, given your situation:


iptables -t nat -A PREROUTING -i eth1 -p tcp -d 212.181.43.20 \
               --dport 80 -j DNAT --to 10.0.0.2

#not too sure if the next line is needed.
iptables -A FORWARD -i eth1 -p tcp --dport 80 -j ACCEPT

iptables -t nat -A POSTROUTING -o eth1 -p tcp --dst 10.0.0.2 \
           --dport 80 -s 10.0.0.3 -j SNAT --to-source 212.181.43.20

Mind you, I think the last line above, the --to-source should be
pointing to your gateway's internal IP and not the external one.
If your gateway's internal IP is 10.0.0.20, then the above should
be:

iptables -t nat -A POSTROUTING -o eth1 -p tcp --dst 10.0.0.2 \
           --dport 80 -s 10.0.0.3 -j SNAT --to-source 10.0.0.20

Can someone point out if I got the above correct?

Edmund


