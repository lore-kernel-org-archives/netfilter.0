From: Alexey Toptygin <alexeyt@freeshell.org>
Subject: Re: SNAT question
Date: Sat, 18 Sep 2004 21:46:24 +0000 (UTC)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <Pine.NEB.4.60.0409182138520.21976@ukato.freeshell.org>
References: <20040917181300.76253.qmail@web61109.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040917181300.76253.qmail@web61109.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: =?iso-8859-1?q?darmian=20martinez?= <darmianm@yahoo.com.ar>
Cc: netfilter@lists.netfilter.org

On Fri, 17 Sep 2004, [iso-8859-1] darmian martinez wrote:

> Alexey,
>
> I tried your command, but it says:
> iptables: Target problem

What I meant to say was:

iptables -t nat -A POSTROUTING -s [FIREWALL_IP] -p icmp -j SNAT --to-source
[FAKE_IP]

which applies, but for some reason works only for outgoing requests.


Can someone on the list explain why this:

iptables -t nat -A POSTROUTING -s 192.168.1.9 -p icmp -j SNAT --to-source
10.0.0.1

Causes this:

# tcpdump -nnvl -i eth0 "icmp"
tcpdump: listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes

17:37:38.781912 IP (tos 0x0, ttl  64, id 0, offset 0, flags [DF], length: 84)
10.0.0.1 > 192.168.1.2: icmp 64: echo request seq 1

17:37:49.656966 IP (tos 0x0, ttl  64, id 0, offset 0, flags [DF], length: 84)
192.168.1.181 > 192.168.1.9: icmp 64: echo request seq 1

17:37:49.656988 IP (tos 0x0, ttl  64, id 6381, offset 0, flags [none],
length: 84) 192.168.1.9 > 192.168.1.181: icmp 64: echo reply seq 1

Do locally generated ICMP replies not go through postrouting for some 
reason? I'm testing with iptables v1.2.9 and Debian kernel 2.6.7-1-k7.

 			Alexey

