From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problems with Portforwarding
Date: Mon, 15 Mar 2004 21:59:27 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403152159.27405.Antony@Soft-Solutions.co.uk>
References: <405624A2.60906@imperium-noctem.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <405624A2.60906@imperium-noctem.de>
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

On Monday 15 March 2004 9:48 pm, Ronny Fauth wrote:

> Well i have a problem, i have a router/gateway with Redhat 9 running on it
> and i have 2 W2k Computers behind it. Now i want to forward some ports
> to the Windows-Clients, i have tried some configurations but i still get
> the "connection refused" error. Here the part of my script which belongs to
> the port-forwarding.

1. How are you testing these rules?

2. What does "iptables -L -nvx; iptables -L -t nat -nvx" show for these rules 
- do the packet/byte counters show that any packets are being processed?

Regards,

Antony.

-- 
Programming is a Dark Art, and it will always be. The programmer is
fighting against the two most destructive forces in the universe:
entropy and human stupidity. They're not things you can always
overcome with a "methodology" or on a schedule.

 - Damian Conway, Perl God

                                                     Please reply to the list;
                                                           please don't CC me.


