From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: two subnets...
Date: Tue, 31 Jul 2007 18:28:59 -0500
Message-ID: <46AFC5BB.7050701@riverviewtech.net>
References: <46ADBDF0.3020200@mp.pl>	<46AF4FC7.1000500@riverviewtech.net>	<46AF8D63.8080900@interia.pl>	<46AF9694.1060709@riverviewtech.net>
	<46AFBA57.3040702@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46AFBA57.3040702@mailinator.com>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 7/31/2007 5:40 PM, Mike Wright wrote:
> Your knowledge never cease to amaze me.

*nod*  Thank you.  I like to share my trials and tribulations with 
others so that they do not have to fight the same problems that I have 
had to fight.  I'm still working on getting our sales staff to not write 
such big checks with their moths that I can hardly cash with my sweat.

> Could one use iptables to do this?

Possibly.  If you enable the "Bridged IP/ARP packets filtering" 
(CONFIG_BRIDGE_NETFILTER) support in the kernel, yes IPTables would be 
able to filter this.  However I do not know if it would be better to do 
this with EBTables or IPTables.  The only thing that I can say to this 
effect is that EBTables is (native) OSI Layer 2 and IPTables is (native) 
OSI Layer 3+.  With the "Bridged IP/ARP packets filtering" option 
enabled, you can use the OSI Layer 3+ features of IPTables on OSI Layer 
2, however you are using a higher layer and more complex match than is 
in my opinion really needed.  I think it would be akin to opening up 
Excel to calculate some numbers via formula verses using calculator. 
Seeing as how EBTables is (native) OSI Layer 2, which is where you are 
really needing to do you work, I think it would be a better solution.

Question, does the box that you are adding this 3rd NIC to already have 
IPTables set up and installed?  If the answer is yes, I suppose that it 
would work just fine.  If the answer is no (you are doing your SNAT / 
Masquerading elsewhere) then EBTables's basic match of in / out 
interface may work just as easily.  Consider the complexity of what is 
in kernel.

If you do do your NATing / Masquerading on the system in question, you 
could have (for maintenance reasons) a clear separation of where your 
OSI Layer 2 and OSI Layer 3 filtering is done, with EBTables and 
IPTables respectively.

If you are concerned about needing to learn a new filtering structure 
and command syntax, don't be as EBTables is so similar to IPTables that 
it is uncanny.  Incidentally so is ARPTables from what I remember.  Nor 
do I think this similarity is by accident.

> -A FORWARD -physdev --physdev-in eth0 --physdev-out eth2 -j DROP
> -A FORWARD -physdev --physdev-in eth2 --physdev-out eth0 -j DROP
> -A FORWARD -j ACCEPT

I have never worked with the physdev match extension so I can not say 
for sure.  I do not recall which features were being taken out of main 
line NetFilter code, but I want to say that physdev was one of them, 
thus meaning you would have to keep patching the kernel when you upgrade 
to make this work.  Thus in my opinion making the EBTables option more 
maintainable and thus more appealing.


> Regardless, I'd still be very interested in seeing the ebtables 
> ruleset to accomplish this.

ebtables -A FORWARD -i eth0 -o eth2 -j DROP
ebtables -A FORWARD -i eth2 -o eth0 -j DROP

Note, you do not need to set the ACCEPT target because the default 
policy is to ACCEPT.

> Thanks,

*nod*

> ps pls reply to list; my email is a throwaway.

No problem.  I generally only reply to the list / news group unless 
explicitly asked to do so.  That way the answer is in the archives for 
others to benefit from.



Grant. . . .

