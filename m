From: "Willem Oldeman" <willem@king-pin.nl>
Subject: Re: Rejecting udp
Date: Tue, 4 Mar 2003 01:08:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003f01c2e1e2$2d9bd100$0301a8c0@hotpop3>
References: <000801c2e1aa$3fc8f660$0200a8c0@klintan.local>
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
To: Michael K <micke@klintan.se>, netfilter@lists.netfilter.org

----- Original Message -----
From: "Michael K" <micke@klintan.se>
To: <netfilter@lists.netfilter.org>
Sent: Monday, March 03, 2003 6:28 PM
Subject: Rejecting udp


> I saw this rule someware on the net.
> $IPTABLES -A FORWARD -o $EXTERNALIF -p udp --dport 137 -j REJECT
>
> Whats the use to use reject on a UDP packet? Isn't udp connection-less
> A more correct shouldn't that be "-j DROP"? Or am I thinking wrong here?
>
> Regards Klintan
>

First of all: This has little to do with TCP or UDP (or connection-less
stuff).

Many firewalls have a policy to drop packets coming from the outside when
nothing on the inside has started communicating to the internet (outside).
But, port 137 is part of the SMB (filesharing) protocol. It starts inside
your network, broadcasting that services are available. The firewall will
see this as legitimate traffic, since it started on the inside.
If you wouldn't block port 137, you'd be broadcasting to the internet that
you have filesharing enabled on your network, thereby opening up port 137 to
the internet, as the firewall sees no danger.
The next step for a cracker would be easy, get into your filesharing
network, steal passwords or worse...
Simply: Things that "You Don't Want to Happen" (TM).

Short answer: You do want to filter port 137 (and 138/139).

A good approach is to block all traffic to the firewall/internet from the
inside, then open op ports (POP, SMTP, HTTP and other services) as needed,
but no more then what's needed.

HTH,
Willem


