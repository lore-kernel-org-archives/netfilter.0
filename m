From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Multiple conditions for logging packets
Date: Mon, 23 Sep 2002 13:15:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209231215.g8NCFbv24344@vulcan.rissington.net>
References: <09d001c262f1$50f418d0$0200a8c0@bart>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09d001c262f1$50f418d0$0200a8c0@bart>
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

On Monday 23 September 2002 12:06 pm, Matt Parlane wrote:

> Hi list...
>
> I have a simple linux machine acting as a firewall/gateway, and I'm after a
> way to specify multiple conditions for rules.  Basically I want to create a
> rule for packets which are either coming from or going to the internet -
> not packets which are both sourced and destined for the local network.
>
> I haven't been able to do this so far using iptables rules.  Does anyone
> have any ideas about how this might be achieved?

Intriguing question.

1. Why would you have packets both sourced from and destined to the local 
network going through your firewall anyway (maybe you have multiple internal 
networks) ?

2. What's the problem with simply having two rules one after another, the 
first of which logs packets coming in from the Internet, the second of which 
logs packets going to the Internet ?   Both rules together end up doing the 
job you want, and no packet is ever going to match both rules.

3. Depending on what you want to do, can you handle the problem by first 
getting rid of packets both from & to the internal network, then logging 
what's left ?
eg:
iptables -N log-stuff-to-or-from-internet
iptables -A log-stuff-to-or-from-internet -i $intIF -o $intIF -j RETURN
any packets which get this far are not local-to-local
iptables -A FORWARD -j log-stuff-to-or-from-internet

alternatively if you have one external interface and more than one internal 
interface, then you can identify local packets by the fact they do not go 
through the external internface, instead of by the fact that they do go 
through the internal interface:

iptables -N log-stuff-to-or-from-internet
iptables -A log-stuff-to-or-from-internet -i ! $extIF -o ! $extIF -j RETURN
any packets which get this far must have either -i or -o = $extIF

Does this help ?

Antony.

-- 

The first ninety percent of an engineering project takes ninety percent
of the time, and the last ten percent takes the remaining ninety percent.

