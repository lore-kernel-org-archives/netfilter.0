From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SSH Connections Lost After 1 minute idle
Date: Tue, 13 Jul 2004 22:18:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407132218.06134.Antony@Soft-Solutions.co.uk>
References: <20040713205716.58900.qmail@web40707.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040713205716.58900.qmail@web40707.mail.yahoo.com>
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

On Tuesday 13 July 2004 9:57 pm, Real Cucumber wrote:

> Why should ICMP not be completely blocked? The machine
> is used strictly as a port forwarding firewall/router.

Because blocking all ICMP will break networking.   Look up the RFCs explaining 
what ICMP is for if you do not understand this.

> Also it does appear to be arp related. On the fireawll
> the arp -a does not keep the connecting host in its
> cache for long.  If I connect I see it, but after a
> few minutes it disappears.  Is there anyway to fix
> that?

I am not certain of the exact solution to your problem.   It could be:

1. Hardware problem (NIC)
2. Due to your blocking ICMP (although I can't explain a complete reason why)
3. A strange network setup (you haven't described your physical network 
layout)
4. Something else ?

If you are having a problem with the arp cache on the firewall keeping the MAC 
address of the SSH server, can you check to see whether it successfuly 
retains the MAC addresses of other machines on your network?

A packet sniffer (eg: ethereal) between the firewall and the SSH server may 
show whether ARP requests are not being sent, or ARP reponses are not being 
returned.

Regards,

Antony.

-- 
Never automate fully anything that does not have a manual override capability. 
Never design anything that cannot work under degraded conditions in emergency.

                                                     Please reply to the list;
                                                           please don't CC me.


