From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: SNAT
Date: Wed, 13 Nov 2002 14:48:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B32101998F@hslex01.hsl-brabantzuid.nl>
References: <002801c28b18$45b2d8e0$2c00a8c0@PERUCCHI>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002801c28b18$45b2d8e0$2c00a8c0@PERUCCHI>
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
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

> Everybody is talking about DNS tcp/udp. But I want know how I
> can do that my
> traffic go to out as my IP_NET and not another IP. I know
> that I have to use
> SNAT for to do this.
>
> My problem is that my DNS this going out with IP NAT(Masquerade)
> Somebody can help me

I thought I did reply to your question. Don't the SNAT/FORWARD rules work ?

In your first post you didn't mention any of your FORWARD rules, and I still
think you should match your traffic for dport 53 instead of sport 53. Unless
ofcourse there's something we don't know because you didn't tell us (do you
have a DNS server ? If so ; is your DNS server running on or behind the
firewall ?).
If you have policy set to DROP for the FORWARD chain then you have to add a
rule to allow traffic for port 53/udp/tcp or whatever you want to
accomplish.


Rob


