From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Masquerading
Date: Wed, 23 Oct 2002 10:53:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210230953.g9N9rHL02331@vulcan.rissington.net>
References: <3DB49303.3050408@mclachlan.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DB49303.3050408@mclachlan.com.au>
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

On Tuesday 22 October 2002 12:51 am, Wilson Fletcher wrote:

> Just looking at iptables.

Welcome.

> Normally a reply to a masq'd packet coming into the network will
> have the destination IP of the g/w.

Correct (except remove the word 'normally' from the above sentence :-)

> So if the NAT for masq is done
> in POSTROUTING (after filtering) do I need to except INPUT packets
> to ports in the masquerading range (~61000:65535 ????) ?

No, because the INPUT chain is:
a) only for packets which finally arrive on the local machine
b) after the PREROUTING chain, where the reverse NAT will be automatically 
applied to reply packets, hence changing the Destination Address back to the 
original client.

> The Linux 2.4 Packet Filtering HOWTO appears to suggest that I can
> ignore the fact that I'm nat'ing and use forwarding rules for packets
> being masq'd and de-masq'd and that I do not need to worry about
> INPUT for packets that are going to my masq'd range.

This is correct.

INPUT is *only* for packets destined for the local machine (the one running 
netfilter), and this means after any DNAT has taken place.

FORWARD is only for packets destined for another machine, and this also means 
after any DNAT (automatic or specified in your rules) has taken place.

Remember also that if you specify a SNAT rule in your POSTROUTING chain, then 
netfilter will automagically apply the appropriate DNAT rule to the replies 
in your PREROUTING chain - you do not need to specify a rule to do this.

Antony.

-- 

You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

