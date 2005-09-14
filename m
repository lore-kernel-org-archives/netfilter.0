From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: 1. Switch Flooding 2. Chains traversal
Date: Wed, 14 Sep 2005 11:27:04 -0500
Message-ID: <43284F58.5020702@riverviewtech.net>
References: <acf1defa050913213555e04129@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <acf1defa050913213555e04129@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

venkata subramanian wrote:
> Hi,
> 1. Switch Flooding
>        We have a nice problem in our organisation. Due to viruses,
> some windows machine or the other starts flooding the network with
> packets. And, in the end, one of our switches comes down making us to
> manually restart the switch.
>        I don't (intuitively) see how iptables can help in this
> scenario.... But, I want to know whether any solution exists to this?
> If I make all the machine's gateway as a linux system, and rate limit
> the packets there will it help?
>     
> 2. Chain traversal
>        Why is this chain traversal looking complicated? if there is
> atleast one rule in every inbuilt chain, it seems that there are many
> possible permutations of the chain traversal. How do you guys manage
> with it?

Basically you are dealing with a different issue when a switch can not handle things.  Seeing as how the switch is (usually) the device that all your client computers are connected to and then uplinked in to your firewall / router the firewall / router will not be able to do much for you at all if the problem is in the physical path before the traffic reaches it.  The best thing that I can think of would be to find out why the switch failed and possibly replace it.

If it was b/c of the ARPing issue mentioned by lst_hoe01 you may want to see if you could not have a process run on your firewall / router (or another system) that would answer all the ARP requests and receive the traffic so that the switch did not get confused and thus crash.  But that is not a very nice thing to do to a system any way.  In short sniff the traffic and see if it is something that can be mitigated.  You may want to look at putting an IDS in place to detect the traffic and respond to it before your switch goes down (presuming that there was a degradation period before the switch crashed).  You may be able to have an IDS detect that a port is going nuts and shut it down via SNMP management to the switch that it is connected to.



Grant. . . .

