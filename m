From: "John Black" <black@arbbs.net>
Subject: Re: netfilter question
Date: Thu, 19 Feb 2004 07:06:22 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000501c3f6e9$3d4a53c0$ed02fea9@black>
References: <004f01c3f699$0ad70a00$ed02fea9@black> <008301c3f6c1$1cbceb90$6a02a8c0@klemen>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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


> $IPT -A POSTROUTING -t nat -s $IP_LAN_RNG -o $IF_NET -j SNAT --to-source
> $IP_NET
i have that line in my firewall script. but it still doesn't mask my
internet work

> That is for routing. If you want to secure your network and the router
> itselfe it takes alot more .. like setting up a firewall :)
>
I have that part setup.  All ports a block but the ones that I need. the
firewall will drop all pings to the outside nic and inside nic.  I just have
to mask the internal network


