From: "Martijn Lievaart" <m@rtij.nl>
Subject: Re: Multiple IP addresses
Date: Mon, 27 Mar 2006 11:28:48 +0200 (CEST)
Message-ID: <26939.217.166.60.19.1143451728.squirrel@ma.rtij.nl>
References: <9a6de10603261753s33408f9cnb5ce6f9ae7b4f75d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9a6de10603261753s33408f9cnb5ce6f9ae7b4f75d@mail.gmail.com>
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
To: termina@gmail.com
Cc: netfilter@lists.netfilter.org

Will Twomey zei:
> I apologize if this is the wrong list, but...
>
> I would like to have several (3?) ip addresses on one interface (eth0,
> eth0:1, etc.), and forward each of those IP addresses to another
> interface (192.168.0.1, 192.168.1.1, 192.168.2.1, etc.)

What exactly do you mean? Do you want to send packets addressed to one of
those addresses to another ip? Or do you want to fake those addresses and
send them on to the machine that really has that address? Or do you want
to route packets not addressed to any of those addresses but based on the
address the previous router used as a next hop?

In the first case, just use DNAT. In the second case, create a static arp
entry and use normal routing rules. The third is not (easily) possible as
the packet that arrives just has the final IP destination and the MAC
address of eth0. Which is not enough information to figure out what IP was
used to route the packet.

Maybe you can explain better what you want to achieve?

M4




