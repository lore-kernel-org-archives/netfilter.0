From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: On vanilla Fedora 3, can't do a transparent proxy (-j REDIRECT)
Date: Mon, 02 May 2005 14:42:52 -0500
Message-ID: <427682BC.6000303@riverviewtech.net>
References: <df31c4040505021142197fdcdc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <df31c4040505021142197fdcdc@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

> /proc/sys/net/ipv4/ip_forward shows: 1

...

> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source               destination

I'm not trying to doubt you but either you took the info from iptables before any traffic has passed through the forward chain or there is a problem that is preventing traffic from traversing the forward chain.  You did say that you set ip_forward to 1 which should allow traffic to be forwarded.  Do an iptables -L -n -v to see if any traffic passing through your forward chain.



Grant. . . .

