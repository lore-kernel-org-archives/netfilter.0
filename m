From: "Marco Nicoloso" <nicolm@gmail.com>
Subject: Re: Cannot go out the firewall from internal network (NAT)
Date: Mon, 13 Nov 2006 19:09:24 +0300
Message-ID: <e8c943190611130809h26c96471k71d73bc733b1dfa1@mail.gmail.com>
References: <e8c943190611130715g6d88ccabu4d87bc6ecf3826d9@mail.gmail.com>
	<200611131639.14679.tommy@svearike.sytes.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200611131639.14679.tommy@svearike.sytes.net>
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
To: Tommy W <tommy@svearike.sytes.net>, netfilter@lists.netfilter.org

> Have you done this ?
>
> echo "1" > /proc/sys/net/ipv4/ip_forward
>
> In order to activate forwarding.
>
Yes, I had already done.

I found the file /proc/sys/net/ipv4/ip_nonlocal_bind which is set to
0, it is normal? NAT should bind IP addresses from the internal
network... it does anyway with this setting?

Marco Nicoloso

